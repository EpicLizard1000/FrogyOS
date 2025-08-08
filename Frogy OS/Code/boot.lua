--Modules
slpr = require("modules/slowprint")

--Boot
slpr.slowprint("Booting FrogyOS ...", 200)
slpr.wait(3)
slpr.slowprint("FrogyOS Booted", 80)

--Load or setup credentials
local username, password = slpr.loadCredentials()

if not username or not password then
    slpr.wait(5)
    slpr.slowprint("FrogyOS Setup", 40)
    io.write("Please Type In A New Username: ")
    username = io.read()
    io.write("Please Type In A New Password: ")
    password = io.read()
    slpr.saveCredentials(username, password)
    slpr.wait(5)
    slpr.slowprint("Restarting in 5 seconds", 10)
    slpr.wait(5)
    dofile("boot.lua")
else
    io.write("Username: ")
    local unm = io.read()
    io.write("Password: ")
    local pwrd = io.read()

    if unm == username and pwrd == password then
        dofile("main.lua")
    else
        print("Invalid credentials. Try again.")
        dofile("boot.lua")
    end
end
