-- /// Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

-- /// Blacklist
local function notif(str, dur)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Service";
        Text = str;
        Duration = dur or 3;
    })
end
local TARGET_USERNAMES = loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/Blacklist.lua"))()
local TAG_NAME = "Blacklisted"
local TargetLookup = {}
for _, name in pairs(TARGET_USERNAMES) do
    TargetLookup[name] = true
end
local function Blacklist(player)
    if player.Character then
        if player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild(TAG_NAME) then
            return
        end
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "From ChillbyteHD";
            Text = "You are blacklisted by the owner, sorry! :(";
            Duration = 3;
        })
    end
end
for _, player in pairs(Players:GetPlayers()) do
    if TargetLookup[player.Name] then
        Blacklist(player)
        return
    end
end

-- /// DevTag
loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/DevTag.lua"))()

-- /// Set Up
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
    Name = "Gubby hub",
    LoadingTitle = "Gubby hub",
    LoadingSubtitle = "By ChillbyteHD",
    Theme = "Amethyst",
    ToggleUIKeybind = Enum.KeyCode.B,
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = { Enabled = true, FolderName = "GubbyHubOfficial", FileName = "Settings" },
    Discord = {Enabled = false},
    KeySystem = false
})
local player = game.Players.LocalPlayer
local task = game:GetService("RunService")
local preventToolsEnabled = false
local toolFriend = nill
local charFriend = nil

function setupToolListener(char)
    if toolFriend then toolFriend:Disconnect() end
    toolFriend = char.ChildAdded:Connect(function(child)
        if preventToolsEnabled and child:IsA("Tool") then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end)
end

function onCharacterAdded(char)
    setupToolListener(char)
end

if player.Character then onCharacterAdded(player.Character) end
charFriend = player.CharacterAdded:Connect(onCharacterAdded)
local Place = game.PlaceId

-- /// Read Tab
local readTab = Window:CreateTab("READ")
if Place ~= 88308889239232 and Place ~= 17574618959 then
    readTab:CreateParagraph({ Title = "Game Not Supported", Content = "Some features from this hub are removed." })
    readTab:CreateDivider()
end
readTab:CreateParagraph({ Title = "!! PLEASE READ THIS !!", Content = "I DO NOT OWN THE SCRIPTS IN THIS SCRIPT!!! ALL CREDIT GOES TO RESPECTIVE OWNERS OF THE SCRIPTS!!" })
if Place == 88308889239232 or Place == 17574618959 then
    readTab:CreateParagraph({ Title = "How to use this hub? 🤔", Content = " If you're gonna use genesis, go to the Genesis rigs tab, once your done loading the hats and rigs, head to the Genesis tab and execute the scripts there!!" })
end
readTab:CreateParagraph({ Title = "Shortcut", Content = "+︱Needs a keyboard & will have keybinds\n-︱Doesn't need a keyboard & will not have keybinds" })
if Place == 88308889239232 or Place == 17574618959 then
    local Section = readTab:CreateSection("Other")
    readTab:CreateParagraph({ Title = "!! Notice !!", Content = "Credits to Theo for the idea of adding genesis, he's a cool guy make sure to check out his hub too! :)" })
end
readTab:CreateSection("Info")
readTab:CreateDivider()
readTab:CreateParagraph({ Title = "Owner of the hub:", Content = "ChillbyteHD" })
readTab:CreateParagraph({ Title = "My Discord username:", Content = "ChillbyteHD" })

-- /// Universal Tab
local uniTab = Window:CreateTab("Main")
local function addButton(name, url)
    uniTab:CreateButton({ Name = name, Callback = function() loadstring(game:HttpGet(url))() end })
end

