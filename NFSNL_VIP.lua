
local url = "https://raw.githubusercontent.com/L1mBo0o/script_auth/refs/heads/main/auth.txt" 


function checkLogin()
    local input = gg.prompt({"Username:", "Password:"}, nil, {"text", "text"})
    if not input then os.exit() end

    local http = gg.makeRequest(url)
    if not http or not http.content then
        gg.alert("⚠ Gagal menghubungi server!")
        os.exit()
    end

    local userData = http.content
    local lines = {}


    for line in userData:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end

    local found = false
    local expDate


    for _, line in ipairs(lines) do
        local user, pass, exp = line:match("([^:]+):([^:]+):([^:]+)")
        if user == input[1] and pass == input[2] then
            found = true
            expDate = exp
            break
        end
    end

    if not found then
        gg.alert("❌ Username atau Password salah! Script ditutup.")
        os.exit()
    end


    checkExpiration(expDate, input[1])
end


function checkExpiration(expDate, username)
    local year, month, day = expDate:match("(%d+)-(%d+)-(%d+)")
    local expirationTime = os.time({year=tonumber(year), month=tonumber(month), day=tonumber(day), hour=23, min=59})

    local now = os.time()
    local remainingTime = expirationTime - now

    if remainingTime <= 0 then
        gg.alert("❌ Akun " .. username .. " sudah expired! Akses ditutup.")
        os.exit()
    else
        local days = math.floor(remainingTime / 86400)
        local hours = math.floor((remainingTime % 86400) / 3600)
        local minutes = math.floor((remainingTime % 3600) / 60)


        local message = string.format("✅ Login berhasil!\n\n⏳ Akun %s akan expired dalam:\n%d hari, %d jam, %d menit.", 
                                      username, days, hours, minutes)

        gg.alert(message)
    end
end


local allowedGG = "com.wfb"
local currentGG = gg.PACKAGE

if currentGG ~= allowedGG then
    gg.alert("❌ Script ini hanya bisa dijalankan di LIMBO GameGuardian")
    os.exit()
end

gg.toast("✅ GameGuardian terverifikasi, script berjalan!")


function mainScript()
    gg.alert("🚀 Script berhasil divalidasi")
   
end

checkLogin() 
mainScript() 


function showMenu()
    local choices = {
        "Modify Gold",
        "Modify Cash",
        "Modify Scrap",
        "Modify Race Skips",
        "Modify Tuning Parts",
        "Modify Gasoline",
        "Exit"
    }

    local choice = gg.choice(choices, nil, "⚠ Script by: LIMBO MODZ ⚠\nChoose an option:")

    if choice == nil then
        gg.toast("No selection made")
        return
    end

    if choice == 1 then
        searchAndModify("Gold", "327688~327693")
    elseif choice == 2 then
        searchAndModify("Cash", "327688~327693")
    elseif choice == 3 then
        searchAndModify("Scrap", "327688~327693")
    elseif choice == 4 then
        searchAndModify("Race Skips", "327688~327693")
    elseif choice == 5 then
        searchAndModify("Tuning Parts", "327688~327693")
    elseif choice == 6 then
        searchAndModify("Gasoline", "327688~327693")
    elseif choice == 7 then
        gg.toast("Exiting script...")
        os.exit()
    end
end

while true do
    showMenu()
end

local url = "https://raw.githubusercontent.com/L1mBo0o/script_auth/refs/heads/main/auth.txt" 


function checkLogin()
    local input = gg.prompt({"Username:", "Password:"}, nil, {"text", "text"})
    if not input then os.exit() end

    local http = gg.makeRequest(url)
    if not http or not http.content then
        gg.alert("⚠ Gagal menghubungi server!")
        os.exit()
    end

    local userData = http.content
    local lines = {}


    for line in userData:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end

    local found = false
    local expDate


    for _, line in ipairs(lines) do
        local user, pass, exp = line:match("([^:]+):([^:]+):([^:]+)")
        if user == input[1] and pass == input[2] then
            found = true
            expDate = exp
            break
        end
    end

    if not found then
        gg.alert("❌ Username atau Password salah! Script ditutup.")
        os.exit()
    end


    checkExpiration(expDate, input[1])
end


function checkExpiration(expDate, username)
    local year, month, day = expDate:match("(%d+)-(%d+)-(%d+)")
    local expirationTime = os.time({year=tonumber(year), month=tonumber(month), day=tonumber(day), hour=23, min=59})

    local now = os.time()
    local remainingTime = expirationTime - now

    if remainingTime <= 0 then
        gg.alert("❌ Akun " .. username .. " sudah expired! Akses ditutup.")
        os.exit()
    else
        local days = math.floor(remainingTime / 86400)
        local hours = math.floor((remainingTime % 86400) / 3600)
        local minutes = math.floor((remainingTime % 3600) / 60)


        local message = string.format("✅ Login berhasil!\n\n⏳ Akun %s akan expired dalam:\n%d hari, %d jam, %d menit.", 
                                      username, days, hours, minutes)

        gg.alert(message)
    end
end


local allowedGG = "com.wfb"
local currentGG = gg.PACKAGE

if currentGG ~= allowedGG then
    gg.alert("❌ Script ini hanya bisa dijalankan di LIMBO GameGuardian")
    os.exit()
end

gg.toast("✅ GameGuardian terverifikasi, script berjalan!")


function mainScript()
    gg.alert("🚀 Script berhasil divalidasi")
   
end

checkLogin() 
mainScript() 


function showMenu()
    local choices = {
        "Modify Gold",
        "Modify Cash",
        "Modify Scrap",
        "Modify Race Skips",
        "Modify Tuning Parts",
        "Modify Gasoline",
        "Exit"
    }

    local choice = gg.choice(choices, nil, "⚠ Script by: LIMBO MODZ ⚠\nChoose an option:")

    if choice == nil then
        gg.toast("No selection made")
        return
    end

    if choice == 1 then
        searchAndModify("Gold", "327688~327693")
    elseif choice == 2 then
        searchAndModify("Cash", "327688~327693")
    elseif choice == 3 then
        searchAndModify("Scrap", "327688~327693")
    elseif choice == 4 then
        searchAndModify("Race Skips", "327688~327693")
    elseif choice == 5 then
        searchAndModify("Tuning Parts", "327688~327693")
    elseif choice == 6 then
        searchAndModify("Gasoline", "327688~327693")
    elseif choice == 7 then
        gg.toast("Exiting script...")
        os.exit()
    end
end

while true do
    showMenu()
end
