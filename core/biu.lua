-- render.lua
local rx = require "lib.rx"

string.split = function (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    while string.match(inputstr, sep .. sep) do
        inputstr = string.gsub(inputstr, sep .. sep, sep .. "null" .. sep)
    end
    local lst = { }
    local n = string.len(inputstr)--长度
    local seplen = string.len(sep)
    local start = 1
    while start <= n do
        local i, e = string.find(inputstr, sep, start) -- find 'next' 0
        if i == nil then 
            table.insert(lst, string.sub(inputstr, start, n))
            break 
        end
        table.insert(lst, string.sub(inputstr, start, i-1))
        if i == n then
            table.insert(lst, "")
            break
        end
        start = e + 1
    end
    return lst
end

local util = {}
local rptChar
rptChar = function (char, times)
    if times <= 0 then
        return ""
    end
    return char .. rptChar(char, times - 1)
end
util.tostr = function (v, deep)
    deep = deep or 0
    if type(v) ~= "table" then
        return tostring(v)
    else
        local str = "{\n"
        for k,v in pairs(v) do
            str = str .. rptChar('\t', deep+1) .. k .. ":" .. util.tostr(v, deep+1) .. "\n"
        end
        str = str .. rptChar('\t', deep) .. "}\n"
        return str
    end
end-- util.lua

util.tEqual = function (v1, v2)
    if type(v1) ~= "table" or type(v2) ~= "table" then
        return v1 == v2
    else
    	local empty1 = true
        for k,v in pairs(v1) do
        	empty1 = false
            if not util.tEqual(v2[k], v) then
                return false
            end
        end
    	local empty2 = true
        for k,v in pairs(v2) do
        	empty2 = false
            if not util.tEqual(v1[k], v) then
                return false
            end
        end
        if empty1 ~= empty2 then
        	return false
        end

        return true
    end
end

local tostr, tEqual = util.tostr, util.tEqual
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

util.isState = isState


local combinData, copyto
copyto = function (from, to)
	if type(from) ~= "table" or type(to) ~= "table" then
		return
	end
	for k,v in pairs(from) do
		local vTo = to[k]
		if not vTo then
			to[k] = v
		elseif (type(vTo) == "table" and not isState(vTo)) then
			copyto(v, vTo)
		end
	end	
end
combinData = function (from, to)
	if type(from) ~= "table" or type(to) ~= "table" then
		return
	end
	for k,v in pairs(from) do
		if type(v) ~= "table" or isState(v) then
			to[k] = v
		else
			if type(to[k]) == "table"
			and (not isState(to[k])) then
				copyto(to[k], v)
			end
			to[k] = v

		end
	end
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

function StateSubject:onNext(data, ...)
	local reducer = self.reducer or rx.util.identity
	local combinFrom = reducer(data,...)
	combinData(combinFrom, self.value)
	return rx.Subject.onNext(self, self.value)
end


function StateSubject:value(key, ...)
	local ret
	local data = self:get(key, ...):subscribe(function (v)
		ret = v
	end)
	return ret
end

StateSubject.__call = StateSubject.onNext



local Binder = {}
Binder.__index = Binder
Binder.__tostring = rx.util.constant('Binder')
function Binder.create()
  local self = {
  	items = {},
  	props = {}
  }
  return setmetatable(self, Binder)
end
Binder.__call = Binder.create

function Binder:item(insName)
	local data = {
		name = insName,
		attrs = {}
	}
	self.items[#self.items] = data
	self.curContainer = data
	self.curInsName = insName
	return self
end

function Binder:state(state, cloneFrom)
	self.items[#items+1] = state
end

function Binder:add(data)
	local container = self.curContainer.attr
	container[#container+1] = data
end

function Binder:position(pos)
	self:add({"position",pos})	
	return self
end

function Binder:positionBy(pos)
	self:add({"positionBy",pos})	
	return self
end

function Binder:scale(scale)
	self:add({"scale",scale})	
	return self
end

function Binder:rotation(rotation)
	self:add({"rotation",rotation})	
	return self
end

function Binder:alpha(alpha)
	self:add({"alpha",alpha})	
	return self
end

function Binder:color(r,g,b)
	self:add({"color",r,g,b})	
	return self
end

function Binder:visible(isVisible)
	self:add({"visible",isVisible})	
	return self
end

function Binder:enabled(isEnabled)
	self:add({"enabled",isEnabled})	
	return self
end

function Binder:text(str)
	self:add({"text",str})	
	return self
end

function Binder:frame(frameName)
	self:add({"frame",frameName})	
	return self
end

function Binder:wrapper(name, insName, isPlay, curFrame, cbs)
	self:add({"wrapper",name, insName})	
	return self:anim(isPlay, curFrame, cbs)
end

function Binder:anim(isPlay, curFrame, cbs)
	self:add({"anim",isPlay, curFrame, cbs})	
	return self
end

function Binder:props(propData)
	self.props[self.curInsName] = propData
	return self
end


local biu = {}
biu.net = rx.Subject.create()
biu.binder = Binder
biu.util = util

biu.init = function (data,reqFun)
	biu.userData = biu.createState(data)
	biu.net:subscribe(function ( ... )
		reqFun(function (data)
			return biu.userData:onNext(data) 
		end, ...)
	end)
end

biu.createBus = function (bindFromPanel)
	local bus = rx.Subject.create()
	bus:subscribe(function (tp, ...)
		if tp == "req" then
			biu.net:onNext(...)
		end
	end)
	bindTouchClickFunc(bus)
	return bus
end

biu.createState = function (data, reducer)
	local state = StateSubject.create(data)
	state.reducer = reducer
	return state
end


return biu