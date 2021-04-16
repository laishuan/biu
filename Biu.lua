local util = {}
local unpack = table.unpack or unpack
local pack = table.pack or function(...) return { n = select('#', ...), ... } end

local curry = function (f)
	return function (...)
		local args = {...}
		return function (observerable)
			return f(observerable, unpack(args))
		end
	end
end

local compose = function (f1, f2)
	return function (observerable)
		f2(f1(observerable))
	end
end

local joinNextFinish = function (onNext, onFinish)
	local isFinsh = false
	return {function ( ... )
		if not isFinsh then onNext(...) end
	end, function ( ... )
		isFinsh = true
		finish()
	end}
end

util.unpack = unpack
util.pack = pack

util.eq = function(x, y) return x == y end
util.noop = function() end
util.identity = function(x) return x end
util.constant = function(x) return function() return x end end

local op = {}

op.map = curry(function (observerable, f)
	return function (onNext, finish)
		return observerable(function (...)
			onNext(f(...))
		end, finish)
	end
end)

op.select = curry(function (observerable, f)
	return function (onNext, finish)
		return observerable(function (...)
			if f(...) then
				onNext(...)
			end
		end, finish)
	end
end)

op.reject = curry(function (observerable, f)
	return function (onNext, finish)
		onNext, finish = 
		return observerable(function (...)
			if not f(...) then
				onNext(...)
			end
		end, finish)
	end
end)

op.reduce = curry(function (observerable, f, state)
	return function (onNext, finish)
		local first = true
		return observerable(function (...)
			local args = {...}
			if first then
				state = state or args[1]
				first = false
			else
				state = f(state, ...)
			end
		end, function ( ... )
			onNext(state)
			finish()
		end)
	end
end)

op.scan = curry(function (observerable, f, state)
	return function (onNext, finish)
		local first = true
		return observerable(function (...)
			local args = {...}
			if first then
				state = state or args[1]
				first = false
			else
				state = f(state, ...)
			end
			onNext(state)
		end, finish)
	end
end)

op.reverse = curry(function (observerable)
	return function (onNext, finish)
		local arr = {}
		return observerable(function (...)
			table.insert(arr, 1, {...})
		end, function ( ... )
			for i=#arr,1 do
				onNext(unpack(arr[i]))
			end
			finish()
		end)
	end
end)

op.findIndex = curry(function (observerable, f)
	return function (onNext, finish)
		local index
		local newFinish = function ( ... )
			onNext(index)
			finish()
		end

		return observerable(function ( ... )
			if not index and f(...) then
				local args = {...}
				index = args[2]
			end
		end, newFinish)
	end
end)

op.findValue = curry(function (observerable, f)
	return function (onNext, finish)
		local value
		local newFinish = function ( ... )
			onNext(value)
			finish()
		end

		return observerable(function ( ... )
			if not value and f(...) then
				local args = {...}
				value = args[1]
			end
		end, newFinish)
	end
end)

op.all = curry(function (observerable, f)
	return function (onNext, finish)
		local value = true
		local newFinish = function ( ... )
			onNext(value)
			finish()
		end

		return observerable(function ( ... )
			if value and not f(...) then
				value = false
			end
		end, newFinish)
	end
end)

op.groupBy = curry(function (observerable, f)
	return function (onNext, finish)
		local _t = {}
		local newFinish = function ( ... )
			onNext(_t)
			finish()
		end

		return observerable(function ( ... )
			local args = {...}
			local v, k = args[1], args[2]
		    local _key = f(v,k)
		    if _t[_key] then _t[_key][#_t[_key]+1] = v
		    else _t[_key] = {v}
		    end
		end, newFinish)
	end
end)

op.countBy = curry(function (observerable, f)
	return function (onNext, finish)
		local _t = {}
		local newFinish = function ( ... )
			onNext(_t)
			finish()
		end

		return observerable(function ( ... )
			local args = {...}
			local v, i = args[1], args[2]
		    local key = f(v,i)
		    _t[key] = (_t[key] or 0)+1
		end, newFinish)
	end
end)

op.max = function ()
	return op.reduce(math.max)
end

op.min = function ()
	return op.reduce(math.min)
end

op.sample = curry(function (observerable, sampler)
	return function (onNext, finish)
		local values

		local stop1 = observerable(function ( ... )
			values = {...}
		end, util.noop)

		local stop2 = sampler(function ( ... )
			if values ~= nil then
				onNext(unpack(values))
			end
		end, finish)

		return function ( ... )
			if stop1 then stop1() end
			if stop2 then stop1() end
		end
	end
end)

op.flatten = curry(function (observerable)
	return function (onNext, finish)
	    local subscriptions = {}
	    local remaining = 1

	    local function newFinish()
	      remaining = remaining - 1
	      if remaining == 0 then
	        finish()
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
	end
end)

op.flatMap = curry(function (observerable, f)
	return compose(op.map(f), op.flatten())(observerable)
end)

op.startWith = function (observerable, v)
	return function (onNext, finish)
		onNext(v)
		return observerable(onNext, finish)
	end
end

local Biu = {}

Biu.util = util
Biu.op = op

function Biu:of(v)
	return function (onNext, finish)
		onNext(v)
		finish()
	end
end

function Biu:fromArr(v)
	return function (onNext, finish)
		for i,v in ipairs(v) do
			onNext(v,i)
		end
		finish()
	end
end

function Biu:fromObj(v)
	return function (onNext, finish)
		for k,v in pairs(v) do
			onNext(v, k)
		end
		finish()
	end
end

function Biu:fromRange(from, to)
	return function (onNext, finish)
		for i=from,to do
			onNext(i,i)
		end
		finish()
	end
end


Biu.op = op

return Biu