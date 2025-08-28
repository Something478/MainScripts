-- /// Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

-- /// Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
    Name = "Local Hub",
    LoadingTitle = "Local Hub",
    LoadingSubtitle = "By ChillbyteHD",
    Theme = {
        TextColor = Color3.fromRGB(255, 255, 255),
        Background = Color3.fromRGB(0, 0, 0),
        Topbar = Color3.fromRGB(0, 0, 0),
        Shadow = Color3.fromRGB(0, 0, 0),
        NotificationBackground = Color3.fromRGB(0, 0, 0),
        NotificationActionsBackground = Color3.fromRGB(0, 0, 125),
        TabBackground = Color3.fromRGB(0, 0, 0),
        TabStroke = Color3.fromRGB(0, 0, 255),
        TabBackgroundSelected = Color3.fromRGB(0, 0, 133),
        TabTextColor = Color3.fromRGB(255, 255, 255),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        ElementBackground = Color3.fromRGB(15, 15, 15),
        ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
        SecondaryElementBackground = Color3.fromRGB(0, 0, 0),
        ElementStroke = Color3.fromRGB(0, 0, 150),
        SecondaryElementStroke = Color3.fromRGB(0, 0, 255),
        SliderBackground = Color3.fromRGB(0, 0, 0),
        SliderProgress = Color3.fromRGB(0, 0, 255),
        SliderStroke = Color3.fromRGB(0, 0, 255),
        ToggleBackground = Color3.fromRGB(0, 0, 130),
        ToggleEnabled = Color3.fromRGB(0, 0, 255),
        ToggleDisabled = Color3.fromRGB(0, 0, 120),
        ToggleEnabledStroke = Color3.fromRGB(0, 0, 140),
        ToggleDisabledStroke = Color3.fromRGB(0, 0, 120),
        ToggleEnabledOuterStroke = Color3.fromRGB(0, 0, 120),
        ToggleDisabledOuterStroke = Color3.fromRGB(0, 0, 90),
        DropdownSelected = Color3.fromRGB(0, 0, 255),
        DropdownUnselected = Color3.fromRGB(0, 0, 0),
        InputBackground = Color3.fromRGB(0, 0, 0),
        InputStroke = Color3.fromRGB(0, 0, 255),
        PlaceholderColor = Color3.fromRGB(0, 0, 255)
    },
    ToggleUIKeybind = Enum.KeyCode.B,
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "LocalHub",
        FileName = "Settings"
    },
    Discord = {Enabled = false},
    KeySystem = false
})

local player = Players.LocalPlayer
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

-- /// Read Tab
local ReadTab = Window:CreateTab("READ")

if Place ~= 88308889239232 and Place ~= 17574618959 then
    ReadTab:CreateParagraph({
        Title = "❗︱Game Not Supported",
        Content = "Some features from this hub are removed."
    })
    ReadTab:CreateDivider()
end

ReadTab:CreateParagraph({
    Title = "‼️ PLEASE READ THIS ‼️",
    Content = "I DO NOT OWN THE SCRIPTS IN THIS SCRIPT!!! ALL CREDIT GOES TO RESPECTIVE OWNERS OF THE SCRIPTS!!"
})

if Place == 88308889239232 or Place == 17574618959 then
 
ReadTab:CreateParagraph({
    Title = "How to use this hub? 🤔",
    Content = "If you're gonna use genesis, go to the Genesis rigs tab, once your done loading the hats and rigs, head to the Genesis tab and execute the scripts there!!1!"
    })

ReadTab:CreateSection("Other")

ReadTab:CreateParagraph({
    Title = "‼️ Notice ‼️",
    Content = "Credits to Theo for the idea of adding genesis, he's a cool guy make sure to check out his hub too! :)"
    })
end

ReadTab:CreateParagraph({
    Title = "🌌︱Default Theme",
    Content = "Theme = Outer Space [Blue]\nTheme made by Theo."
})

