local slowprint = {}

local function sleep(t)
    for i = 1, t * 1000000 do end
end

function slowprint.slowprint(text, delay)
    delay = delay or 0
    for i = 1, #text do
        io.write(text:sub(i, i))
        io.flush()
        if delay > 0 then sleep(delay) end
    end
    print()
end

function slowprint.wait(seconds)
    sleep(seconds * 100)
end

function slowprint.saveCredentials(username, password)
    local file = io.open("save.lua", "w")
    file:write("return {\n")
    file:write('    username = "' .. username .. '",\n')
    file:write('    password = "' .. password .. '"\n')
    file:write("}")
    file:close()
end

function slowprint.loadCredentials()
    local exists = io.open("save.lua", "r")
    if not exists then return nil, nil end
    exists:close()
    local data = dofile("save.lua")
    return data.username, data.password
end

return slowprint
