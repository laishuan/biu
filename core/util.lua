local rptChar
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
end-- util.lua

tEqual = function (v1, v2)
    if type(v1) ~= "table" or type(v2) ~= "table" then
        return v1 == v2
    else
        for k,v in pairs(v1) do
            if not tEqual(v2[k], v) then
                return false
            end
        end

        for k,v in pairs(v2) do
            if not tEqual(v1[k], v) then
                return false
            end
        end

        return true
    end
end

string.split = function (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    while string.match(inputstr, sep .. sep) do
        inputstr = string.gsub(inputstr, sep .. sep, sep .. "null" .. sep)
    end
    local lst = { }
    local n = string.len(inputstr)--长度
    local seplen = string.len(sep)
    local start = 1
    while start <= n do
        local i, e = string.find(inputstr, sep, start) -- find 'next' 0
        if i == nil then 
            table.insert(lst, string.sub(inputstr, start, n))
            break 
        end
        table.insert(lst, string.sub(inputstr, start, i-1))
        if i == n then
            table.insert(lst, "")
            break
        end
        start = e + 1
    end
    return lst
end