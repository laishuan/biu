local util = require "Util"
local op = {}

local curry = function (f)
	return function (...)
		local args = {...}
		return function (observerable)
			return f(observerable, util.unpack(args))
		end
	end
end

local compose = function (f1, f2)
	return function (observerable)
		return f2(f1(observerable))
	end
end

local createOBf = function (f)
	return function (onNext, onFinish)
		local isFinsh = false
		newNext = function ( ... )
			if not isFinsh then onNext(...) end
		end
		newFinish = function ( ... )
			isFinsh = true
			if onFinish then onFinish(...) end
		end
		return f(newNext, newFinish)
	end
end

op.dump = function (prefix)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			return observerable(function (...)
				prefix = prefix or ""
				util.dump({...}, "op_dump: " .. prefix)
				onNext(...)
			end, onFinish)
		end)
	end
end
op.print = function (prefix)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			return observerable(function (...)
				prefix = prefix or ""
				print(prefix, ...)
				onNext(...)
			end, onFinish)
		end)
	end
end

op.pip = function (...)
	local args = {...}
	local f = util.identity
	return function (observerable)
		for i,v in ipairs(args) do
			f = compose(f, v)
		end
		return f(observerable)
	end
end

op.map = function (f)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			return observerable(function (...)
				onNext(f(...))
			end, onFinish)
		end)
	end
end

op.select = function (f)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			return observerable(function (...)
				if f(...) then
					onNext(...)
				end
			end, onFinish)
		end)
	end
end

op.filter = op.select

op.reject = function (f)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			return observerable(function (...)
				if not f(...) then
					onNext(...)
				end
			end, onFinish)
		end)
	end
end


op.reduce = function (f, state)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			local first = true
			return observerable(function (...)
				local args = {...}
				if first then
					state = state and f(state, ...) or f(args[1], ...)
					first = false
				else
					state = f(state, ...)
				end
			end, function ( ... )
				onNext(state)
				onFinish()
			end)
		end)
	end
end


op.scan = function (f, state)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			local first = true
			return observerable(function (...)
				local args = {...}
				if first then
					state = state and f(state, ...) or f(args[1], ...)
					first = false
				else
					state = f(state, ...)
				end
				onNext(state, args[2])
			end, onFinish)
		end)
	end
end

op.reverse = function ( ... )
	return function (observerable, ...)
		return createOBf(function (onNext, onFinish)
			local arr = {}
			return observerable(function (...)
				table.insert(arr, 1, {...})
			end, function ( ... )
				for i=1, #arr do
					local v = arr[i]
					onNext(v[1], #arr - v[2] + 1)
				end
				onFinish()
			end)
		end)
	end
end 

op.findIndex = function (f)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			local index
			local newFinish = function ( ... )
				onNext(index)
				onFinish()
			end

			return observerable(function ( ... )
				if not index and f(...) then
					local args = {...}
					index = args[2]
				end
			end, newFinish)
		end)
	end
end

op.findValue = function (value)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			local isFind = false
			local newFinish = function ( ... )
				onNext(isFind)
				onFinish()
			end

			return observerable(function ( ... )
				local args = {...}
				if not isFind and value == args[1] then
					isFind = true
				end
			end, newFinish)
		end)
	end
end


op.all = function (f)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			local value = true
			local newFinish = function ( ... )
				onNext(value)
				onFinish()
			end

			return observerable(function ( ... )
				if value and not f(...) then
					value = false
				end
			end, newFinish)
		end)
	end
end


op.groupBy = function (f)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			local _t = {}
			local newFinish = function ( ... )
				onNext(_t)
				onFinish()
			end

			return observerable(function ( ... )
				local args = {...}
				local v, k = args[1], args[2]
			    local _key = f(v,k)
			    if _t[_key] then _t[_key][#_t[_key]+1] = v
			    else _t[_key] = {v}
			    end
			end, newFinish)
		end)
	end
end

op.countBy = function (f)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			local _t = {}
			local newFinish = function ( ... )
				onNext(_t)
				onFinish()
			end

			return observerable(function ( ... )
				local args = {...}
				local v, i = args[1], args[2]
			    local key = f(v,i)
			    _t[key] = (_t[key] or 0)+1
			end, newFinish)
		end)
	end
end

op.max = function ()
	return op.reduce(function (state, v)
		return math.max(state, v)
	end)
end

op.sum = function ( ... )
	return op.reduce(function(x, y) return x + y end, 0)
