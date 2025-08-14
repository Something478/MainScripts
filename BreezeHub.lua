--- // ==== Blacklist ==== \\ ---
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local function notify(title, text, dur)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = dur or 3
    })
end

local TARGET_USERNAMES = loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/Blacklist.lua"))()
local TAG_NAME = "Blacklisted"
local TargetLookup = {}

for _, name in pairs(TARGET_USERNAMES) do
    TargetLookup[name] = true
end

local function blacklistPlayer(player)
    if player.Character then
        if player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild(TAG_NAME) then
            return
        end
        notify("From ChillbyteHD", "You Are Blacklisted by the owner, sorry! :(", 3)
        local tag = Instance.new("StringValue")
        tag.Name = TAG_NAME
        tag.Parent = player.Character:FindFirstChild("Head") or player.Character
    end
end

for _, player in pairs(Players:GetPlayers()) do
    if TargetLookup[player.Name] then
        blacklistPlayer(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if TargetLookup[player.Name] then
        player.CharacterAdded:Connect(function()
            blacklistPlayer(player)
        end)
    end
end)

--- // ==== DevTag ==== \\ ---
loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/DevTag.lua"))()

--- // ==== Rayfield ==== \\ ---
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Breeze hub",
    LoadingTitle = "Breeze hub",
    LoadingSubtitle = "By ChillbyteHD",
    Theme = "Amethyst",
    ToggleUIKeybind = Enum.KeyCode.B,
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "BreezeHub",
        FileName = "Settings"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

local fpsTab = Window:CreateTab("FPS Booster")
fpsTab:CreateButton({
    Name = "FPS Booster︱TSB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MerebennieOfficial/ExoticJn/refs/heads/main/FpsBooster"))()
    end
})

local anyTab = Window:CreateTab("Any hero")
anyTab:CreateButton({
    Name = "Trashcan Man",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man", true))()
    end
})
anyTab:CreateButton({
    Name = "Flight Tool",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Flight%20Tool%20Obfuscated.txt", true))()
    end
})

local saiTab = Window:CreateTab("For Saitama")
saiTab:CreateButton({
    Name = "Gojo Moveset",
    Callback = function()
        getgenv().FatalCombatSkillLayout = true
        getgenv().MovesetReachSound = true
        loadstring(game:HttpGet("https://gist.githubusercontent.com/SonicexePort/d83f3eca5e8092468df1551df09db39a/raw/861f16fbae8fab8803cabfbc01295bb5b687f86a/Death%20Port%20Six%20Eyes%20Public%20Beta"))()
    end
})
saiTab:CreateButton({
    Name = "Golden head Moveset",
    Callback = function()
        getgenv().stand = false
        getgenv().ken = false
        getgenv().Spawn = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Saitama%20to%20golden%20sigma"))()
    end
})
saiTab:CreateParagraph({
    Title = "Golden head explanation:",
    Content = "When ultimate is activated there is 60% to get it and 40% to lose and get death counter."
})
saiTab:CreateButton({
    Name = "Shinji Moveset",
    Callback = function()
        getgenv().speedtools = true
        getgenv().speedpunch = true
        getgenv().dance = false
        getgenv().night = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Shinji%20tp%20exploit"))()
    end
})

local sweatTab = Window:CreateTab("For Garou")
local Section = sweatTab:CreateSection("FriedPotato's")
sweatTab:CreateButton({
    Name = "Teleport Guy",
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
    Title = "Notice!:",
    Content = "Void reaper can't void anymore :("
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
    Title = "NOTICE!",
    Content = "!! Chainsaw man will lag low-performing devices !!"
})

local SectionOther = sweatTab:CreateSection("Other stuff")
sweatTab:CreateButton({
    Name = "A-Train moveset",
    Callback = function()
        getgenv().settings = {
            morph = { enabled = false, dontchangeskincolor = false },
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
