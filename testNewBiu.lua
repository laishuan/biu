local util = require "Util"
local biu = require "Biu"
local op = (require "Op").op
local dump = util.dump
-- local t = biu:fromArr({11,22,3, 1, 123123,123123})--:reverse()
-- :scan(function (state, v, i)
-- 	return state + v*i, i
-- end, 0)
-- :print("dump")
-- :value()
-- util.dump(t, "test t")


-- dump(biu:fromObj({a=3, b=4}):startWith(5,"c")
-- :map(function (v,k)
-- 	return v+1, k
-- end)
-- :print("fromObj")
-- :value())

-- dump(biu:fromRange(1,10):map(function (v, i)
-- 	return v+1, i
-- end):print():value())

-- dump(biu:fromRange(1,3)
-- :pip(
-- 	op.map(function (v, i)
-- 		v = v+1
-- 		return v, i
-- 	end),
-- 	op.select(function (v, i)
-- 		return v > 2
-- 	end)
-- )
-- :print():value(), "test pip")



-- local obable2 = biu:createState(3)
-- local obable = biu:of({e=obable2})

-- local state = biu:createState({a=1,b=2,c={d=obable}})
-- state
-- :get("c", "d")
-- :map(function (v)
-- 	v.e = v.e+1
-- 	return v
-- end)
-- :subscribe(function ( ... )
-- 	dump(..., "state subscribe")
-- end)

-- state:set({c={d={f=3}}})
-- state:any("a", "b"):subscribe(function (a, b)
-- 	print("4444444", a, b)
-- end)
-- obable2:set(5)


local state1 =biu:createState({a=3, arr={1,2,3,4,5,6,7,8,9}})
local state2 =biu:createState({b=4})
local state3 =biu:createState({c=5})
-- state1:merge(state2):dump("test merge"):subscribe(function ( ... )
	
-- end)

-- state1:with(state2):subscribe(function (a, b)
-- 	dump(a, "with a")
-- 	dump(b, "with b")
-- end)

-- state1:sample(state2):dump("teset sample"):subscribe(function (a, b)
-- end)
-- state1:set(33)
-- state2:set(1)

-- state1:join(state2, state3, function (a, b, c)
-- 	dump(a, "join a")
-- 	dump(b, "join b")
-- 	dump(c, "join c")
-- end):subscribe(function ( ... )
-- 	-- body
-- end)
-- state1:set(1)
-- state3:set(21)

-- state1:get():subscribe(function (v)
-- 	dump(v, "test _delete arr")
-- end)

-- state1:set({arr={[2]="_delete"}, a="_delete"})