end

op.min = function ()
	return op.reduce(function (state, v)
		return math.min(state, v)
	end)
end

op.value = function ()
	local value, firstK, firstV
	local count = 0
	return op.reduce(function (state, v, k)
		count = count + 1
		if count > 1 then
			if not value then
				value = {}
				value[firstK] = firstV
			end
			value[k] = v
		else
			firstV = v
			firstK = k or 1
		end
		return value or firstV
	end)
end

op.sample = function (sampler)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			local values

			local stop1 = observerable(function ( ... )
				values = {...}
			end, util.noop)

			local stop2 = sampler._subscribe(function ( ... )
				if values ~= nil then
					onNext(util.unpack(values))
				end
			end, onFinish)

			return function ( ... )
				if stop1 then stop1() end
				if stop2 then stop1() end
			end
		end)
	end
end

op.flatten = function ()
	return function (observerable)
		return createOBf(function (onNext, onFinish)
		    local subscriptions = {}
		    local remaining = 1

		    local function newFinish()
		      remaining = remaining - 1
		      if remaining == 0 then
		        onFinish()
		      end
		    end
			observerable(function (v)
				subscriptions[#subscriptions+1] = v(function ( ... )
					remaining = remaining
					onNext(...)
				end, util.noop)
			end, newFinish)

			return function ( ... )
		      for i = 1, #subscriptions do
		        subscriptions[i]()
		      end
			end
		end)
	end
end


op.flatMap = function (f)
	return op.pip(op.map(f), op.flatten())
end

op.switch = function ( ... )
	return function (observerable)
		return createOBf(function (onNext, onFinish)
    		local innerSubscription
		    local function switch(source)
		      	if innerSubscription then
		        	innerSubscription()
		      	end

		      	innerSubscription = source._subscribe(onNext)
		    end


			local subscription = observerable(switch, onFinish)
			return function ( ... )
		      	if innerSubscription then
		        	innerSubscription()
		      	end
		      	if subscription then
		        	subscription()
		      	end
			end
		end)
	end
end

op.take = function (n)
	return function (observerable)
  		n = n or 1
		return createOBf(function (onNext, onFinish)
		    if n <= 0 then
		      onFinish()
		      return
		    end
    		local i = 1
			return observerable(function ( ... )
				onNext(...)
			    i = i + 1

			    if i > n then
			      	onFinish()
			    end
			end, onFinish)
		end)
	end
end

op.skip = function (n)
	return function (observerable)
  		n = n or 1
		return createOBf(function (onNext, onFinish)
    		local i = 1
			return observerable(function ( ... )
			    if i > n then
			        onNext(...)
			    else
			        i = i + 1
			    end
			end, onFinish)
		end)
	end
end

op.get = function (key, ...)
	local otherKeys = {...}
	return function (observerable)
		if not key then return observerable end

		if type(key) ~= 'string' and type(key) ~= 'number' then
		    return assert('pluck key must be a string')
		end
		return createOBf(function (onNext, onFinish)
			return op.get(util.unpack(otherKeys))(observerable(function (t)
				onNext(t[key])
			end, onFinish))
		end)
	end
end

op.first = function ( ... )
	return op.take(1)
end

op.buffer = function (size)
	return function (observerable)
		if not size or type(size) ~= 'number' then
		   	assert('Expected a number')
		end

		return createOBf(function (onNext, onFinish)
			local buffer = {}
		    local function emit()
			    if #buffer > 0 then
			        onNext(util.unpack(buffer))
			        buffer = {}
			    end
		    end

		    local function newNext(...)
			    local values = {...}
			    for i = 1, #values do
			        table.insert(buffer, values[i])
			        if #buffer >= size then
			            emit()
			        end
			    end
		    end 

		    local function newFinish()
		      emit()
		      return onFinish()
		    end
		    return observerable(newNext, newFinish)
		end)
	end
end

op.join = function ( ... )
	local sources = {...}
	return function (observerable)

		local combinator = table.remove(sources)
		if type(combinator) ~= 'function' then
		    table.insert(sources, combinator)
		    combinator = function(...) return ... end
		end
		table.insert(sources, 1, {_subscribe = observerable})

		return createOBf(function (onNext, onFinish)
			local latest = {}
			local pending = {util.unpack(sources)}
			local completed = {}
			local subscription = {}

		    local function newNext(i)
			    return function(value)
			        latest[i] = value
			        pending[i] = nil

			        if not next(pending) then
			            onNext(combinator(util.unpack(latest)))
			        end
			    end
		    end

		    local function newFinish(i)
		      	return function()
			        table.insert(completed, i)

			        if #completed == #sources then
			            onFinish()
			        end
		      	end
		    end

		    for i = 1, #sources do
  		        subscription[i] = sources[i]._subscribe(newNext(i), newFinish(i))
		    end

		    return function ( ... )
		        for i = 1, #sources do
		        	if subscription[i] then subscription[i]() end
		        end
		    end
		end)
	end
