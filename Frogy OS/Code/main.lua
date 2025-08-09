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
    print("compile = compiles lua to a .fro file (FrogyOS executable file)")
    print("run = run a .fro file (FrogyOS executable file)")
end
if cmd == "sys" then
    print("Version Number:  V1.00")
    print("Version Name: FrogyOS Dawn")
end
if cmd == "quit" then
return
end
if cmd == "lua" then
    io.write("Filename: ")
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
if cmd == "compile" then
    io.write("Name of Lua file to compile (without file extension): ")
    local cmp = io.read()
    local infile = io.open("U:/" .. cmp .. ".lua", "r")
    if not infile then
    print("Could not open input file.")
    return
    end

    local contents = infile:read("*a")
    infile:close()

    local cmpf = io.open("U:/" .. cmp .. ".fro", "w")
    cmpf:write(contents)
    cmpf:close()

    print("Compiled " .. cmp .. ".lua to " .. cmp .. ".fro")
end
if cmd == "run" then
    io.write("Name Of .fro file (no file extension): ")
    local fron = io.read()
    dofile("U:/" .. fron .. ".lua")
end
end
