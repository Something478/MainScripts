-- /// Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TextChat = game:GetService("TextChatService")

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

-- /// Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
 Name = "Gubby hub",
 LoadingTitle = "Gubby hub",
 LoadingSubtitle = "By ChillbyteHD",
 Theme = "Amethyst",
 ToggleUIKeybind = Enum.KeyCode.B,
 DisableRayfieldPrompts = false,
 DisableBuildWarnings = false,
 ConfigurationSaving = {
  Enabled = true,
  FolderName = "GubbyHubOfficial",
  FileName = "Settings"
 },
 Discord = {Enabled = false},
 KeySystem = false
})

local player = game.Players.LocalPlayer
local task = game:GetService("RunService")

local preventToolsEnabled = false
local toolFriend = nil
local charFriend = nil

function setupToolListener(char)
 if toolFriend then
  toolFriend:Disconnect()
 end
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

if player.Character then
 onCharacterAdded(player.Character)
end

charFriend = player.CharacterAdded:Connect(onCharacterAdded)

local Place = game.PlaceId

-- /// Buttons shortcut 
local function addButton(tab, name, callback)
    tab:CreateButton({
        Name = name,
        Callback = callback
    })
end

-- /// Rigs shortcut
local function addRigButton(tab, name, cmd)
    tab:CreateButton({
        Name = name,
        Callback = function()
            TextChat.TextChannels.RBXGeneral:SendAsync(cmd)
        end
    })
end

-- /// Read tab
local readTab = Window:CreateTab("READ")
if Place ~= 88308889239232 and Place ~= 17574618959 then
 readTab:CreateParagraph({
  Title = "Game Not Supported",
  Content = "Some features from this hub are removed."
 })
 readTab:CreateDivider()
end
readTab:CreateParagraph({
 Title = "!! PLEASE READ THIS !!",
 Content = "I DO NOT OWN THE SCRIPTS IN THIS SCRIPT!!! ALL CREDIT GOES TO RESPECTIVE OWNERS OF THE SCRIPTS!!"
})
if Place == 88308889239232 or Place == 17574618959 then
 readTab:CreateParagraph({
  Title = "How to use this hub? 🤔",
  Content = " If you're gonna use genesis, go to the Genesis rigs tab, once your done loading the hats and rigs, head to the Genesis tab and execute the scripts there!!"
 })
end
readTab:CreateParagraph({
 Title = "Shortcut",
 Content = "+︱Needs a keyboard & will have keybinds\n-︱Doesn't need a keyboard & will not have keybinds"
})
if Place == 88308889239232 or Place == 17574618959 then
 local Section = readTab:CreateSection("Other")
 readTab:CreateParagraph({
  Title = "!! Notice !!",
  Content = "Credits to Theo for the idea of adding genesis, he's a cool guy make sure to check out his hub too! :)"
 })
end
readTab:CreateSection("Info")
readTab:CreateDivider()
readTab:CreateParagraph({
 Title = "Owner of the hub:",
 Content = "ChillbyteHD"
})
readTab:CreateParagraph({
 Title = "My Discord username:",
 Content = "ChillbyteHD"
})