end

op.change = function (comparator)
	return function (observerable)
  		comparator = comparator or util.eq
		return createOBf(function (onNext, onFinish)
			local first = true
			local currentValue = nil

			local newNext = function (value, ...)
				local values = {...}
		        if first or not comparator(value, currentValue) then
		            onNext(value, util.unpack(values))
		            currentValue = value
		            first = false
		        end
			end

			return observerable(newNext, onFinish)
		end)
	end
end

op.tp = function (tp)
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			return observerable(function ( ... )
		        local args = {...}
		        if args[1] == tp then
		            table.remove(args,1)
		            return onNext(util.unpack(args))
		        end
			end, onFinish)
		end)
	end
end

op.changeFrom = function (v)
    local lastAndCur = op.window(2)
    return op.pip(lastAndCur, op.filter(function (v1, v2)
	    if type(v) == "function" then
	      return v(v1)
	    else
	      return v1 == v
	    end
    end))
end

op.changeTo = function (v)
	if type(v) ~= "function" then
		return op.pip(
			op.change(),
			op.select(function (vv)
				return vv == v
			end)
		)
	else
		return op.pip(
			op.change(),
			op.select(v)
		)
	end
end

op.flatMapLatest = function (callback)
	return function (observerable)
  		callback = callback or util.identity
		return createOBf(function (onNext, onFinish)
    		local innerSubscription
			
		    local function subscribeInner(...)
			    if innerSubscription then
			        innerSubscription()
			    end
			    innerSubscription = callback(...):subscribe(onNext)
		    end

		    local subscription = observerable(subscribeInner, onFinish)
		    return function()
			    if innerSubscription then
			        innerSubscription()
			    end

			    if subscription then
			        subscription()
			    end
		    end
		end)
	end
end

op.merge = function ( ... )
	local sources = {...}
	return function (observerable)
		table.insert(sources, 1, {_subscribe = observerable})

		return createOBf(function (onNext, onFinish)
		    local completed = {}
		    local subscriptions = {}

		    local function newFinish(i)
			    return function()
			        table.insert(completed, i)

			        if #completed == #sources then
			            onFinish()
			        end
			    end
		    end

		    for i = 1, #sources do
		      subscriptions[i] = sources[i]._subscribe(onNext, newFinish(i))
		    end

		    return function ()
		      for i = 1, #sources do
		        if subscriptions[i] then subscriptions[i]() end
		      end
		    end
		end)
	end
end


op.window = function (size)
	return function (observerable)
		if not size or type(size) ~= 'number' then
		    error('Expected a number')
		end

		return createOBf(function (onNext, onFinish)
    		local window = {}
		    local function newNext(value)
			    table.insert(window, value)

			    if #window >= size then
			        onNext(util.unpack(window))
			        table.remove(window, 1)
			    end
		    end
			return observerable(newNext, onFinish)
		end)
	end
end

op.with = function ( ... )
  	local sources = {...}
	return function (observerable)
		return createOBf(function (onNext, onFinish)
		    local latest = setmetatable({}, {__len = util.constant(#sources)})
		    local subscriptions = {}
		    local function setLatest(i)
		        return function(value)
		          latest[i] = value
		        end
		    end

		    local newNext = function (value)
      			return onNext(value, util.unpack(latest))
		    end
		    for i = 1, #sources do
		        subscriptions[i] = sources[i]._subscribe(setLatest(i), util.noop)
		    end
		    subscriptions[#sources + 1] = observerable(newNext, onFinish)
		    return function ( ... )
		        for i = 1, #sources + 1 do
		          if subscriptions[i] then subscriptions[i]() end
		        end
		    end
		end)
	end
end

op.startWith = function ( ... )
	return function (observerable)
		return createOBf(function (onNext, onFinish)
			onNext(util.unpack(args))
			return observerable(onNext, onFinish)
		end)
	end
end

return {
	op = op,
	createOBf = createOBf
}