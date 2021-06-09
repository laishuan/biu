local util = require "Util"
local biu = require "Biu"
local op = (require "Op").op
local dump = util.dump

local state1 =biu:createState({a=3, arr={1,2,3,4,5,6,7,8,9}})
local state2 =biu:createState({b=4})
local state3 =biu:createState({c=5,d=1})

--- test state set
local state = biu:createState()
state:set({a=1,b={c=2,d={3,4,5}}})
state:set({a="_delete"})
dump(state)
state:set({a="_delete"})
dump(state)
state:set({b="_delete"})
dump(state)


-- test any
-- local state = biu:createState({aaa=state1:get("a"), bbb = state2:get("b")})
-- state:any("aaa", "bbb"):map(function (v1, v2)
-- 	print("enter any", v1, v2)
-- 	return v1
-- end):run()


-- test concat flatten
-- local a = biu:of(
-- 	biu:fromArr({1,2,3})._subscribe,
-- 	biu:fromArr({4,5,6})._subscribe,
-- 	biu:fromArr({7,8,9})._subscribe
-- ):flatten():print("aaa"):array():value()
-- dump(a)

-- dump(util.diff({a=1}, {a=1,c=1}))

-- test arr
-- local t = biu:fromArr({11,22,3, 1, 123123,123123})
-- :reverse()
-- :sort(function (a, b)
-- 	return a<b
-- end)
-- :shuffle()
-- :push(321)
-- :slice(2,100)
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
-- local state5 = state4:order(11)

-- state5:subscribe(function ( ... )
-- 	print("state5", ...)
-- end)

-- state4:order(101):subscribe(function ( ... )
-- 	print("test101", ...)
-- end)
-- state4:order(312):subscribe(function ( ... )
-- 	print("test312", ...)
-- end)
-- state4:set(22)


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


-- local ob = biu:createState({[1]=2,[2] = 3,[3]=2,[4]="_delete"})
-- local state = biu:createState(ob)
-- state:get():dump("test _delete"):run()
-- ob:set({[1]=2,[2] = 13,[3]="_delete"})
-- ob:set({[1]=2,[2] = 13,[3]="1"})
-- ob:set({[1]=1,[2]="_delete"})

-- local state = biu:createState(1)
-- local a = state:subscribe(function ( ... )
-- 	print(...)
-- end)

-- state:set(2)
-- state:set(3)
-- a()
-- state:set(4)


-- local obPms = biu:promise(function (resolve)
-- 	resolve({a=2,b=2,c={aa=1,bb={aaa=1}}})	
-- end)
-- obPms:next(function (resolve, data)
-- 	data.a = data.a+1
-- 	resolve(data)
-- end)
-- :print('after 1')
-- :next(function (resolve, data)
-- 	data.b = 20
-- 	resolve(data)
-- end)
-- :print("after 2")
-- :next(function (resolve, data)
-- 	data.d = data.c
-- 	data.c = {e=3}
-- 	resolve(data)
-- end)
-- :print("after 3")
-- :run()


-- local state1 = biu:createState(false)
-- local temp = state1:map(function ( ... )
-- 	return false
-- end)
-- local state2 = biu:createState(1)
-- temp:join(state2):subscribe(function ( ... )
-- 	print (...)
-- end)
-- print(true and 3==2)
-- state2:set(333)

-- local state = biu:createState("")
-- local count = 1
-- state:changeTo("evt"):subscribe(function ( ... )
-- 	print('enter evt')
-- 	count = count + 1
-- 	if count < 10 then
-- 		state:set("check")
-- 	end
-- end)

-- state:changeTo("wait"):subscribe(function ( ... )
-- 	print('enter wait')
-- 	count = count + 1
-- 	if count < 10 then
-- 		state:set("evt")
-- 	end
-- end)

-- state:changeTo("check"):subscribe(function ( ... )
-- 	print('enter check')
-- 	count = count + 1
-- 	-- print("count:", count)
-- 	if count < 10 then
-- 		state:set("wait")
-- 	end
-- end)

-- state:set("wait")

-- local state1 = biu:of(123)
-- local state2 = state1:wait(biu:of(1,2,3))
-- state2:subscribe(print)

-- dump(biu:of({a=1,b=2,c=3}):breakup():print("trest"):value())

-- biu:of(1,2,3,4,5):buffer(2):subscribe(dump)

-- biu:of(1,2,3):wait(biu:of(11), biu:of(21), biu:of(31)):subscribe(print)

-- local state = biu:createState({a=1})
-- state:flatMap(function (v)
-- 	return biu:fromRange(1,10)
-- end):print():run()

-- biu:of({1,2,3,4,5}):unpack():takeArgs(4):print("test"):run()

-- dump(biu:of(1,2,3,4,5):splice(1,0,4):print("test vvv"):value()) 