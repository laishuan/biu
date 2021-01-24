-- util.lua

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