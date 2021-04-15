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

util.unpack = unpack
util.pack = pack

util.eq = function(x, y) return x == y end
util.noop = function() end
util.identity = function(x) return x end
util.constant = function(x) return function() return x end end

local op = {}

op.map = curry(function (observerable, f)
	return function (next, finish)
		observerable(function (...)
			next(f(...))
		end, finish)
	end
end)

op.select = curry(function (observerable, f)
	return function (next, finish)
		observerable(function (...)
			if f(...) then
				next(...)
			end
		end, finish)
	end
end)

op.reject = curry(function (observerable, f)
	return function (next, finish)
		observerable(function (...)
			if not f(...) then
				next(...)
			end
		end, finish)
	end
end)

op.reduce = curry(function (observerable, f, state)
	return function (next, finish)
		observerable(function (...)
			local args = {...}
			state = state or args[1]
			state = f(state, ...)
		end, function ( ... )
			next(state)
			finish()
		end)
	end
end)

op.reverse = curry(function (observerable)
	return function (next, finish)
		local arr = {}
		observerable(function (...)
			table.insert(arr, 1, {...})
		end, function ( ... )
			for i=#arr,1 do
				next(unpack(arr[i]))
			end
			finish()
		end)
	end
end)

op.findIndex = curry(function (observerable, f)
	return function (next, finish)
		local index
		local newFinish = function ( ... )
			next(index)
			finish()
		end

		observerable(function ( ... )
			if not index and f(...) then
				local args = {...}
				index = args[2]
			end
		end, newFinish)
	end
end)

op.findValue = curry(function (observerable, f)
	return function (next, finish)
		local value
		local newFinish = function ( ... )
			next(value)
			finish()
		end

		observerable(function ( ... )
			if not value and f(...) then
				local args = {...}
				value = args[1]
			end
		end, newFinish)
	end
end)

op.all = curry(function (observerable, f)
	return function (next, finish)
		local value = true
		local newFinish = function ( ... )
			next(value)
			finish()
		end

		observerable(function ( ... )
			if value and not f(...) then
				value = false
			end
		end, newFinish)
	end
end)

op.groupBy = curry(function (observerable, f)
	return function (next, finish)
		local _t = {}
		local newFinish = function ( ... )
			next(_t)
			finish()
		end

		observerable(function ( ... )
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
	return function (next, finish)
		local _t = {}
		local newFinish = function ( ... )
			next(_t)
			finish()
		end

		observerable(function ( ... )
			local args = {...}
			local v, i = args[1], args[2]
		    local key = f(v,i)
		    _t[key] = (_t[key] or 0)+1
		end, newFinish)
	end
end)

local Biu = {}

Biu.util = util
Biu.op = op

function Biu:of(v)
	return function (next, finish)
		next(v)
		finish()
	end
end

function Biu:fromArr(v)
	return function (next, finish)
		for i,v in ipairs(v) do
			next(v,i)
		end
		finish()
	end
end

function Biu:fromObj(v)
	return function (next, finish)
		for k,v in pairs(v) do
			next(v, k)
		end
		finish()
	end
end

function Biu:fromRange(from, to)
	return function (next, finish)
		for i=from,to do
			next(i,i)
		end
		finish()
	end
end


Biu.op = op

return Biu