ReadTab:CreateSection("Info")
ReadTab:CreateParagraph({
    Title = "ℹ️︱Roblox Username",
    Content = "IdkMyNameBro_012"
})
ReadTab:CreateParagraph({
    Title = "ℹ️︱Discord Username",
    Content = "ChillbyteHD"
})

-- /// Home Tab
local HomeTab = Window:CreateTab("Home")

if Place == 17574618959 or Place == 88308889239232 then
    HomeTab:CreateButton({
        Name = "Sit",
        Callback = function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -sit")
        end
    })
    HomeTab:CreateButton({
        Name = "Spawn Dummy",
        Callback = function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -dummy")
        end
    })
    HomeTab:CreateButton({
        Name = "Respawn",
        Callback = function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -re")
        end
    })
    HomeTab:CreateButton({
        Name = "Remove Hats",
        Callback = function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -ch")
        end
    })
    HomeTab:CreateButton({
        Name = "Save hats",
        Callback = function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -sh")
        end
    })
    HomeTab:CreateButton({
        Name = "PermaDeath",
        Callback = function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -pd")
        end
    })
end
local Toggle = HomeTab:CreateToggle({
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

local Slider = HomeTab:CreateSlider({
    Name = "WalkSpeed Slider",
    Range = {16, 350},
    Increment = 1,
    Suffix = "Walkspeed",
    CurrentValue = 16,
    Flag = "sliderws",
    Callback = function(Value)
        player.Character.Humanoid.WalkSpeed = Value
    end,
})

local Slider2 = HomeTab:CreateSlider({
    Name = "JumpPower Slider",
    Range = {50, 400},
    Increment = 1,
    Suffix = "Jump Power",
    CurrentValue = 50,
    Flag = "sliderjp",
    Callback = function(Value)
        player.Character.Humanoid.JumpPower = Value
    end,
})

local Input = HomeTab:CreateInput({
    Name = "Walkspeed",
    PlaceholderText = "1-500",
    RemoveTextAfterFocusLost = true,
    Callback = function(Text)
        player.Character.Humanoid.WalkSpeed = tonumber(Text) or 16
    end,
})

-- /// Themes Section

local ThemesSection = HomeTab:CreateSection("Themes Section")

HomeTab:CreateButton({
    Name = "Ocean",
    Callback = function()
        Window.ModifyTheme('Ocean')
    end,
})
HomeTab:CreateButton({
    Name = "Bloom",
    Callback = function()
        Window.ModifyTheme('Bloom')
    end,
})
HomeTab:CreateButton({
    Name = "Dark Blue",
    Callback = function()
        Window.ModifyTheme('DarkBlue')
    end,
})
HomeTab:CreateButton({
    Name = "Amethyst",
    Callback = function()
        Window.ModifyTheme('Amethyst')
    end,
})
HomeTab:CreateButton({
    Name = "Serenity",
    Callback = function()
        Window.ModifyTheme('Serenity')
    end,
})

-- /// Custom Themes Section

local CustomThemesSection = HomeTab:CreateSection("Custom Themes Section")

HomeTab:CreateButton({
    Name = "Outer Space",
    Callback = function()
        Window.ModifyTheme {
            TextColor = Color3.fromRGB(255, 255, 255),
            Background = Color3.fromRGB(0, 0, 0),
            Topbar = Color3.fromRGB(0, 0, 0),
            Shadow = Color3.fromRGB(0, 0, 0),
            NotificationBackground = Color3.fromRGB(0, 0, 0),
            NotificationActionsBackground = Color3.fromRGB(100, 0, 255),
            TabBackground = Color3.fromRGB(0, 0, 0),
            TabStroke = Color3.fromRGB(100, 0, 255),
            TabBackgroundSelected = Color3.fromRGB(50, 0, 133),
            TabTextColor = Color3.fromRGB(255, 255, 255),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            ElementBackground = Color3.fromRGB(15, 15, 15),
            ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
            SecondaryElementBackground = Color3.fromRGB(0, 0, 0),
            ElementStroke = Color3.fromRGB(150, 150, 150),
            SecondaryElementStroke = Color3.fromRGB(255, 255, 255),
            SliderBackground = Color3.fromRGB(75, 0, 200),
            SliderProgress = Color3.fromRGB(50, 0, 255),
            SliderStroke = Color3.fromRGB(75, 0, 255),
            ToggleBackground = Color3.fromRGB(100, 0, 255),
            ToggleEnabled = Color3.fromRGB(255, 255, 255),
            ToggleDisabled = Color3.fromRGB(255, 255, 255),
            ToggleEnabledStroke = Color3.fromRGB(0, 0, 0),
            ToggleDisabledStroke = Color3.fromRGB(0, 0, 0),
            ToggleEnabledOuterStroke = Color3.fromRGB(0, 0, 0),
            ToggleDisabledOuterStroke = Color3.fromRGB(0, 0, 0),
            DropdownSelected = Color3.fromRGB(100, 0, 255),
            DropdownUnselected = Color3.fromRGB(0, 0, 0),
            InputBackground = Color3.fromRGB(0, 0, 0),
            InputStroke = Color3.fromRGB(100, 0, 255),
            PlaceholderColor = Color3.fromRGB(100, 0, 255)
        }
    end,
})
HomeTab:CreateButton({
    Name = "Outer Space [Blue]",
    Callback = function()
        Window.ModifyTheme {
            TextColor = Color3.fromRGB(255, 255, 255),
            Background = Color3.fromRGB(0, 0, 0),
            Topbar = Color3.fromRGB(0, 0, 0),
            Shadow = Color3.fromRGB(0, 0, 0),
            NotificationBackground = Color3.fromRGB(0, 0, 0),
            NotificationActionsBackground = Color3.fromRGB(0, 0, 125),
            TabBackground = Color3.fromRGB(0, 0, 0),
            TabStroke = Color3.fromRGB(0, 0, 255),
            TabBackgroundSelected = Color3.fromRGB(0, 0, 133),
            TabTextColor = Color3.fromRGB(255, 255, 255),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            ElementBackground = Color3.fromRGB(15, 15, 15),
            ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
            SecondaryElementBackground = Color3.fromRGB(0, 0, 0),
            ElementStroke = Color3.fromRGB(0, 0, 150),
            SecondaryElementStroke = Color3.fromRGB(0, 0, 255),
            SliderBackground = Color3.fromRGB(0, 0, 0),
            SliderProgress = Color3.fromRGB(0, 0, 255),
            SliderStroke = Color3.fromRGB(0, 0, 255),
            ToggleBackground = Color3.fromRGB(0, 0, 130),
            ToggleEnabled = Color3.fromRGB(0, 0, 255),
            ToggleDisabled = Color3.fromRGB(0, 0, 120),
            ToggleEnabledStroke = Color3.fromRGB(0, 0, 140),
            ToggleDisabledStroke = Color3.fromRGB(0, 0, 120),
            ToggleEnabledOuterStroke = Color3.fromRGB(0, 0, 120),
            ToggleDisabledOuterStroke = Color3.fromRGB(0, 0, 90),
            DropdownSelected = Color3.fromRGB(0, 0, 255),
            DropdownUnselected = Color3.fromRGB(0, 0, 0),
            InputBackground = Color3.fromRGB(0, 0, 0),
            InputStroke = Color3.fromRGB(0, 0, 255),
            PlaceholderColor = Color3.fromRGB(0, 0, 255)
        }
    end,
})
HomeTab:CreateButton({
    Name = "Outer Space [Red]",
    Callback = function()
        Window.ModifyTheme {
            TextColor = Color3.fromRGB(255, 255, 255),
            Background = Color3.fromRGB(0, 0, 0),
            Topbar = Color3.fromRGB(0, 0, 0),
            Shadow = Color3.fromRGB(0, 0, 0),
            NotificationBackground = Color3.fromRGB(0, 0, 0),
            NotificationActionsBackground = Color3.fromRGB(100, 0, 255),
            TabBackground = Color3.fromRGB(0, 0, 0),
            TabStroke = Color3.fromRGB(255, 0, 0),
            TabBackgroundSelected = Color3.fromRGB(136, 0, 0),
            TabTextColor = Color3.fromRGB(255, 255, 255),
            SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
            ElementBackground = Color3.fromRGB(15, 15, 15),
            ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
            SecondaryElementBackground = Color3.fromRGB(0, 0, 0),
            ElementStroke = Color3.fromRGB(150, 0, 0),
            SecondaryElementStroke = Color3.fromRGB(255, 0, 0),
            SliderBackground = Color3.fromRGB(0, 0, 0),
            SliderProgress = Color3.fromRGB(255, 0, 0),
            SliderStroke = Color3.fromRGB(255, 0, 0),
            ToggleBackground = Color3.fromRGB(130, 0, 0),
            ToggleEnabled = Color3.fromRGB(130, 0, 0),
            ToggleDisabled = Color3.fromRGB(120, 0, 0),
            ToggleEnabledStroke = Color3.fromRGB(140, 0, 0),
            ToggleDisabledStroke = Color3.fromRGB(70, 0, 0),
            ToggleEnabledOuterStroke = Color3.fromRGB(70, 0, 0),
            ToggleDisabledOuterStroke = Color3.fromRGB(40, 0, 0),
            DropdownSelected = Color3.fromRGB(255, 0, 0),
            DropdownUnselected = Color3.fromRGB(0, 0, 0),
            InputBackground = Color3.fromRGB(0, 0, 0),
            InputStroke = Color3.fromRGB(255, 0, 0),
            PlaceholderColor = Color3.fromRGB(255, 0, 0)
        }
    end,
})

-- /// Main Tab

local MainTab = Window:CreateTab("Main")
MainTab:CreateButton({
    Name = "Nameless Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
    end,
})
MainTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})
MainTab:CreateButton({
    Name = "Rochips Panel",
    Callback = function()
        loadstring(game:HttpGet("https://glot.io/snippets/gzrux646yj/raw/main.ts"))()
        Rayfield:Notify({
            Title = "Rochips Panel",
            Content = "Loading... (Wait 2-30 seconds)",
            Duration = 5
        })
    end,
})

