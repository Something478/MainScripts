loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/DevTag.lua"))()

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
 Name = "Gubby hub [Official]",
 LoadingTitle = "Gubby hub [Official]",
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
local toolConnection = nil
local charConnection = nil

function setupToolListener(char)
 if toolConnection then
  toolConnection:Disconnect()
 end
 toolConnection = char.ChildAdded:Connect(function(child)
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

charConnection = player.CharacterAdded:Connect(onCharacterAdded)

local readTab = Window:CreateTab("READ")
if game.PlaceId ~= 17574618959 then
 readTab:CreateParagraph({
  Title = "Game Not Supported",
  Content = "Game is not supported, some features from this hub are removed."
 })
 readTab:CreateDivider()
end
readTab:CreateParagraph({
 Title = "!! PLEASE READ THIS !!",
 Content = "I DO NOT OWN THE SCRIPTS IN THIS SCRIPT!!! ALL CREDIT GOES TO RESPECTIVE OWNERS OF THE SCRIPTS!!"
})
if game.PlaceId == 17574618959 then
 readTab:CreateParagraph({
  Title = "How to use this hub? 🤔",
  Content = " If you're gonna use genesis, go to the hats and rigs tab, once your done loading the hats and rigs, head to the Genesis tab and execute the scripts there!!"
 })
end
readTab:CreateParagraph({
 Title = "!! Notice !!",
 Content = "Credits to Theo for the idea of adding genesis, he's a cool guy make sure to check out his hub too. :)"
})
readTab:CreateParagraph({
 Title = "Shortcut",
 Content = "+︱Needs a keyboard & will have keybinds\n-︱Doesn't need a keyboard & will not have keybinds"
})
readTab:CreateDivider()
readTab:CreateSection("Other")
readTab:CreateParagraph({
 Title = "Owner of the hub:",
 Content = "ChillbyteHD"
})
readTab:CreateParagraph({
 Title = "My Discord:",
 Content = "LazyGuyLOL"
})

local homeTab = Window:CreateTab("Home")
homeTab:CreateSection("By Theo")
homeTab:CreateButton({
 Name = "Hub by Theo",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/JustABaseplateHub.lua"))()
 end
})
homeTab:CreateParagraph({
 Title = "<3",
 Content = "Theo is the best! :D"
})
homeTab:CreateDivider()
homeTab:CreateSection("Main")
homeTab:CreateButton({
 Name = "Crypton",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/thesigmacorex/Crypton/main/Free"))()
 end
})
homeTab:CreateButton({
 Name = "KaterHub V3",
 Callback = function()
  return loadstring(game:HttpGet("https://katerhub-inc.github.io/KaterHub/main.lua"))()
 end
})
homeTab:CreateButton({
 Name = "Cloud hub",
 Callback = function()
  return loadstring(game:HttpGet("https://pastefy.app/X6fuVyEZ/raw"))()
 end
})
homeTab:CreateButton({
 Name = "Pilots hub",
 Callback = function()
  return loadstring(game:HttpGet("https://pastefy.app/U1o71wOq/raw"))()
 end
})
homeTab:CreateSection("Other")
homeTab:CreateButton({
 Name = "Rochips Panel",
 Callback = function()
  loadstring(game:HttpGet("https://glot.io/snippets/gzrux646yj/raw/main.ts"))()
  Rayfield:Notify({
   Title = "Rochips Panel",
   Content = "Loading... (Wait 2-30 seconds, depends on executor & device)",
   Duration = 5
  })
 end
})
homeTab:CreateButton({
 Name = "Nameless Admin",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
 end
})
homeTab:CreateButton({
 Name = "Infinite Yield",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
 end
})

local stuffTab = Window:CreateTab("Made by me")
stuffTab:CreateSection("Item related")
stuffTab:CreateToggle({
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
stuffTab:CreateButton({
 Name = "Kill Gui",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/KillGUI.lua"))()
 end
})
stuffTab:CreateButton({
 Name = "Dupe Gui",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/DupeGUI.lua"))()
 end
})
stuffTab:CreateParagraph({
 Title = "Note:",
 Content = "Kill Gui & Dupe Gui don't work in every game."
})
stuffTab:CreateDivider()
stuffTab:CreateSection("Other")
stuffTab:CreateButton({
 Name = "CRD (Config Render Distance)",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/CRD.lua"))()
 end
})

local keyTab = Window:CreateTab("Keyboards")
keyTab:CreateButton({
 Name = "Byte Keyboard",
 Callback = function()
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/ByteKeyboard.lua"))()
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

if game.PlaceId == 17574618959 then
 local genTab = Window:CreateTab("Genesis")
 genTab:CreateButton({
  Name = "+︱Krystal Dance",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()
  end
 })
 genTab:CreateButton({
  Name = "+︱Neptunian V",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"))()
  end
 })
 genTab:CreateButton({
  Name = "+︱Sin Dragon",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon"))()
  end
 })
 genTab:CreateButton({
  Name = "+︱Goner",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
  end
 })
 genTab:CreateButton({
  Name = "+︱Ban Hammer",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"))()
  end
 })
 genTab:CreateButton({
  Name = "+︱Lightning Cannon",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
  end
 })

 local HatsTab = Window:CreateTab("Hats and Rigs")
 HatsTab:CreateButton({
  Name = "PermaDeath for Genesis",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -pd")
  end
 })
 HatsTab:CreateButton({
  Name = "Remove Hats",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -ch")
  end
 })
 HatsTab:CreateButton({
  Name = "Respawn",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -re")
  end
 })
 HatsTab:CreateButton({
  Name = "Save hats",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -sh")
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
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 131385506535381 85392395166623 129462518582032 138364679836274 12850150835 106249329428811")
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
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 117186631495734 99965319383570 132770514241770 3756389957 14864581977 150381051 4504231783")
  end
 })
 HatsTab:CreateButton({
  Name = "Lightning Cannon",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 111672581230926 126145101810389 136055191177936 4504231783")
  end
 })
 HatsTab:CreateButton({
  Name = "Goner",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 17770317484 17822722698 17822749561 17772174303 17835236579")
  end
 })
 HatsTab:CreateButton({
  Name = "Ban Hammer",
  Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 15548314241")
  end
 })

 local pdTab = Window:CreateTab("Other")
 pdTab:CreateSection("PermaDeath")
 pdTab:CreateButton({
  Name = "+︱Nameless Animations V4",
  Callback = function()
   return loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MyScripts/refs/heads/main/NamelessAnimationsV4.lua"))()
  end
 })
end