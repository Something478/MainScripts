local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
    Name = "Breeze hub",
    LoadingTitle = "Breeze hub",
    LoadingSubtitle = "Bởi ChillbyteHD",
    Theme = "Amethyst",
    ToggleUIKeybind = Enum.KeyCode.B,
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "TrungTâmGió",
        FileName = "Settings"
    },
    Discord = {Enabled = false},
    KeySystem = false
})

local fpsTab = Window:CreateTab("Tăng FPS")
fpsTab:CreateButton({
    Name = "Tăng FPS︱TSB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MerebennieOfficial/ExoticJn/refs/heads/main/FpsBooster"))()
    end
})

local anyTab = Window:CreateTab("Bất kỳ hero nào")
anyTab:CreateButton({
    Name = "Người Thùng Rác",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man", true))()
    end
})
anyTab:CreateButton({
    Name = "Công cụ bay",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Flight%20Tool%20Obfuscated.txt", true))()
    end
})

local saiTab = Window:CreateTab("Dành cho Saitama")
saiTab:CreateButton({
    Name = "Gojo Moveset",
    Callback = function()
        getgenv().FatalCombatSkillLayout = true
        getgenv().MovesetReachSound = true
        loadstring(game:HttpGet("https://gist.githubusercontent.com/SonicexePort/d83f3eca5e8092468df1551df09db39a/raw/861f16fbae8fab8803cabfbc01295bb5b687f86a/Death%20Port%20Six%20Eyes%20Public%20Beta"))()
    end
})
saiTab:CreateButton({
    Name = "Golden Head Moveset",
    Callback = function()
        getgenv().stand = false
        getgenv().ken = false
        getgenv().Spawn = false
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Saitama%20to%20golden%20sigma'))()
    end
})
saiTab:CreateParagraph({
    Title = "Giải thích Golden Head:",
    Content = "Khi Ultimate được kích hoạt, có 60% cơ hội thành công và 40% cơ hội thất bại và nhận Death Counter."
})
saiTab:CreateButton({
    Name = "Shinji Moveset",
    Callback = function()
        getgenv().speedtools = true
        getgenv().speedpunch = true
        getgenv().dance = false
        getgenv().night = false
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Shinji%20tp%20exploit'))()
    end
})

local sweatTab = Window:CreateTab("Dành cho Garou")
local Section = sweatTab:CreateSection("FriedPotato's")
sweatTab:CreateButton({
    Name = "Dịch chuyển nhân vật",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Teleport%20Guy.txt", true))()
    end
})
sweatTab:CreateButton({
    Name = "Void Reaper",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Void%20Reaper%20Obfuscated.txt"))()
    end
})
sweatTab:CreateParagraph({
    Title = "Thông báo!",
    Content = "Void Reaper không thể sử dụng Void nữa :("
})
sweatTab:CreateButton({
    Name = "Chainsaw Man",
    Callback = function()
        getgenv().RunSpeed = 100
        getgenv().RunJump = 100
        getgenv().InstaKill = true
        getgenv().RevivePercent = 100
        getgenv().ChangeWalk = true
        getgenv().ChangeIdle = true
        getgenv().Night = false
        getgenv().DashNoCooldown = true
        getgenv().ExtraSkills = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/CHAINSAW%20MAN/Chainsaw%20Man%20(Obfuscated).txt"))()
    end
})
sweatTab:CreateParagraph({
    Title = "THÔNG BÁO!",
    Content = "!! Chainsaw Man có thể làm lag thiết bị yếu !!"
})

local SectionOther = sweatTab:CreateSection("Các tính năng khác")
sweatTab:CreateButton({
    Name = "A-Train Moveset",
    Callback = function()
        getgenv().settings = {
            morph = {enabled = false, dontchangeskincolor = false},
            ult_forcewalkspeed = true,
            ult_walkspeed = 60,
            tp_duration = 0.15
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/ATrainSounds/refs/heads/main/ATrain.lua"))()
    end
})
sweatTab:CreateButton({
    Name = "Goku Moveset",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Hero-hunter-moveset-into-OP-goku-moveset-17468"))()
    end
})