MainTab:CreateButton({
    Name = "Hub by Theo",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/JustABaseplateHub.lua"))()
    end,
})

MainTab:CreateButton({
    Name = "Cloud hub",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/X6fuVyEZ/raw"))()
    end,
})

MainTab:CreateButton({
    Name = "Pilots hub",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/U1o71wOq/raw"))()
    end,
})

MainTab:CreateButton({
    Name = "KaterHub V3",
    Callback = function()
        loadstring(game:HttpGet("https://katerhub-inc.github.io/KaterHub/main.lua"))()
    end,
})

-- /// My Tab

local MyTab = Window:CreateTab("Made by me")

MyTab:CreateSection("GUIs")

MyTab:CreateButton({
    Name = "Kill GUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/KillGUI.lua"))()
    end
})

MyTab:CreateButton({
    Name = "Dupe GUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/DupeGUI.lua"))()
    end
})

MyTab:CreateParagraph({
    Title = "Note",
    Content = "Kill GUI & Dupe GUI needs R6 & a Roblox Gear (Item), without a gear it won't work.\nExample gear: Bloxy cola."
})
MyTab:CreateSection("Reanimation")

MyTab:CreateButton({
    Name = "Giant Krystal Dance",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/GiantKD.lua"))()
    end
})

MyTab:CreateSection("Visual")

