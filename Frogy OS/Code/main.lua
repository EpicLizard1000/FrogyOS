slpr = require('modules/slowprint')
local save = dofile("save.lua")
print("For a list of commands type help")
while true do
io.write("[" .. save.username .. "@FrogyOS] ")
local cmd = io.read()

if cmd == "help" then
    print("sys = os information")
    print("quit = quits FrogyOS")
    print("lua = runs lua")
    print("te = text editor")
end
if cmd == "sys" then
    print("Version Number:  V1.00")
    print("Version Name: FrogyOS BETA")
end
if cmd == "quit" then
return
end
if cmd == "lua" then
    io.write("Filename")
    local fn = io.read()
    dofile("U:/" .. fn)
end
if cmd == "te" then
    io.write("New File Name: ")
    local nfn = io.read()
    local file = io.open("U:/" .. nfn, "w")



    io.write("Enter content: ")
    local cnt = io.read()

    file:write(cnt)
    file:close()

end
end