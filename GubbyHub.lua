--- // ==== Blacklist ==== \\ ---

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

--- // ==== DevTag ==== \\ ---
loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/DevTag.lua"))()

--- // ==== Set Up ==== \\ ---
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

--- // ==== Read Tab ==== \\ ---
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

--- // ==== Universal Tab ==== \\ ---
local uniTab = Window:CreateTab("Main")
uniTab:CreateButton({
 Name = "Nameless Admin",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
 end
})
uniTab:CreateButton({
 Name = "Infinite Yield",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
 end
})
uniTab:CreateButton({
 Name = "Rochips Panel",
 Callback = function()
  loadstring(game:HttpGet("https://glot.io/snippets/gzrux646yj/raw/main.ts"))()
  Rayfield:Notify({
   Title = "Rochips Panel",
   Content = "Loading... (Wait 2-30 seconds)",
   Duration = 5
  })
 end
})
uniTab:CreateButton({
 Name = "Hub by Theo",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/JustABaseplateHub.lua"))()
 end
})
uniTab:CreateButton({
 Name = "Cloud hub",
 Callback = function()
  return loadstring(game:HttpGet("https://pastefy.app/X6fuVyEZ/raw"))()
 end
})
uniTab:CreateButton({
 Name = "Pilots hub",
 Callback = function()
  return loadstring(game:HttpGet("https://pastefy.app/U1o71wOq/raw"))()
 end
})
uniTab:CreateButton({
 Name = "KaterHub V3",
 Callback = function()
  return loadstring(game:HttpGet("https://katerhub-inc.github.io/KaterHub/main.lua"))()
 end
})

--- // ==== My Tab ==== \\ ---
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
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})

myTab:CreateButton({
    Name = "Kill Gui",
    Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/KillGUI.lua"))()
    end
})

myTab:CreateButton({
    Name = "Dupe Gui",
    Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/DupeGUI.lua"))()
    end
})

myTab:CreateParagraph({
    Title = "Note",
    Content = "Kill GUI & Dupe GUI needs R6 & a Roblox Gear.\nExample gear: Bloxy cola."
})

myTab:CreateSection("Reanimation")

myTab:CreateButton({
    Name = "Giant Krystal Dance",
    Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/GiantKD.lua"))()
    end
})

myTab:CreateSection("Visual")

myTab:CreateButton({
    Name = "Qwerty Mode",
    Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/QwertyMode.lua"))()
    end
})

myTab:CreateButton({
    Name = "CRD (Config Render Distance)",
    Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/CRD.lua"))()
    end
})

--- // ==== Keyboards Tab ==== \\ ---
local keyTab = Window:CreateTab("Keyboards")
keyTab:CreateButton({
 Name = "My Keyboards",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/SelectKeyboard.lua"))()
 end
})
keyTab:CreateButton({
 Name = "Delta Keyboard",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"))()
 end
})
keyTab:CreateButton({
 Name = "Virtual Keyboard",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/VirtualKeyboard.lua"))()
 end
})
keyTab:CreateButton({
 Name = "Mob Keyboard",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
 end
})

if Place == 88308889239232 or Place == 17574618959 then

-- // ==== Other Tab ==== \\ ---
 local pdTab = Window:CreateTab("PermaDeath")
pdTab:CreateButton({
 Name = "Krystal Dance",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/KrystalDance.lua"))()
 end
})
pdTab:CreateParagraph({
 Title = "Credits",
 Content = "To mzha on scriptblox for working reanimation, to MrY7zz for fixed KDV3."
})

pdTab:CreateDivider()
 pdTab:CreateButton({
  Name = "+︱Nameless Animations V4",
  Callback = function()
   return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/NamelessAnimationsV4.lua"))()
  end
 })

--- // ==== Genesis Tab ==== \\ ---
 local genTab = Window:CreateTab("Genesis")
 genTab:CreateButton({
  Name = "+︱Krystal Dance",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()
  end
 })
genTab:CreateParagraph({
    Title = "Keybinds",
    Content = "Q, E, R, T, Y, U, P, F, G, H, J, K, L"
})
genTab:CreateDivider()
 genTab:CreateButton({
  Name = "+︱Neptunian V",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"))()
  end
 })
genTab:CreateParagraph({
    Title = "Keybinds",
    Content = "F, Z, X, R"
})
genTab:CreateDivider()
 genTab:CreateButton({
  Name = "+︱Sin Dragon",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon"))()
  end
 })
genTab:CreateParagraph({
    Title = "Keybinds",
    Content = "G, Z, X, C"
})
genTab:CreateDivider()
 genTab:CreateButton({
  Name = "+︱Lightning Cannon",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
  end
 })