MyTab:CreateButton({
    Name = "Realistic Mode (1st Person)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/RealisticMode.lua"))()
    end
})

MyTab:CreateButton({
    Name = "Inventory",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/Inventory.lua"))()
    end
})

-- /// Keyboards tab

local KeyTab = Window:CreateTab("Keyboards")

KeyTab:CreateButton({
    Name = "Byte Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/ByteKeyboard.lua"))()
    end
})

KeyTab:CreateButton({
    Name = "Kilobyte Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/KilobyteKeyboard.lua"))()
    end
})

KeyTab:CreateButton({
    Name = "Delta Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"))()
    end
})

KeyTab:CreateButton({
    Name = "Virtual Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/VirtualKeyboard.lua"))()
    end
})

KeyTab:CreateButton({
    Name = "Mob Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end
})

if Place == 88308889239232 or Place == 17574618959 then

-- /// PermaDeath tab

local PdTab = Window:CreateTab("PermaDeath")

PdTab:CreateButton({
    Name = "Krystal Dance",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/KrystalDance.lua"))()
        end
    })

PdTab:CreateParagraph({
    Title = "Credits",
    Content = "To MrY7zz for fixed KDV3, and to MZHA on scriptblox for working reanimation."
    })

-- /// Genesis tab

local GenTab = Window:CreateTab("Genesis")