-- /// Main tab
local uniTab = Window:CreateTab("Main")
addButton(uniTab, "Nameless Admin", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
end)
addButton(uniTab, "Infinite Yield", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
addButton(uniTab, "Rochips Panel", function()
 loadstring(game:HttpGet("https://glot.io/snippets/gzrux646yj/raw/main.ts"))()
 Rayfield:Notify({
  Title = "Rochips Panel",
  Content = "Loading... (Wait 2-30 seconds)",
  Duration = 5
 })
end)
addButton(uniTab, "Hub by Theo", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/JustABaseplateHub.lua"))()
end)
addButton(uniTab, "Cloud hub", function()
 return loadstring(game:HttpGet("https://pastefy.app/X6fuVyEZ/raw"))()
end)
addButton(uniTab, "Pilots hub", function()
 return loadstring(game:HttpGet("https://pastefy.app/U1o71wOq/raw"))()
end)
addButton(uniTab, "KaterHub V3", function()
 return loadstring(game:HttpGet("https://katerhub-inc.github.io/KaterHub/main.lua"))()
end)

-- /// My Tab
local myTab = Window:CreateTab("Made by me")

myTab:CreateSection("Item related")
addButton(myTab, "Kill Gui", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/KillGUI.lua"))()
end)
addButton(myTab, "Dupe Gui", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/DupeGUI.lua"))()
end)
myTab:CreateParagraph({
 Title = "Note",
 Content = "Kill GUI & Dupe GUI needs R6 & a Roblox Gear.\nExample gear: Bloxy cola."
})

myTab:CreateSection("Reanimation")
addButton(myTab, "Giant Krystal Dance", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/GiantKD.lua"))()
end)

myTab:CreateSection("Visual")
addButton(myTab, "Qwerty Mode", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/QwertyMode.lua"))()
end)
addButton(myTab, "CRD (Config Render Distance)", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/CRD.lua"))()
end)

-- /// Player tab
local playerTab = Window:CreateTab("LocalPlayer")
playerTab:CreateToggle({
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
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})

-- /// Keyboards tab 
local keyTab = Window:CreateTab("Keyboards")
addButton(keyTab, "My Keyboards", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/SelectKeyboard.lua"))()
end)
addButton(keyTab, "Delta Keyboard", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"))()
end)
addButton(keyTab, "Virtual Keyboard", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/VirtualKeyboard.lua"))()
end)
addButton(keyTab, "Mob Keyboard", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

if Place == 88308889239232 or Place == 17574618959 then

-- /// PermaDeath tab
 local pdTab = Window:CreateTab("PermaDeath")
addButton(pdTab, "Krystal Dance", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/KrystalDance.lua"))()
end)
pdTab:CreateParagraph({
 Title = "Credits",
 Content = "To mzha on scriptblox for working reanimation, to MrY7zz for fixed KDV3."
})
pdTab:CreateDivider()
addButton(pdTab, "+︱Nameless Animations V4", function()
 return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/NamelessAnimationsV4.lua"))()
end)
pdTab:CreateParagraph({
 Title = "Credits",
 Content = "To the owner of the script (I forgot his name)"
})


-- /// Genesis tab
 local genTab = Window:CreateTab("Genesis")
addButton(genTab, "+︱Krystal Dance", function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()
end)
genTab:CreateParagraph({
 Title = "Keybinds",
 Content = "Q, E, R, T, Y, U, P, F, G, H, J, K, L"
})
genTab:CreateDivider()
addButton(genTab, "+︱Neptunian V", function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"))()
end)
genTab:CreateParagraph({
 Title = "Keybinds",
 Content = "F, Z, X, R"
})
genTab:CreateDivider()
addButton(genTab, "+︱Sin Dragon", function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon"))()
end)
genTab:CreateParagraph({
 Title = "Keybinds",
 Content = "G, Z, X, C"
})
genTab:CreateDivider()
addButton(genTab, "+︱Lightning Cannon", function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
end)
genTab:CreateParagraph({
 Title = "Keybinds",
 Content = "E, Z, X, C, V, B, M"
})
genTab:CreateDivider()
addButton(genTab, "+︱Goner", function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
end)
genTab:CreateParagraph({
 Title = "Keybinds",
 Content = "Q"
})
genTab:CreateDivider()
addButton(genTab, "+︱Ban Hammer", function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"))()
end)
genTab:CreateParagraph({
 Title = "Keybinds",
 Content = "E, R"
})

-- /// Rigs tab
 local HatsTab = Window:CreateTab("Genesis rigs")
HatsTab:CreateParagraph({
 Title = "IMPORTANT",
 Content = "Always load PermaDeath before reanimating."
})
addRigButton(HatsTab, "PermaDeath", "-pd")
addRigButton(HatsTab, "Remove Hats", "-ch")
addRigButton(HatsTab, "Respawn", "-re")
addRigButton(HatsTab, "Save hats", "-sh")
HatsTab:CreateDivider()
HatsTab:CreateParagraph({
 Title = "IMPORTANT!",
 Content = "It's important to always load the rigs so everyone can see you!"
})
addRigButton(HatsTab, "Genesis Rigs", "-gh 138364679836274 82942681251131 140395948277978 102599402682100 90960046381276 13058406993")
addRigButton(HatsTab, "Genesis Rigs [Black]", "-gh 131385506535381 85392395166623 129462518582032 138364679836274 12850150835 106249329428811")
HatsTab:CreateDivider()
addRigButton(HatsTab, "Neptunian V", "-gh 5316479641")
addRigButton(HatsTab, "Sin Dragon", "-gh 117186631495734 99965319383570 132770514241770 3756389957 14864581977 150381051 4504231783")
addRigButton(HatsTab, "Lightning Cannon", "-gh 111672581230926 126145101810389 136055191177936 4504231783")
addRigButton(HatsTab, "Goner", "-gh 17770317484 17822722698 17822749561 17772174303 17835236579")
addRigButton(HatsTab, "Ban Hammer", "-gh 15548314241")
end