local biu = require 'core.biu'
local util = biu.util
local tostr, tEqual = util.tostr, util.tEqual

-- local state1 = biu.createState({
-- 	a=3,
-- 	b=2,
-- 	c={
-- 		1,2,3
-- 	},
-- 	d={8910,11,1}
-- })

-- local state2 = biu.createState({
-- 	a={
-- 		t = 3,
-- 		b = {
-- 			f = 4
-- 		}
-- 	},
-- 	b=2,
-- 	c={
-- 		1,2,3
-- 	},
-- 	a1 = state1:get("a"),
-- 	c1 = state1:get("c")
-- })


-- state2:get("a", "b"):subscribe(function (v)
-- 	print('a b ================ is' .. tostr(v))
-- end)
-- state2:get("a", "b", "f"):subscribe(function (v)
-- 	print('a b f ================ is' .. tostr(v))
-- end)

-- state2:get("b", "c"):subscribe(function (v)
-- 	print('b c ================ is' .. tostr(v))
-- end)

-- state2({a={b={e=3}}})
-- state2({b={c=14}})



-- state2:get("c1"):subscribe(function (v)
-- 	print('c1 ================ is' .. tostr(v))
-- end)

-- state2({c1=4})
-- state2({a={b={e=2}}})
-- state2({c1=state1:get("a")})

-- state2:get("c1", 1):subscribe(function (v)
-- 	print('c1 1 ================ is' .. tostr(v))
-- end)

-- state2({c1=1})


-- local keys = biu.createState({"c", "d"})
-- local datac = {
-- 	d=3,
-- 	e={
-- 		f=1
-- 	}
-- }
-- local state3 = biu.createState(
-- 	{
-- 		a = "1",
-- 		b = "2",
-- 		c = datac
-- 	}
-- )
-- state3:get(keys):subscribe(function (v)
-- 	print("state3 keys =============== ", tostr(v))
-- end)

-- datac.d=4
-- keys({"c"})
-- state3({c=datac})
-- local datad = {
-- 	d=5,
-- 	e={
-- 		f=2
-- 	}
-- }
-- state3({c=datad})
-- keys({"a"})