genTab:CreateParagraph({
    Title = "Keybinds",
    Content = "E, Z, X, C, V, B, M"
})
genTab:CreateDivider()
 genTab:CreateButton({
  Name = "+︱Goner",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
  end
 })
genTab:CreateParagraph({
    Title = "Keybinds",
    Content = "Q"
})
genTab:CreateDivider()
 genTab:CreateButton({
  Name = "+︱Ban Hammer",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"))()
  end
 })
genTab:CreateParagraph({
    Title = "Keybinds",
    Content = "E, R"
})

--- // ==== Genesis rigs Tab ==== \\ ---
 local HatsTab = Window:CreateTab("Genesis rigs")
HatsTab:CreateParagraph({
    Title = "IMPORTANT",
    Content = "Always load PermaDeath before reanimating."
})
 HatsTab:CreateButton({
  Name = "PermaDeath",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
  end
 })
 HatsTab:CreateButton({
  Name = "Remove Hats",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
  end
 })
 HatsTab:CreateButton({
  Name = "Respawn",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-re")
  end
 })
 HatsTab:CreateButton({
  Name = "Save hats",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-sh")
  end
 })
 HatsTab:CreateDivider()
 HatsTab:CreateParagraph({
  Title = "IMPORTANT!",
  Content = "It's important to always load the rigs so everyone can see you!"
 })
 HatsTab:CreateButton({
  Name = "Genesis Rigs",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 138364679836274 82942681251131 140395948277978 102599402682100 90960046381276 13058406993 ")
  end
 })
 HatsTab:CreateButton({
  Name = "Genesis Rigs [Black]",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 131385506535381 85392395166623 129462518582032 138364679836274 12850150835 106249329428811 ")
  end
 })
 HatsTab:CreateDivider()
 HatsTab:CreateButton({
  Name = "Neptunian V",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 5316479641 ")
  end
 })
 HatsTab:CreateButton({
  Name = "Sin Dragon",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 117186631495734 99965319383570 132770514241770 3756389957 14864581977 150381051 4504231783 ")
  end
 })
 HatsTab:CreateButton({
  Name = "Lightning Cannon",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 111672581230926 126145101810389 136055191177936 4504231783 ")
  end
 })
 HatsTab:CreateButton({
  Name = "Goner",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 17770317484 17822722698 17822749561 17772174303 17835236579 ")
  end
 })
 HatsTab:CreateButton({
  Name = "Ban Hammer",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 15548314241 ")
  end
 })
end

--- // ==== DevTag ==== \\ ---
loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/DevTag.lua"))()

--- // ==== Set Up ==== \\ ---
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

--- // ==== Read Tab ==== \\ ---
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

--- // ==== Universal Tab ==== \\ ---
local uniTab = Window:CreateTab("Main")
uniTab:CreateButton({
 Name = "Nameless Admin",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
 end
})
uniTab:CreateButton({
 Name = "Infinite Yield",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
 end
})
uniTab:CreateButton({
 Name = "Rochips Panel",
 Callback = function()
  loadstring(game:HttpGet("https://glot.io/snippets/gzrux646yj/raw/main.ts"))()
  Rayfield:Notify({
   Title = "Rochips Panel",
   Content = "Loading... (Wait 2-30 seconds)",
   Duration = 5
  })
 end
})
uniTab:CreateButton({
 Name = "Hub by Theo",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/JustABaseplateHub.lua"))()
 end
})
uniTab:CreateButton({
 Name = "Cloud hub",
 Callback = function()
  return loadstring(game:HttpGet("https://pastefy.app/X6fuVyEZ/raw"))()
 end
})
uniTab:CreateButton({
 Name = "Pilots hub",
 Callback = function()
  return loadstring(game:HttpGet("https://pastefy.app/U1o71wOq/raw"))()
 end
})
uniTab:CreateButton({
 Name = "KaterHub V3",
 Callback = function()
  return loadstring(game:HttpGet("https://katerhub-inc.github.io/KaterHub/main.lua"))()
 end
})

--- // ==== My Tab ==== \\ ---
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
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})

myTab:CreateButton({
    Name = "Kill Gui",
    Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/KillGUI.lua"))()
    end
})

myTab:CreateButton({
    Name = "Dupe Gui",
    Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/DupeGUI.lua"))()
    end
})

myTab:CreateParagraph({
    Title = "Note",
    Content = "Kill GUI & Dupe GUI needs R6 & a Roblox Gear.\nExample gear: Bloxy cola."
})

myTab:CreateSection("Reanimation")

myTab:CreateButton({
    Name = "Giant Krystal Dance",
    Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/GiantKD.lua"))()
    end
})

myTab:CreateSection("Visual")

myTab:CreateButton({
    Name = "Qwerty Mode",
    Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/QwertyMode.lua"))()
    end
})

