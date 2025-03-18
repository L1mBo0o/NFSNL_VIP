-- **🔑 Sistem Login**
local username = "user123"  -- Ganti dengan username Anda
local password = "pass123"  -- Ganti dengan password Anda

function login()
    while true do
        local input = gg.prompt(
            {"Masukkan Username:", "Masukkan Password:"}, 
            nil, 
            {"text", "text"} -- Menggunakan "text" agar keyboard angka tidak muncul
        )
        
        if input == nil then
            gg.alert("⚠ Silakan masukkan kredensial!")
            os.exit()
        elseif input[1] == username and input[2] == password then
            gg.alert("✅ Login berhasil! Selamat datang, " .. username)
            break
        else
            gg.alert("❌ Login gagal! Script ditutup.")
            os.exit()
        end
    end
end

login()  -- Memanggil fungsi login

-- **🚀 Proteksi GameGuardian**
local allowedGG = "com.wfb"
local currentGG = gg.PACKAGE

if currentGG ~= allowedGG then
    gg.alert("❌ Script ini hanya bisa dijalankan di LIMBO GameGuardian")
    os.exit()
end

gg.toast("✅ GameGuardian terverifikasi, script berjalan!")

-- **⏳ Fitur Expired (Tanpa `.0`)**
local expirationDate = os.time({year=2025, month=4, day=1, hour=23, min=59})  -- Expired pada 1 April 2025 pukul 23:59

function checkExpiration()
    local now = os.time()
    local remainingTime = expirationDate - now

    if remainingTime <= 0 then
        gg.alert("⚠ Script anda telah expired! Akses ditutup.")
        os.exit()
    else
        local daysLeft = math.floor(remainingTime / 86400)  -- Konversi ke hari
        local hoursLeft = math.floor((remainingTime % 86400) / 3600)  -- Sisa jam setelah hari dihitung
        local minutesLeft = math.floor((remainingTime % 3600) / 60)  -- Sisa menit setelah jam dihitung

        -- Menghapus ".0" dengan mengkonversi ke string bulat
        local message = string.format("⏳ Script anda akan expired dalam %d hari, %d jam, dan %d menit.", 
                                      daysLeft, hoursLeft, minutesLeft)

        gg.alert(message)
    end
end

checkExpiration()

-- **🔹 Menu Utama**
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
