require 'core.util'
local biu = require 'core.biu'
local game = require 'game'
local rx = require "lib.rx"

local evts = rx.Subject.create()

biu.init(evts)
biu.render(game)

local timmer = rx.Subject.create()
local file = rx.Observable.fromFileByLine("evt.txt")
timmer:subscribe(function (time)
	file:subscribe(function (str)
		local arr = string.split(str, ',')
		evts:onNext(arr[1], arr[2])
	end)
end)
while true do
	os.execute("ping -n 2 127.1 > nul")
	timmer:onNext(os.clock())
end



