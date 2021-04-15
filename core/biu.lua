-- render.lua
local rx = require "lib.rx"

local Observable = rx.Observable
local Observer = rx.Observer
local Subscription = rx.Subscription
local Subject = rx.Subject

local nerver = Observable.never()--:startWith()
local util = {}
local rptChar
local combinData


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

util.diff = function (t1, t2)
  if type(t1) ~= 'table' or type(t2) ~= "table" then
    return
  end
  local ret
  local getRet = function ( ... )
    if not ret then ret={} end
    return ret
  end
  for k,v in pairs(t1) do
    local v2 = t2[k]
    if type(v) ~= type(v2) then
      -- print("type not equal k:", k)
      -- print(type(v), type(v2))
      if v2 ~= nil then
        getRet()[k] = v2
      else
        getRet()[k] = "_delete"
      end
    elseif type(v) == "table" then
      -- print("type equal and all is talbe enter k:", k)
      local curDiff = util.diff(v, v2)
      if curDiff then
        getRet()[k] = curDiff
      end
    elseif v ~= v2 then
      -- print("value not equal k:", k)
      -- print(v, v1)
      getRet()[k] = v2
    end
  end

  for k,v in pairs(t2) do
    if t1[k] == nil then
      -- print("not t2 new add k", k)
      -- dump(v, "new add value")
      getRet()[k] = v
    end
  end

  return ret
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
    return mt.__index == StateSubject or mt.__index == Observable
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

util.isSubscription = function (object)
  if not type(object) == 'table' then
    return false
  end
  local mt = getmetatable(object)
  if not mt then
    return
  end
    return mt.__index == Subscription
end

util.isObservable = isObservable

Observable.change = Observable.distinctUntilChanged
Observable.join = Observable.combineLatest

function Observable:leaveFrom(v)
  local lastAndCur = self:window(2)
  return lastAndCur:filter(function (v1, v2)
    if type(v) == "function" then
      return v(v1)
    else
      return v1 == v
    end
  end)
end

function Observable:changeTo(v)
  if type(v) ~= 'function' then
    return self:change():filter(function (vv)
      return vv == v
    end)
  else
    return self:change():filter(v)
  end
end