myTab:CreateButton({
    Name = "CRD (Config Render Distance)",
    Callback = function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/CRD.lua"))()
    end
})

--- // ==== Keyboards Tab ==== \\ ---
local keyTab = Window:CreateTab("Keyboards")
keyTab:CreateButton({
 Name = "My Keyboards",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/SelectKeyboard.lua"))()
 end
})
keyTab:CreateButton({
 Name = "Delta Keyboard",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"))()
 end
})
keyTab:CreateButton({
 Name = "Virtual Keyboard",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/VirtualKeyboard.lua"))()
 end
})
keyTab:CreateButton({
 Name = "Mob Keyboard",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
 end
})

if Place == 88308889239232 or Place == 17574618959 then

-- // ==== Other Tab ==== \\ ---
 local pdTab = Window:CreateTab("PermaDeath")
pdTab:CreateButton({
 Name = "Krystal Dance",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/KrystalDance.lua"))()
 end
})
pdTab:CreateParagraph({
 Title = "Credits",
 Content = "To mzha on scriptblox for working reanimation, to MrY7zz for fixed KDV3."
})

pdTab:CreateDivider()
 pdTab:CreateButton({
  Name = "+︱Nameless Animations V4",
  Callback = function()
   return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/NamelessAnimationsV4.lua"))()
  end
 })

--- // ==== Genesis Tab ==== \\ ---
 local genTab = Window:CreateTab("Genesis")
 genTab:CreateButton({
  Name = "+︱Krystal Dance",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()
  end
 })
genTab:CreateParagraph({
    Title = "Keybinds",
    Content = "Q, E, R, T, Y, U, P, F, G, H, J, K, L"
})
genTab:CreateDivider()
 genTab:CreateButton({
  Name = "+︱Neptunian V",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"))()
  end
 })
genTab:CreateParagraph({
    Title = "Keybinds",
    Content = "F, Z, X, R"
})
genTab:CreateDivider()
 genTab:CreateButton({
  Name = "+︱Sin Dragon",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon"))()
  end
 })
genTab:CreateParagraph({
    Title = "Keybinds",
    Content = "G, Z, X, C"
})
genTab:CreateDivider()
 genTab:CreateButton({
  Name = "+︱Lightning Cannon",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
  end
 })
genTab:CreateParagraph({
    Title = "Keybinds",
    Content = "E, Z, X, C, V, B, M"
})
genTab:CreateDivider()
 genTab:CreateButton({
  Name = "+︱Goner",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
  end
 })
genTab:CreateParagraph({
    Title = "Keybinds",
    Content = "Q"
})
genTab:CreateDivider()
 genTab:CreateButton({
  Name = "+︱Ban Hammer",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"))()
  end
 })
genTab:CreateParagraph({
    Title = "Keybinds",
    Content = "E, R"
})

--- // ==== Genesis rigs Tab ==== \\ ---
 local HatsTab = Window:CreateTab("Genesis rigs")
HatsTab:CreateParagraph({
    Title = "IMPORTANT",
    Content = "Always load PermaDeath before reanimating."
})
 HatsTab:CreateButton({
  Name = "PermaDeath",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-pd")
  end
 })
 HatsTab:CreateButton({
  Name = "Remove Hats",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-ch")
  end
 })
 HatsTab:CreateButton({
  Name = "Respawn",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-re")
  end
 })
 HatsTab:CreateButton({
  Name = "Save hats",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-sh")
  end
 })
 HatsTab:CreateDivider()
 HatsTab:CreateParagraph({
  Title = "IMPORTANT!",
  Content = "It's important to always load the rigs so everyone can see you!"
 })
 HatsTab:CreateButton({
  Name = "Genesis Rigs",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 138364679836274 82942681251131 140395948277978 102599402682100 90960046381276 13058406993 ")
  end
 })
 HatsTab:CreateButton({
  Name = "Genesis Rigs [Black]",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 131385506535381 85392395166623 129462518582032 138364679836274 12850150835 106249329428811 ")
  end
 })
 HatsTab:CreateDivider()
 HatsTab:CreateButton({
  Name = "Neptunian V",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 5316479641 ")
  end
 })
 HatsTab:CreateButton({
  Name = "Sin Dragon",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 117186631495734 99965319383570 132770514241770 3756389957 14864581977 150381051 4504231783 ")
  end
 })
 HatsTab:CreateButton({
  Name = "Lightning Cannon",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 111672581230926 126145101810389 136055191177936 4504231783 ")
  end
 })
 HatsTab:CreateButton({
  Name = "Goner",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 17770317484 17822722698 17822749561 17772174303 17835236579 ")
  end
 })
 HatsTab:CreateButton({
  Name = "Ban Hammer",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 15548314241 ")
  end
 })
end