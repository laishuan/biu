
local util = {}
local unpack = table.unpack or unpack
local pack = table.pack or function(...) return { n = select('#', ...), ... } end


util.unpack = unpack
util.pack = pack

util.eq = function(x, y) return x == y end
util.noop = function() end
util.identity = function(x) return x end
util.constant = function(x) return function() return x end end
util.keys = function (v)
	local ret = {}
	for k,v in pairs(v) do
		ret[#ret+1] = k
	end
	return ret
end
local rptChar, tostr, split

util.split = function (inputstr, c)
        if c == nil then
                c = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..c.."]+)") do
                table.insert(t, str)
        end
        return t
end

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
            str = str .. rptChar('\t', deep+1) .. k .. ":" .. util.tostr(v, deep+1) .. "\n"
        end
        str = str .. rptChar('\t', deep) .. "}\n"
        return str
    end
end-- util.lua

util.tostr = tostr

util.tEqual = function (v1, v2)
  if v1 == v2 then
    return true
    elseif type(v1) ~= "table" or type(v2) ~= "table" then
        return v1 == v2
    else
      local empty1 = true
        for k,v in pairs(v1) do
          empty1 = false
            if not util.tEqual(v2[k], v) then
                return false
            end
        end
      local empty2 = true
        for k,v in pairs(v2) do
          empty2 = false
            if not util.tEqual(v1[k], v) then
                return false
            end
        end
        if empty1 ~= empty2 then
          return false
        end

        return true
    end
end

util.diff = function (t1, t2)
  if type(t1) ~= 'table' or type(t2) ~= "table" then
    return
  end
  local ret
  local getRet = function ( ... )
    if not ret then ret={} end
    return ret
  end
  for k,v in pairs(t1) do
    local v2 = t2[k]
    if type(v) ~= type(v2) then
      -- print("type not equal k:", k)
      -- print(type(v), type(v2))
      if v2 ~= nil then
        getRet()[k] = v2
      else
        getRet()[k] = "_delete"
      end
    elseif type(v) == "table" then
      -- print("type equal and all is talbe enter k:", k)
      local curDiff = util.diff(v, v2)
      if curDiff then
        getRet()[k] = curDiff
      end
    elseif v ~= v2 then
      -- print("value not equal k:", k)
      -- print(v, v1)
      getRet()[k] = v2
    end
  end

  for k,v in pairs(t2) do
    if t1[k] == nil then
      -- print("not t2 new add k", k)
      -- dump(v, "new add value")
      getRet()[k] = v
    end
  end

  return ret
end

util.dump = function (t, prefix, deep)
	if prefix then
		print(prefix, tostr(t, deep))
	else
		print(tostr(t, deep))
	end
end 

return util