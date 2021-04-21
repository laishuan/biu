local util = require "Util"
local biu = require "Biu"
local op = (require "Op").op
local dump = util.dump

local state1 =biu:createState({a=3, arr={1,2,3,4,5,6,7,8,9}})
local state2 =biu:createState({b=4})
local state3 =biu:createState({c=5,d=1})



-- test arr
-- local t = biu:fromArr({11,22,3, 1, 123123,123123}):reverse()
-- :scan(function (state, v, i)
-- 	return state + v*i, i
-- end, 0)
-- :sum()
-- :value()
-- util.dump(t, "test t")


-- test fromObj
-- dump(biu:fromObj({a=3, b=4}):startWith(5,"c")
-- :map(function (v,k)
-- 	return v+1, k
-- end)
-- :value())

--test fromRange
-- dump(biu:fromRange(1,10):map(function (v, i)
-- 	return v+1, i
-- end):value(), "range 1 10")

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
-- :value(), "test pip")


-- test state base
-- local obable2 = biu:createState(3)
-- local obable = biu:of({e=obable2})

-- local state = biu:createState({a=1,b=2,c={d=obable}})
-- state
-- :get("c", "d")
-- :map(function (v)
-- 	v.e = v.e+1
-- 	return v
-- end)
-- :subscribe(function (v)
-- 	dump(v, "state subscribe")
-- end)

-- state:set({c={d={f=3}}})
-- state:any("a", "b"):subscribe(function (a, b)
-- 	print("4444444", a, b)
-- end)
-- state:set({a=22})


--test state  merge with join  arr delete order

-- state1:merge(state2):dump("test merge"):subscribe(function ( ... )
-- 	print(...)
-- end)

-- state1:with(state2, state3):subscribe(function (a, b, c)
-- 	dump(a, "with a")
-- 	dump(b, "with b")
-- 	dump(c, "with c")
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


-- local state4 = biu:createState(1)
-- state4:order(10):subscribe(function ( ... )
-- 	print("test10")
-- end)
-- state4:order(3):subscribe(function ( ... )
-- 	print("test20")
-- end)
-- state4:set(2)


--test tp

-- local state = biu:createState()

-- state:tp('aaa'):subscribe(function (v1, v2)
-- 	dump(v1, "test aaa")
-- 	dump(v2, "test aaa")
-- end)

-- state:set("aaa", {3}, {a={b=332}})

-- local state = biu:createState({a=1})

-- state:flatMap(function (v)
-- 	return biu:promise(function (resolve)
-- 	end)
-- 	:next(function (resolve)
-- 		-- body
-- 	end)
-- 	:next(function (resolve)
-- 		-- body
-- 	end)
-- 	:next(function (resolve)
-- 		-- body
-- 	end)
-- 	:next(function (resolve)
-- 		-- body
-- 	end)
-- 	:concat(biu:of(v))
-- end)
-- :run()


-- biu:of(false):map(function ( ... )
-- 	return false, 1
-- end):subscribe(function ( ... )
-- 	print(...)
-- end)

-- local state = biu:createState({d={1,2,3}, e=false})
-- state:get("e"):subscribe(function (v)
-- 	print('111111111')
-- 	dump(v, "test get 2 args")
-- end)
-- state:set({e=false})


-- biu:of(1):tap(function ( ... )
-- 	print("test tap", ...)
-- end):run()


-- biu:of(1):flatMap(function (v)
-- 	return biu:of(v, 2,3):map(function (v)
-- 		return v+1
-- 	end)
-- end):subscribe(function (v)
-- 	print("test flatMap:", v)
-- end)

-- local state = biu:createState(3)
-- state:changeFrom(1):tap(function ( ... )
-- 	print("test change to ", ...)
-- end):run()
-- state:set(1)
-- state:set(1)
-- state:set(1)
-- state:set(2)

-- biu:of(1,2,3):tap(print):concat(biu:of(4,5,6):tap(print)):concat(biu:of(6454545,5,6):tap(print)):run()

-- dump(util.split("aaa.b", "."))

-- local state = biu:createState({index=3})
-- state:order(2):get("index"):subscribe(print)
-- state:set({index=222})