-- render.lua
local rx = require "lib.rx"

local nerver = rx.Observable.never():startWith()
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
	if v1 == v2 then
		return true
    elseif type(v1) ~= "table" or type(v2) ~= "table" then
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

local isObservable = function(object)
	if not type(object) == 'table' then
		return false
	end
	local mt = getmetatable(object)
	if not mt then
		return
	end
  	return mt.__index == StateSubject or mt.__index == rx.Observable
end

util.isState = function(object)
	if not type(object) == 'table' then
		return false
	end
	local mt = getmetatable(object)
	if not mt then
		return
	end
  	return mt.__index == StateSubject
end

util.isObservable = isObservable

rx.Observable.change = rx.Observable.distinctUntilChanged

function rx.Observable:changeTo(v)
	return self:change():filter(function (vv)
		return vv == v
	end)
end

function rx.Observable:tp(tp)
  return rx.Observable.create(function(observer)

    local function onNext(...)
      return rx.util.tryWithObserver(observer, function(...)
      	local args = {...}
      	if args[1] == tp then
      		table.remove(args,1)
	        return observer:onNext(unpack(args))
	    end
      end, ...)
    end

    local function onError(e)
      return observer:onError(e)
    end

    local function onCompleted()
      return observer:onCompleted()
    end

    return self:subscribe(onNext, onError, onCompleted)
  end)
end

function rx.Observable:get(key, ...)
  if not key then return self end--self:distinctUntilChanged(tEqual) end
  local args = {...}
  local innerSubscription
  if type(key) ~= 'string' and type(key) ~= 'number' and not isObservable(key) then
    return rx.Observable.throw('get key must be  string number state')
  end
  if not isObservable(key) then
	  return self:flatMapLatest(function (t)
		if type(t) == "table" then
			local v = t[key]
			if isObservable(v) then
				return v
			elseif v ~= nil then
		      	return rx.Observable.of(v)
		  	end
		end
		return nerver
	  end)--[[:tap(function (v)
	  	print("key:", key, tostr(v))
	  end)]]:get(rx.util.unpack(args))
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
  -- assert(type(data) == "table", "StateSubject must create with table data.")
  local self = {
    observers = {},
    stopped = false
  }
  setmetatable(self, StateSubject)
  if isObservable(data) then
  	data:subscribe(self)
  else
	  self.value = data
  end
  local catch = {}
  self.get = function (self, ...)
  	local key = ""
  	local args = {...}
  	if #args <= 0 then
  		return self
  	end
  	for i,v in ipairs(args) do
  		if isObservable(v) then
  			key = nil
  			break
  		else
  			key = key .. "_" .. v
  		end
  	end
  	local ret
  	if type(key) == "string" then
	  	ret = catch[key]
	  	if not ret then
	  		ret = rx.Observable.get(self, ...)
	  		catch[key] = ret
	  	end 
  	else
	  	ret = rx.Observable.get(self, ...)
  	end
  	return ret
  end
  return self
end

function StateSubject:subscribe(onNext, onError, onCompleted)
  local observer

  if rx.util.isa(onNext, rx.Observer) then
    observer = onNext
  else
    observer = rx.Observer.create(onNext, onError, onCompleted)
  end

  local subscription = rx.Subject.subscribe(self, observer)

  -- if self.value then
    observer:onNext(self.value)
  -- end

  return subscription
end

local combinData

combinData = function (from, to)
	if type(from) ~= "table" or type(to) ~= "table" then
		return from
	end
	if isObservable(from) or isObservable(to) then
		return from
	end
	for k,v in pairs(from) do
		to[k] = combinData(v, to[k])
	end
	return to
end

function StateSubject:onNext(data, ...)
	local reducer = self.reducer or rx.util.identity
	local combinFrom = reducer(data,...)
	self.value = combinData(combinFrom, self.value)
	return rx.Subject.onNext(self, combinFrom)
end