function Observable:tp(tp)
  return Observable.create(function(observer)

    local function onNext(...)
      return rx.util.tryWithObserver(observer, function(...)
        local args = {...}
        if args[1] == tp then
          table.remove(args,1)
          return observer:onNext(rx.util.unpack(args))
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

function Observable:pluckPro(key, ...)
  if not key then return self end
  local args = {...}
  
  if type(key) ~= 'string' and type(key) ~= 'number' and not isObservable(key) then
    return Observable.throw('get key must be  string number state')
  end
  if not isObservable(key) then
    local ret = self:flatMapLatest(function (t)
      if type(t) == "table" then
        local v = t[key]
        if isObservable(v) then
          return v
        elseif v ~= nil then
              return Observable.of(v)
          end
      end
      return nerver

    end)
    return ret:pluckPro(rx.util.unpack(args))
  else
    return key:flatMapLatest(function (arr)
    if type(arr) ~= "table" then 
      return self:pluckPro(arr)
    else
      return self:pluckPro(rx.util.unpack(arr))
    end
  end)
  end
end

Observable.flatMapLatestPro = function (self, callback)
  callback = callback or util.identity
  return Observable.create(function(observer)
    local innerSubscriptions = {}
    local remaining = 1
    local results = {}

    local function onNext(...)
      observer:onNext(...)
    end

    local function onError(e)
      return observer:onError(e)
    end

    local function onCompleted()
      return observer:onCompleted()
    end

    local function subscribeInner(...)
      for i = 1, #innerSubscriptions do
        innerSubscriptions[i]:unsubscribe()
      end
      innerSubscriptions = {}

      local innerOnNext = function (index)
        return function (v)
          remaining = remaining - 1
          results[index] = v
          if remaining == 0 then
            onNext(rx.util.unpack(results))
          end
        end
      end

      return rx.util.tryWithObserver(observer, function(...)
        local arr = callback(...)
        remaining = #arr
        for i,v in ipairs(arr) do
          local subscription = v:subscribe(innerOnNext(i), onError)
          innerSubscriptions[#innerSubscriptions + 1] = subscription
        end
      end, ...)
    end

    local subscription = self:subscribe(subscribeInner, onError, onCompleted)
    return Subscription.create(function()
      for i = 1, #innerSubscriptions do
        innerSubscriptions[i]:unsubscribe()
      end

      if subscription then
        subscription:unsubscribe()
      end
    end)
  end)
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
    self.value = combinData(data)
  end

  return self
end

function StateSubject.createNoDiff(data)
  -- assert(type(data) == "table", "StateSubject must create with table data.")
  local self = {
    observers = {},
    stopped = false,
    isNeedCombin = true
  }
  setmetatable(self, StateSubject)
  if isObservable(data) then
    data:subscribe(self)
  else
    self.value = combinData(data)
  end

  return self
end

function StateSubject:setNeedCombin(bValue)
  self.isNeedCombin = bValue
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
      for i=index, #keyArr do
        args[#args+1] = keyArr[i]
      end
      if util.isState(v) then
        return v:get(rx.util.unpack(args))
      else
        return v:pluckPro(rx.util.unpack(args))
      end
    else
      nextV = v[k]
      return vofk(keyArr,nextV, index+1)
    end
  else
    return v
  end
end

local flatVByK
flatVByK = function (keyArr, v, index)
  index = index or 1
  if #keyArr >= index then
    local k = keyArr[index]
    local nextV
    if type(v) ~= "table" then
      return nil
    else
      nextV = v[k]
      if util.isState(nextV) then
        return flatVByK(keyArr,nextV.value, index+1)
      else
        return flatVByK(keyArr,nextV, index+1)
      end
    end
  else
    return v
  end
end


function StateSubject:v(...)
  local keyArr = {...}
  return flatVByK(keyArr, self.value)
end

function StateSubject:get(... )
  local keyArr = {...}
  if #keyArr == 0 then
    return self:map(function ( ... )
      return self.value
    end)
  else
    local val = vofk(keyArr,self.value)

    --[[
        StateSubject is a state object, 
        flatMapLatest 将map出来的值(t) 进行处理 然后再flat成为流,
        以前所有的key对应值都不处理只处理当前这个
    ]]
    local flow = self:flatMapLatest(function (t)
      local vFromT = vofk(keyArr, t)
      if vFromT ~= nil then
        local v
        local newV = vofk(keyArr, self.value)
        if newV ~= nil then
          v = newV
        else
          if vFromT == "_delete" then
            v = nil
          else
            v = vFromT
          end
        end
        if isObservable(v) then
          return v
        elseif v ~= nil then
          return Observable.of(v)
        end
      end
      return nerver
    end)

    if isObservable(val) then
      return val:map(function(v)
        return flatVByK(keyArr,self.value)
      end):merge(flow)
      -- return val:merge(flow)
    else
      return flow
    end
  end
end

-- todo 支持流
function StateSubject:any(...)
  local keyArr = {...}
  for i,v in ipairs(keyArr) do
    if type(v) ~= "table" then
      keyArr[i] = {v}
    end
  end
  if #keyArr == 0 then
    return nerver
  else
    return self:filter(function (v)
      local hadOne = false
      for i,keys in ipairs(keyArr) do
        if vofk(keys, v) ~= nil then
          hadOne = true
          break
        end
      end
      return hadOne
    end):flatMapLatestPro(function (v)
      local ret = {}
      for i,keys in ipairs(keyArr) do
        local newV
        local vOrigin = vofk(keys, self.value)
        if vOrigin ~= nil then
          newV = vOrigin
        else
          if newV == "_delete" then
            newV = nil
          else
            newV = vofk(keys, v)
          end
        end
        if isObservable(newV) then
          ret[i] = newV
        else
          ret[i] = Observable.of(newV)
        end
      end
      return ret
    end)
  end
end

-- function StateSubject:subscribe(onNext, onError, onCompleted)
--   local observer

--   if rx.util.isa(onNext, Observer) then
--     observer = onNext
--   else
--     observer = Observer.create(onNext, onError, onCompleted)
--   end

--   local subscription = Subject.subscribe(self, observer)

--   if self.value ~= nil then
--     observer:onNext(self.value)
--   end

--   return subscription
-- end

function StateSubject:subscribe(onNext, onError, onCompleted, order)
  local observer
  order = order or 1
  if rx.util.isa(onNext, Observer) then
    observer = onNext
  else
    observer = Observer.create(onNext, onError, onCompleted)
  end
  local orderArr = self.observers[order]
  if not orderArr then
    orderArr = {}
    self.observers[order] = orderArr
  end
  table.insert(orderArr, observer)
  local subscription = Subscription.create(function()
    for i = 1, #orderArr do
      if orderArr[i] == observer then
        table.remove(orderArr, i)
        return
      end
    end
  end)
  if self.value ~= nil then
    observer:onNext(self.value)
  end
  return subscription
end

combinData = function (to, from)
  if to == nil then
    return from
  end

  if type(to) ~= "table" or isObservable(to) or (type(to.is) == "function" and to:is(HFLNode)) then
    if isObservable(to) and not util.isState(to) then
      return StateSubject.create(to)
    else
      return to
    end
  end

  local newTo = {}
  for k,v in pairs(to) do
    if isObservable(v) and not util.isState(v) then
      newTo[k] = StateSubject.create(v)
    else
      newTo[k] = v
    end
  end

   if type(from) ~= "table" or isObservable(from) or (type(from.is) == "function" and from:is(HFLNode)) then
      return newTo
  end

  for k,v in pairs(from) do
    if newTo[k] ~= "_delete" then
      newTo[k] = combinData(newTo[k], v)
    else
      newTo[k] = nil
    end
  end
  return newTo
end

function StateSubject:onNext(data, ...)
  local reducer = self.reducer or rx.util.identity
  local combinFrom = reducer(data,...)

  local nextData
  if self.isNeedCombin then
    self.value = combinData(combinFrom)
    nextData = data
  else
    self.value = combinData(combinFrom, self.value)
    nextData = combinFrom
  end

  -- self.originValue = combinFrom
  if nextData ~= nil then
    if not self.stopped then
      local allKey = table.keys(self.observers)
      table.sort( allKey, function (order1, order2)
        return tonumber(order1) > tonumber(order2)
      end)

      for i,order in ipairs(allKey) do
        local orderArr = self.observers[order]
        for ii = #orderArr, 1, -1 do
          orderArr[ii]:onNext(nextData, ...)
        end
      end
    end
  end
end

function StateSubject:onError(message)
  if not self.stopped then
    local allKey = table.keys(self.observers)
    table.sort( allKey, function (order1, order2)
      return tonumber(order1) > tonumber(order2)
    end)
    for i,order in ipairs(allKey) do
      local orderArr = self.observers[order]
      for ii = #orderArr, 1, -1 do
        orderArr[ii]:onError(message)
      end
    end

    self.stopped = true
  end
end

function StateSubject:onCompleted()
  if not self.stopped then
    local allKey = table.keys(self.observers)
    table.sort( allKey, function (order1, order2)
      return tonumber(order1) > tonumber(order2)
    end)
    for i,order in ipairs(allKey) do
      local orderArr = self.observers[order]
      for ii = #orderArr, 1, -1 do
        orderArr[ii]:onCompleted()
      end
    end
    self.stopped = true
  end
end

function StateSubject:order(order)
  return setmetatable({
    subscribe = function(_, onNext, onError, onCompleted)
      return self:subscribe(onNext, onError, onCompleted, order)
    end
  }, StateSubject)
end

StateSubject.__call = StateSubject.onNext


local Biu = {}


local lastGameData
local getGameDataByResp = function (resp)
  local data = {
    firstLogin = resp.firstLogin or 0,
    dailyFirst = resp.dailyFirst or 0,
    userData = resp.userData,
  }
  local ret = lastGameData and util.diff(lastGameData, data) or data
  lastGameData = data
  dump(ret, "GameData dispatch")
  return ret
end

local Net = rx.Subject.create()
Biu.Util = util
Biu.Rx = rx
Biu.Net = Net
local GameData
Biu.init = function (data,reqFun)
  data = getGameDataByResp(data)
  GameData = Biu.createState(data)
  Biu.Timmer = rx.Subject.create()
  Net:subscribe(function ( ... )
    local args = {...}
    local cbIndex,cb
    for i,v in ipairs(args) do
        if type(v) == "function" then
            cb = v
            cbIndex = i
        end
    end
    if not cb then
      cb = function (resp)
        return GameData:onNext(getGameDataByResp(resp)) 
      end
      cbIndex = #args+1
    else
      local oldCB = cb
      cb = function (resp)
        GameData:onNext(getGameDataByResp(resp))
        -- print("after on nextV==================== befor oldCB")
        oldCB(resp)
      end
    end

    args[cbIndex] = cb
    -- dump(args)

    reqFun(rx.util.unpack(args))
  end)
end

Biu.createGameData = function ( ... )
  local ret = Biu.createState(GameData)
  return ret
end

Biu.createSecond = function ( ... )
  local second = Biu.createState(true)
  local total = 0
    Biu.Timmer:subscribe(function (dt)
    total = total + dt
    if total > 1 then
      second(true)
    end
    while total > 1 do
      total = total - 1
    end
  end)
  return second
end

Biu.createState = function (data, reducer)
  local state = StateSubject.create(data)
  state.reducer = reducer
  return state
end

Biu.createStateNoDiff = function (data, reducer)
  local state = StateSubject.createNoDiff(data)
  state.reducer = reducer
  return state
end

Biu.connectGameData = function (f, ext)
  if not ext then
    return f
  end
  return function (props, bus)
    local GameData = Biu.createGameData()
    local Extend = GameData:get():map(ext)
    
    -- local fromProps = props:with(Extend):map(function (propsData, extData)
    --   return combinData(propsData, extData)
    -- end)

    -- local fromGameData = Extend:with(props):map(function (extedData, propsData)
    --   return combinData(extedData, propsData)
    -- end)

    -- local newProps = Biu.createStateNoDiff(fromProps:merge(fromGameData))
    local newProps = Biu.createState(props:merge(Extend))
    local binder = f(newProps, bus)
    binder:setEffect(GameData)
    return binder
  end
end

return Biu