addButton("Nameless Admin", "https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua")
addButton("Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
addButton("Rochips Panel", "https://glot.io/snippets/gzrux646yj/raw/main.ts")
addButton("Hub by Theo", "https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/JustABaseplateHub.lua")
addButton("Cloud hub", "https://pastefy.app/X6fuVyEZ/raw")
addButton("Pilots hub", "https://pastefy.app/U1o71wOq/raw")
addButton("KaterHub V3", "https://katerhub-inc.github.io/KaterHub/main.lua")

-- /// My Tab
local myTab = Window:CreateTab("Made by me")
myTab:CreateToggle({
    Name = "Prevent tools",
    CurrentValue = false,
    Flag = "PreventToolsToggle",
    Callback = function(Value)
        preventToolsEnabled = Value
        local char = player.Character
        if char then
            local tool = char:FindFirstChildOfClass("Tool")
            if tool and preventToolsEnabled then
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then humanoid:UnequipTools() end
            end
        end
    end
})
local function addMyButton(name, url) myTab:CreateButton({ Name = name, Callback = function() loadstring(game:HttpGet(url))() end }) end

addMyButton("Kill Gui", "https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/KillGUI.lua")
addMyButton("Dupe Gui", "https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/DupeGUI.lua")
myTab:CreateParagraph({ Title = "Note", Content = "Kill GUI & Dupe GUI needs R6 & a Roblox Gear.\nExample gear: Bloxy cola." })
myTab:CreateSection("Reanimation")
addMyButton("Giant Krystal Dance", "https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/GiantKD.lua")
myTab:CreateSection("Visual")
addMyButton("Qwerty Mode", "https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/QwertyMode.lua")
addMyButton("CRD (Config Render Distance)", "https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/CRD.lua")

-- /// Keyboards Tab
local keyTab = Window:CreateTab("Keyboards")
local function addKeyButton(name, url) keyTab:CreateButton({ Name = name, Callback = function() loadstring(game:HttpGet(url))() end }) end
addKeyButton("My Keyboards", "https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/SelectKeyboard.lua")
addKeyButton("Delta Keyboard", "https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt")
addKeyButton("Virtual Keyboard", "https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/VirtualKeyboard.lua")
addKeyButton("Mob Keyboard", "https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt")

-- /// PermaDeath Tab
if Place == 88308889239232 or Place == 17574618959 then
    local pdTab = Window:CreateTab("PermaDeath")
    local function addPDButton(name, url) pdTab:CreateButton({ Name = name, Callback = function() loadstring(game:HttpGet(url))() end }) end
    addPDButton("Krystal Dance", "https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/KrystalDance.lua")
    pdTab:CreateParagraph({ Title = "Credits", Content = "To mzha on scriptblox for working reanimation, to MrY7zz for fixed KDV3." })
    pdTab:CreateDivider()
    addPDButton("+︱Nameless Animations V4", "https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/NamelessAnimationsV4.lua")
end

-- /// Genesis Tab
local genTab = Window:CreateTab("Genesis")
local function addGenesis(name, url, keys)
    genTab:CreateButton({ Name = name, Callback = function() loadstring(game:HttpGet(url))() end })
    genTab:CreateParagraph({ Title = "Keybinds", Content = keys })
    genTab:CreateDivider()
end

addGenesis("+︱Krystal Dance", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance", "Q, E, R, T, Y, U, P, F, G, H, J, K, L")
addGenesis("+︱Neptunian V", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V", "F, Z, X, R")
addGenesis("+︱Sin Dragon", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon", "G, Z, X, C")
addGenesis("+︱Lightning Cannon", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon", "E, Z, X, C, V, B, M")
addGenesis("+︱Goner", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner", "Q")
addGenesis("+︱Ban Hammer", "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer", "E, R")

-- /// Genesis rigs Tab
local HatsTab = Window:CreateTab("Genesis rigs")
local function addRigButton(name, cmd) HatsTab:CreateButton({ Name = name, Callback = function() game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(cmd) end }) end

HatsTab:CreateParagraph({ Title = "IMPORTANT", Content = "Always load PermaDeath before reanimating." })
addRigButton("PermaDeath", "-pd")
addRigButton("Remove Hats", "-ch")
addRigButton("Respawn", "-re")
addRigButton("Save hats", "-sh")
HatsTab:CreateDivider()
HatsTab:CreateParagraph({ Title = "IMPORTANT!", Content = "It's important to always load the rigs so everyone can see you!" })
addRigButton("Genesis Rigs", "-gh 138364679836274 82942681251131 140395948277978 102599402682100 90960046381276 13058406993")
addRigButton("Genesis Rigs [Black]", "-gh 131385506535381 85392395166623 129462518582032 138364679836274 12850150835 106249329428811")
addRigButton("Neptunian V", "-gh 5316479641")
addRigButton("Sin Dragon", "-gh 117186631495734 99965319383570 132770514241770 3756389957 14864581977 150381051 4504231783")
addRigButton("Lightning Cannon", "-gh 111672581230926 126145101810389 136055191177936 4504231783")
addRigButton("Goner", "-gh 17770317484 17822722698 17822749561 17772174303 17835236579")
addRigButton("Ban Hammer", "-gh 15548314241")
