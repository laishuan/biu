local biu = require 'core.biu'
local game = require 'game'
local rx = require "lib.rx"

local evts = rx.Subject.create()

-- biu.init(evts)
-- biu.render(game)

local state1, setState1 = biu.useState({
	a=3,
	b=2,
	c={
		1,2,3
	},
	d={8910,11,1}
})

local state2, setState2 = biu.useState({
	a={
		t = 3,
		b = {
			f = 4
		}
	},
	b=2,
	c={
		1,2,3
	},
	a1 = state1:get("a"),
	c1 = state1:get("c")
})

-- state2:get("a", "b"):subscribe(function (v)
-- 	print('a b ================ is' .. tostr(v))
-- end)
-- state2:get("a", "b", "f"):subscribe(function (v)
-- 	print('a b f ================ is' .. tostr(v))
-- end)

-- state2:get("b", "c"):subscribe(function (v)
-- 	print('b c ================ is' .. tostr(v))
-- end)

-- setState2({a=11})
-- setState2({b={c=14}})

state2:get("c1"):subscribe(function (v)
	print('c1 ================ is' .. tostr(v))
end)

state2:get("c1", 1):subscribe(function (v)
	print('c1 1 ================ is' .. tostr(v))
end)

setState2({c1=1})