local vofk
vofk = function (keyArr, v, index)
	index = index or 1
	if #keyArr >= index then
		local k = keyArr[index]
		local nextV
		if type(v) ~= "table" then
			return nil
		elseif isObservable(v) then
			local args = {}
			for i=index+1, #keyArr do
				args[#args+1] = keyArr[i]
			end
			return v:get(rx.util.unpack(args))
		else
			nextV = v[k]
			return vofk(keyArr,nextV, index+1)
		end
	else
		return v
	end
end
function StateSubject:v(...)
	local keyArr = {...}
	return vofk(keyArr, self.value)
end

StateSubject.__call = StateSubject.onNext


local Biu = {}

local Binder = {}
Binder.__index = Binder
Binder.__tostring = rx.util.constant('Binder')
function Binder.create()
  local self = {
  	items = {},
  	props = {},
  	states = {},
  	effects = {}
  }
  return setmetatable(self, Binder)
end
Binder.__call = Binder.create

function Binder:setRefs(refs)
	self.refs = refs
	return self
end

function Binder:item(insName)
	local itemData = self.items[insName]
	if not itemData then
		itemData = {
			name = insName,
			attrs = {}
		}
		self.items[insName] = itemData
	end
	self.curContainer = itemData
	self.curInsName = insName
	return self
end

function Binder:setState(state)
	self.states[#self.states+1] = state
	return self
end

function Binder:setProps(name, propData)
	self.props[name] = propData
	return self
end

function Binder:setEffect(name, f)
	self.effects[name] = f
	return self
end

function Binder:loop(from,to, f)
	for i=from,to do
		f(i, self)
	end
	return self
end

function Binder:add(data)
	local container = self.curContainer.attrs
	container[#container+1] = data
end

function Binder:setPosition(pos)
	self:add({"setPosition",pos})	
	return self
end

function Binder:setPositionBy(pos)
	self:add({"setPositionBy",pos})	
	return self
end

function Binder:setScale(scale)
	self:add({"setScale",scale})	
	return self
end

function Binder:setScaleX(scale)
	self:add({"setScaleX",scale})	
	return self
end

function Binder:setScaleY(scale)
	self:add({"setScaleY",scale})	
	return self
end

function Binder:setRotation(rotation)
	self:add({"setRotation",rotation})	
	return self
end

function Binder:setOpacity(opacity)
	self:add({"setOpacity",alpha})	
	return self
end

function Binder:setColor(colorData)
	self:add({"setColor",colorData})	
	return self
end

function Binder:setVisible(isVisible)
	self:add({"setVisible",isVisible})	
	return self
end

function Binder:setEnabled(isEnabled)
	self:add({"setEnabled",isEnabled})	
	return self
end

function Binder:onClick(f)
	self:add({"onClick",f})	
	return self
end

function Binder:setString(str)
	self:add({"setString",str})	
	return self
end

function Binder:fillString(arr)
	self:add({"fillString",arr})	
	return self
end

function Binder:setFrame(frameName)
	self:add({"setFrame",frameName})	
	return self
end

function Binder:autoTip(meta, scale)
	self:add({"autoTip", meta, scale})	
	return self
end

function Binder:autoProgress(insName, isVertical)
	self:add({"autoProgress", insName, isVertical})
	return self
end

function Binder:wrapper(data)
	self:add({"wrapper",data})	
	return self
end

function Binder:playStop(data)
	self:add({"playStop",data})	
	return self
end

function Binder:play(isPlay)
	self:add({"play",isPlay})	
	return self
end

function Binder:stop(isStop)
	self:add({"stop",isStop})	
	return self
end


function Binder:gotoAndPlay(frame)
	self:add({"gotoAndPlay",frame})	
	return self
end

function Binder:gotoAndStop(frame)
	self:add({"gotoAndStop",frame})	
	return self
end

function Binder:setFrameCallBack(frameData)
	-- frameData.frame  frameData.callBack
	self:add({"setFrameCallBack",frameData})	
	return self
end

function Binder:setEndCallBack(callBack)
	self:add({"setEndCallBack",callBack})
	return self
end

function Binder:setEachFrameCallBack(callBack)
	self:add({"setEachFrameCallBack",callBack})	
	return self
end



local Net = rx.Subject.create()
Biu.Binder = Binder
Biu.Util = util
Biu.Rx = rx

Biu.init = function (data,reqFun)
	data = table.deepcopy(data)
	data.config = nil
	Biu.GameData = Biu.createState(data)
	Net:subscribe(function ( ... )
		local args = {...}
		local cbIndex,cb
		for i,v in ipairs(args) do
			print("v:", v)
	      if type(v) == "function" then
	          cb = v
	          cbIndex = i
	      end
		end
		if not cb then
			cb = function (data)
				return Biu.GameData:onNext(data) 
			end
			cbIndex = #args+1
		else
			local oldCB = cb
			cb = function (resp)
				oldCB(resp)
				Biu.GameData:onNext(resp) 
			end
		end

		args[cbIndex] = cb
		-- dump(args)

		reqFun(rx.util.unpack(args))
	end)
end

Biu.createBus = function ()
	local bus = rx.Subject.create()
	bus:subscribe(function (tp, ...)
		if tp == "req" then
			Net:onNext(...)
		end
	end)
	return bus
end

Biu.createState = function (data, reducer)
	local state = StateSubject.create(data)
	state.reducer = reducer
	return state
end


return Biu