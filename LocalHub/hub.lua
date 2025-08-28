-- /// Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TextChat = game:GetService("TextChatService")

-- /// Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
    Name = "Local Hub",
    LoadingTitle = "Local Hub",
    LoadingSubtitle = "By ChillbyteHD",
    Theme = "Amethyst",
    ToggleUIKeybind = Enum.KeyCode.P,
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

-- /// Home Tab

local HomeTab = Window:CreateTab("Home")

if Place ~= 88308889239232 and Place ~= 17574618959 then
    HomeTab:CreateParagraph({
        Title = "Game Not Supported",
        Content = "Some features from this hub are removed."
    })
    HomeTab:CreateDivider()
end

HomeTab:CreateParagraph({
    Title = "!! PLEASE READ THIS !!",
    Content = "I DO NOT OWN THE SCRIPTS IN THIS SCRIPT!!! ALL CREDIT GOES TO RESPECTIVE OWNERS OF THE SCRIPTS!!"
})

if Place == 88308889239232 or Place == 17574618959 then
HomeTab:CreateParagraph({
    Title = "Shortcut",
    Content = "+︱Needs a keyboard & will have keybinds\n-︱Doesn't need a keyboard & will not have keybinds"
})
end

HomeTab:CreateSection("Info")
HomeTab:CreateParagraph({
    Title = "Roblox User",
    Content = "ChillbyteHD (IdkMyNameBro_012)"
})
HomeTab:CreateParagraph({
    Title = "Discord User",
    Content = "ChillbyteHD"
})
HomeTab:CreateDivider()

if Place == 17574618959 or Place == 88308889239232 then
    HomeTab:CreateButton({
        Name = "Sit",
        Callback = function()
            TextChat.TextChannels.RBXGeneral:SendAsync("/e -sit")
        end,
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
local Input = HomeTab:CreateInput({
    Name = "JumpPower",
    PlaceholderText = "1-500",
    RemoveTextAfterFocusLost = true,
    Callback = function(Text)
        player.Character.Humanoid.JumpPower = tonumber(Text) or 50
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

local myTab = Window:CreateTab("Made by me")
myTab:CreateSection("Item related")

myTab:CreateButton({
    Name = "Kill Gui",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/KillGUI.lua"))()
    end
})

myTab:CreateButton({
    Name = "Dupe Gui",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/DupeGUI.lua"))()
    end
})

myTab:CreateParagraph({
    Title = "Note",
    Content = "Kill GUI & Dupe GUI needs R6 & a Roblox Gear (Item), without a gear it won't work.\nExample gear: Bloxy cola."
})

myTab:CreateSection("Reanimation")

myTab:CreateButton({
    Name = "Giant Krystal Dance",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/GiantKD.lua"))()
    end
})

myTab:CreateSection("BetterRoblox")

myTab:CreateButton({
    Name = "Realistic Mode (1st Person)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/RealisticMode.lua"))()
    end
})

myTab:CreateButton({
    Name = "Inventory",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/Inventory.lua"))()
    end
})

-- /// Keyboards

local keyTab = Window:CreateTab("Keyboards")

keyTab:CreateButton({
    Name = "Byte Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/ByteKeyboard.lua"))()
    end
})

keyTab:CreateButton({
    Name = "Kilobyte Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/KilobyteKeyboard.lua"))()
    end
})

keyTab:CreateButton({
    Name = "Delta Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"))()
    end
})

keyTab:CreateButton({
    Name = "Virtual Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/VirtualKeyboard.lua"))()
    end
})

keyTab:CreateButton({
    Name = "Mob Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end
})

if Place == 88308889239232 or Place == 17574618959 then

-- /// PermaDeath

local pdTab = Window:CreateTab("PermaDeath")

pdTab:CreateButton({
    Name = "Krystal Dance",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/KrystalDance.lua"))()
        end
    })

pdTab:CreateParagraph({
    Title = "Credits",
    Content = "To MrY7zz for fixed KDV3, and to mzha on scriptblox for working reanimation."
    })

pdTab:CreateDivider()

pdTab:CreateButton({
    Name = "Caducus",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/Caducus.lua"))()
        end
    })

pdTab:CreateButton({
    Name = "Reanimate for Caducus",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/Reanimate.lua"))()
        end
    })

if Place == 88308889239232 or Place == 17574618959 then

-- /// Other Tab

local EtcTab = Window:CreateTab("Other")

EtcTab:CreateButton({
    Name = "PermaDeath",
    Callback = function()
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -pd")
        end
    })
EtcTab:CreateButton({
    Name = "Respawn",
    Callback = function()
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -rs")
        end
    })
EtcTab:CreateButton({
    Name = "Force Respawn",
    Callback = function()
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -re")
        end
    })
EtcTab:CreateButton({
    Name = "Save hats",
    Callback = function()
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -sh")
        end
    })
EtcTab:CreateButton({
    Name = "Clear hats",
    Callback = function()
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -ch")
        end
    })
EtcTab:CreateButton({
    Name = "Net (AntiFall for hats)",
    Callback = function()
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -net")
        end
    })
EtcTab:CreateButton({
    Name = "Spawn Dummy",
    Callback = function()
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -dummy")
        end
    })

EtcTab:CreateSection("Avatars")

EtcTab:CreateButton({
    Name = "1x1x1x1",
    Callback = function()
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e -gh 17681457649, 102625293938800 ")
        end
    })

local ChTab = Window:CreateTab("Changelog")

chTab:CreateParagraph({
    Title = "Changelog 2.1",
    Content = "- Removed Genesis"
})
end