GenTab:CreateButton({
    Name = "+︱Krystal Dance",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Krystal%20Dance"))()
        end
    })

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "Q, E, R, T, Y, U, P, F, G, H, J, K, L"
})

GenTab:CreateDivider()

GenTab:CreateButton({
    Name = "+︱Neptunian V",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Neptunian%20V"))()
        end
    })

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "F, Z, X, R"
})

GenTab:CreateDivider()

GenTab:CreateButton({
    Name = "+︱Sin Dragon",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sin%20Dragon"))()
        end
    })

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "G, Z, X, C"
})

GenTab:CreateDivider()

GenTab:CreateButton({
    Name = "+︱Lightning Cannon",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Lightning%20Cannon"))()
        end
    })

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "E, Z, X, C, V, B, M"
})

GenTab:CreateDivider()

GenTab:CreateButton({
    Name = "+︱Goner",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
        end
    })

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "Q"
})

GenTab:CreateDivider()

GenTab:CreateButton({
    Name = "Ban Hammer",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Ban%20Hammer"))()
        end
    })

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "E, R"
})

GenTab:CreateDivider()

GenTab:CreateButton({
    Name = "Motorcycle",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Motorcycle"))()
        end
    })

GenTab:CreateParagraph({
    Title = "Keybinds",
    Content = "Z"
})

-- /// Rigs tab

local HatsTab = Window:CreateTab("Genesis rigs")

HatsTab:CreateParagraph({
    Title = "IMPORTANT",
    Content = "Always load PermaDeath before reanimating."
})

HatsTab:CreateButton({
    Name = "PermaDeath",
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
            TextChat.TextChannels.RBXGeneral:SendAsync("-sh")
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
            TextChat.TextChannels.RBXGeneral:SendAsync("-gh 131385506535381 85392395166623 129462518582032 138364679836274 12850150835 106249329428811 ")
    end
})

HatsTab:CreateSection("Custom Rigs")

HatsTab:CreateButton({
    Name = "Genesis Rigs [Noob]",
    Callback = function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 95290698984301, 84451219120140, 72292903231768, 108186273151388, 139904067056008 ")
    end
})

HatsTab:CreateButton({ 
   Name = "Genesis Rigs [Guest]", 
   Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 13058406993 138364679836274 131385506535381 85392395166623 129462518582032 106249329428811 108224319902592 82404150383568 100856932339214")
    end
})

HatsTab:CreateButton({ 
   Name = "Genesis Rigs [1x1x1x1]", 
   Callback = function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 131385506535381 85392395166623 129462518582032 12850150835 106249329428811 17681457649 17532925923 16296624548")
    end
})

HatsTab:CreateDivider()

HatsTab:CreateButton({
   Name = "Neptunian V",
   Callback = function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 5316479641")
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

HatsTab:CreateButton({
  Name = "Motorcycle",
  Callback = function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 4504231783, 11354413365, 191101707, 18209672127 ")
    end
})
end