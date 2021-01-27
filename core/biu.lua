-- render.lua
local rx = require "lib.rx"

local StateSubject = setmetatable({}, rx.Subject)
StateSubject.__index = StateSubject
StateSubject.__tostring = rx.util.constant('StateSubject')

local isState = function(object)
	if not type(object) == 'table' then
		return false
	end
	local mt = getmetatable(object)
	if not mt then
		return
	end
  	return mt.__index == StateSubject or mt.__index == rx.Observable
end


function rx.Observable:get(key, ...)
  if not key then return self:distinctUntilChanged(tEqual) end
  local args = {...}
  local innerSubscription
  if type(key) ~= 'string' and type(key) ~= 'number' and not isState(key) then
    return rx.Observable.throw('get key must be  string number state')
  end
  if not isState(key) then
	  return self:flatMapLatest(function (t)
		local newOb
		if type(t) == "table" then
			local v = t[key]
			if isState(v) then
				newOb = v
			else
		      	newOb = rx.Observable.of(v)
		  	end
		else
		   newOb = rx.Observable.of(nil)
		end
		return newOb
	  end):get(rx.util.unpack(args))
  else
  	return key:flatMapLatest(function (arr)
		if type(arr) ~= "table" then 
			return self:get(arr)
		else
			return self:get(rx.util.unpack(arr))
		end
	end)
  end
end


function StateSubject.create(data)
  assert(type(data) == "table", "StateSubject must create with table data.")
  local self = {
    observers = {},
    stopped = false
  }
  self.value = data

  return setmetatable(self, StateSubject)
end

function StateSubject:subscribe(onNext, onError, onCompleted)
  local observer

  if rx.util.isa(onNext, Observer) then
    observer = onNext
  else
    observer = rx.Observer.create(onNext, onError, onCompleted)
  end

  local subscription = rx.Subject.subscribe(self, observer)

  if self.value then
    observer:onNext(self.value)
  end

  return subscription
end

local updateData
updateData = function (from, to)
	if not type(from) ~= "table" or not type(to) ~= "table" then
		return
	end
	for k,v in pairs(from) do
		if type(v) ~= "table" or isState(v) then
			to[k] = v
		else
			if type(to[k]) ~= "table" then
				to[k] = v
			else
				updateData(v, to[k])
			end
		end
	end
end
function StateSubject:onNext(data)
	updateData(data, self.value)
	return rx.Subject.onNext(self, data)
end


function StateSubject:value(key, ...)
	local ret
	local data = self:get(key, ...):subscribe(function (v)
		ret = v
	end)
	return ret
end

StateSubject.__call = StateSubject.onNext


local biu = {}
biu.net = rx.Subject.create()
biu.click = rx.Subject.create()
biu.touch = rx.Subject.create()

biu.init = function (bus)
	bus:filter(function (tp, ...)
		return biu[tp]
	end):distinctUntilChanged():subscribe(function (tp, ...)
		print(...)
		biu[tp](...)
	end)
end

local effectStart, effectFinish
biu.useState = function (data)
	local state = StateSubject.create(data)
	return state, function (v)
		state(v)
	end
end

biu.useEffect = function (f)
	if effectStart and effectFinish then
		effectStart:subscribe(function ( ... )
			effectFinish:subscribe(f())
		end)
	end
end

biu.render = function (uiData)
	rx.Observable.of(uiData):dump("render: ", tostr)
end


return biu