local Biu = {}

local OpData = require "Op"
local util = require "Util"

local op = OpData.op
local createOBf = OpData.createOBf

local tostr, tEqual, split = util.tostr, util.tEqual, util.split

local Observable = {}
Observable.__index = Observable
Observable.__tostring = util.constant('Observable')

local State = setmetatable({}, Observable)
State.__index = State
State.__tostring = util.constant('State')

local combinData, vofk, isObservable, isState

isObservable = function(object)
  if not type(object) == 'table' then
    return false
  end
  local mt = getmetatable(object)
  if not mt then
    return
  end
    return mt.__index == State or mt.__index == Observable
end

isState = function(object)
  if not type(object) == 'table' then
    return false
  end
  local mt = getmetatable(object)
  if not mt then
    return
  end
    return mt.__index == State
end

vofk = function (keyArr, v, index)
  index = index or 1
  if #keyArr >= index then
    local k = keyArr[index]
    local nextV
    if type(v) ~= "table" then
      return nil
    elseif isObservable(v) then
      local args = {}
      for i=index, #keyArr do
        args[#args+1] = keyArr[i]
      end
      return v:get(util.unpack(args))
    else
      nextV = v[k]
      return vofk(keyArr,nextV, index+1)
    end
  else
    return v
  end
end

local isNode = function (v)
	return (type(v) == "table" 
			and type(v.is) == "function" 
			and v:is(HFLNode))
end

combinData = function (to, from)
  if to == nil then
    return from
  end

  if type(to) ~= "table" or isObservable(to) or isNode(to) then
  	if not isObservable(to) then
    	return to
    else
    	return nil
    end
  end

  local newTo = {}
  for k,v in pairs(to) do
  	if not isObservable(v) then
    	newTo[k] = v
    end
  end

   if type(from) ~= "table" or isObservable(from) or isNode(from) then
   	  for k,v in pairs(newTo) do
   	  	if v == "_delete" then
   	  		newTo[k] = nil
   	  	end
   	  end
      return newTo
  end

  local minDeleteNumber
  for k,v in pairs(from) do
  	if type(k) == "number" then
	    if newTo[k] ~= "_delete" then
	      if minDeleteNumber and k > minDeleteNumber then
	      	newTo[k] = nil
	      else
		      newTo[k] = combinData(newTo[k], v)
		  end
	    else
	      if not minDeleteNumber then
	      	minDeleteNumber = k
	      else
	      	minDeleteNumber = math.min(minDeleteNumber, k)
	      end
	      newTo[k] = nil
	    end
	else
	    if newTo[k] ~= "_delete" then
	      newTo[k] = combinData(newTo[k], v)
	    else
	      newTo[k] = nil
	    end
	end
  end

  for k,v in pairs(newTo) do
  	if v == "_delete" then
    	newTo[k] = nil
    end
  end
  return newTo
end


for k,v in pairs(op) do
	Observable[k] = function (self, ... )
		local args = {...}
		for i,v in ipairs(args) do
			if isObservable(v) then
				args[i] = v._subscribe
			elseif k == "flatMap" then
				args[i] = function ( ... )
					return v(...)._subscribe
				end
			end
		end
		local f = v(util.unpack(args))
		if k == "value" then
			local ret
			f(self._subscribe)(function (v)
				ret = v
			end)
			if ret.firstNoK and #ret.data == 1 then
				return ret.data[1]
			else
				return ret.data
			end
		else
			return Biu:createOB(f(self._subscribe))
		end
	end
end


function Observable:subscribe(onNext, onFinish)
	assert(isState(onNext) or type(onNext) == "function", "onNext type error")
	if isState(onNext) then
		return self._subscribe(function (...)
			onNext:set(...)
		end, function ( ... )
		end)
	else
		return self._subscribe(onNext, onFinish)
	end
end

function Observable:run()
	return self:subscribe(util.noop)
end

function State:v(...)
  local keyArr = {...}
  return vofk(keyArr, self._value)
end

local getAllOB
getAllOB = function (data, result, key)
	if type(data) ~= "table" then
		return
	end
	for k,v in pairs(data) do
		local newK = key and key .. "," .. k or k
		if isObservable(v) then
			result[newK] = v
		elseif type(v) == "table" and not (isNode(v)) then
			getAllOB(v, result, newK)
		end
	end
end

function State:get( ... )
	local keyArr = {...}
	return self:map(function (v)
		if vofk(keyArr, v) ~= nil then
			return vofk(keyArr,self._value)
		end
	end):filter(function (v)
		return v ~= nil
	end)
end

function State:getMap(f)
  return self:get():map(f)
end

function State:any( ... )
	local keyArr = {...}
	for i,v in ipairs(keyArr) do
		if type(v) ~= "table" then
			if type(v) ~= "string" then
			    keyArr[i] = {v}
			else
				keyArr[i] = util.split(v, ".")
			end
		end
	end
	return self:get():select(function (v)
		local hadOne = false
		for i,keys in ipairs(keyArr) do
			if vofk(keys, v) ~= nil then
			  hadOne = true
			  break
			end
		end
		return hadOne
	end):map(function (v)
		local ret = {}
		for i,keys in ipairs(keyArr) do
			ret[i] = vofk(keys, self._value)
		end
		return ret
	end):unpack()
end

function State:set(data, ...)
  local nextData = data
  local all = {}
  local hash = {}
  -- util.dump(data, "test in set")
  getAllOB(data, all)
  -- util.dump(all, "test result")
  for k,v in pairs(all) do
  	-- print(k)
  	local arr = split(k, ",")
	-- util.dump(arr, "test arr")
  	if hash[k] and type(hash[k]) == "function" then hash[k]() end
  	hash[k] = v:map(function (v)
  		local ret
  		for i=#arr,1,-1 do
  			local key = arr[i]
  			ret = {}
  			ret[key] = v
  			v = ret
  		end
  		return ret
  	end):subscribe(self)
  end

  -- util.dump(self._value, "befor combin")
  -- util.dump(data, "befor combin")
  self._value = combinData(data, self._value)
  -- util.dump(self._value, "after combin")
  if nextData ~= nil then
  	-- util.dump( nextData, "test nextData")
    if not self.stopped then
      local allKey = util.keys(self.observers)
      table.sort( allKey, function (order1, order2)
        return tonumber(order1) > tonumber(order2)
      end)

      for i,order in ipairs(allKey) do
        local orderArr = self.observers[order]
        for ii = #orderArr, 1, -1 do
          orderArr[ii][1](nextData, ...)
        end
      end
    end
  end
end

function State:finish( ... )
  if not self.stopped then
    local allKey = util.keys(self.observers)
    table.sort( allKey, function (order1, order2)
      return tonumber(order1) > tonumber(order2)
    end)
    for i,order in ipairs(allKey) do
      local orderArr = self.observers[order]
      for ii = #orderArr, 1, -1 do
        orderArr[ii][2]()
      end
    end
    self.stopped = true
  end
end

State.onCompleted = State.finish

function State:order(order)
  return Biu:createState(self, order)
end

function State:subscribe(onNext, onFinish, order)
	if onNext == nil then
		onNext = util.noop
	end
	if onFinish == nil then
		onFinish = util.noop
	end
  	order = order or 1
	local orderArr = self.observers[order]
	if not orderArr then
	    orderArr = {}
	    self.observers[order] = orderArr
	end

	local newNext, newFinish

	if isState(onNext) then
		newNext = function ( ... )
	    	onNext:set(...)
	    end
	    newFinish = util.noop
	else
		newNext, newFinish = onNext, onFinish
	end
    table.insert(orderArr, {newNext, newFinish})

    local subscription = function()
      for i = 1, #orderArr do
	        if orderArr[i][1] == newNext and orderArr[i][2] == newFinish then
		        table.remove(orderArr, i)
		        return
	        end
      end
    end
    if self._value ~= nil then
    	-- util.dump(self._value, "call newNext")
      	newNext(self._value)
    end
    return subscription
end

function Biu:isObservable( ... )
	return isObservable(...)
end

function Biu:isState( ... )
	return isState(...)
end

function Biu:diff( ... )
	return util.diff(...)
end

function Biu:createOB(f)
  local self = {
    _subscribe = createOBf(f)
  }
  return setmetatable(self, Observable)
end

function Biu:createState(data, order)
  local self
  self = {
    observers = {},
    stopped = false,
    _subscribe = function (onNext, onFinish)
		return self:subscribe(onNext, onFinish)
	end
  }
  setmetatable(self, State)
  if isObservable(data) then
    data:subscribe(self, nil, order)
  else
    self:set(data)
  end

  return self
end

function Biu:of(...)
	local args = {...}
	return Biu:createOB(function (onNext, onFinish)
		for i,v in ipairs(args) do
			onNext(v)
		end
		onFinish()
	end)
end

function Biu:fromArr(v)
	return Biu:createOB(function (onNext, onFinish)
		for i,v in ipairs(v) do
			onNext(v,i)
		end
		onFinish()
	end)
end

function Biu:fromObj(v)
	return Biu:createOB(function (onNext, onFinish)
		for k,v in pairs(v) do
			onNext(v, k)
		end
		onFinish()
	end)
end

function Biu:fromRange(from, to)
	return Biu:createOB(function (onNext, onFinish)
		for i=from,to do
			onNext(i,i)
		end
		onFinish()
	end)
end

function Biu:promise(f, ...)
	local args = {...}
	return Biu:createOB(function (onNext, onFinish)
		f(onFinish, util.unpack(args))
	end)
end

function Biu:zip( ... )
	local sources = util.pack(...)
	local count = #sources
	return Biu:createOB(function (onNext, onFinish)
	    local values = {}
	    local active = {}
	    local subscriptions = {}
	    for i = 1, count do
	        values[i] = {n = 0}
	        active[i] = true
	    end

	    local function newNext(i)
		    return function(value)
		        table.insert(values[i], value)
		        values[i].n = values[i].n + 1

		        local ready = true
		        for i = 1, count do
		          if values[i].n == 0 then
		            ready = false
		            break
		          end
		        end

		        if ready then
		          local payload = {}

		          for i = 1, count do
		            payload[i] = table.remove(values[i], 1)
		            values[i].n = values[i].n - 1
		          end

		          onNext(util.unpack(payload))
		        end
		    end
	    end

	    local function newFinish(i)
		    return function()
		        active[i] = nil
		        if not next(active) or values[i].n == 0 then
		          return onFinish()
		        end
		    end
	    end

	    for i = 1, count do
	        subscriptions[i] = sources[i]:subscribe(newNext(i), newFinish(i))
	    end

	    return function()
		    for i = 1, count do
		        if subscriptions[i] then subscriptions[i]() end
		    end
	    end
	end)
end

return Biu