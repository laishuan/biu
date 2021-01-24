-- render.lua
local rx = require "lib.rx"

local biu = {}
biu.net = rx.Subject.create()
biu.click = rx.Subject.create()
biu.touch = rx.Subject.create()

biu.init = function (evts)
	evts:filter(function (tp, ...)
		return biu[tp]
	end):distinctUntilChanged():subscribe(function (tp, ...)
		print(...)
		biu[tp]:onNext(...)
	end)
end

local curEnter, curExit
biu.useState = function (data)
	local state = rx.Subject.create()
	return {state:startWith(data), function (v)
		state:onNext(v)
	end}
end

biu.useEffect = function (f)
	if curEnter and curExit then
		curEnter:subscribe(function ( ... )
			curExit:subscribe(f())
		end)
	end
end

biu.render = function (uiData)
	local tostr, rptChar
	rptChar = function (char, times)
		if times <= 0 then
			return ""
		end
		return char .. rptChar(char, times - 1)
	end
	tostr = function (v, deep)
		deep = deep or 0
		if type(v) ~= "table" then
			return tostring(v)
		else
			local str = "{\n"
			for k,v in pairs(v) do
				str = str .. rptChar('\t', deep+1) .. k .. ":" .. tostr(v, deep+1) .. "\n"
			end
			str = str .. rptChar('\t', deep) .. "}\n"
			return str
		end
	end
	rx.Observable.of(uiData):dump("render: ", tostr)
end


return biu