local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local function notif(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 5
        })
    end)
end

local function safeLoad(url)
    pcall(function()
        loadstring(game:HttpGet(url))()
    end)
end

local function loadHub()
    safeLoad("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/Blacklist.lua")
    safeLoad("https://raw.githubusercontent.com/Something478/ScriptLoader/main/DevTag.lua")
    safeLoad("https://raw.githubusercontent.com/Something478/MainScripts/refs/heads/main/LocalHub/hub.lua")
end

-- Key
local ValidKey = "LOCAL-HUB-ACCESS-KEY_9DJ2OEJIW-SK919KFI2KSHK119KDIQLSK91LZLCMMZNID9SJK01SKK0QOZKCLTP302IW-LGLYP40WISHCJ-T9493INNO229AKLFPT93UWJFKT0493NK-GPT93U2SKFP492UEJOT0E8WIWXKKGP3JQGZXYUF932BSGYF8RPTPLGJDHWUE7RITKXNSHWITOTKDHUWIR"

-- /// Skip KeySystems
local BypassUsers = {
    ["IdkMyNameBro_012"] = true, 
    ["Theo_TheoBenzo"] = true, 
    ["yourgames9"] = true  -- add more here
}

if BypassUsers[Player.Name] then
    notif("Local Hub", "Welcome...")
    loadHub()
    return
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 360, 0, 250)
Frame.Position = UDim2.new(0.5, 0, -0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "🔑 Local Hub Key System"
Title.TextColor3 = Color3.fromRGB(0, 140, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0, 35)
TextBox.Position = UDim2.new(0.1, 0, 0.25, 0)
TextBox.PlaceholderText = "Enter Key..."
TextBox.Text = ""
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 16
TextBox.ClearTextOnFocus = false
TextBox.Parent = Frame

local UICornerBox = Instance.new("UICorner")
UICornerBox.CornerRadius = UDim.new(0, 8)
UICornerBox.Parent = TextBox

local EnterButton = Instance.new("TextButton")
EnterButton.Size = UDim2.new(0.8, 0, 0, 35)
EnterButton.Position = UDim2.new(0.1, 0, 0.45, 0)
EnterButton.Text = "Check key"
EnterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EnterButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
EnterButton.Font = Enum.Font.GothamBold
EnterButton.TextSize = 18
EnterButton.Parent = Frame

local UICornerButton = Instance.new("UICorner")
UICornerButton.CornerRadius = UDim.new(0, 8)
UICornerButton.Parent = EnterButton

local DiscordButton = Instance.new("TextButton")
DiscordButton.Size = UDim2.new(0.8, 0, 0, 35)
DiscordButton.Position = UDim2.new(0.1, 0, 0.65, 0)
DiscordButton.Text = "📋 Copy Discord Link"
DiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordButton.BackgroundColor3 = Color3.fromRGB(40, 40, 255)
DiscordButton.Font = Enum.Font.GothamBold
DiscordButton.TextSize = 16
DiscordButton.Parent = Frame

local UICornerDiscord = Instance.new("UICorner")
UICornerDiscord.CornerRadius = UDim.new(0, 8)
UICornerDiscord.Parent = DiscordButton

local Instructions = Instance.new("TextLabel")
Instructions.Size = UDim2.new(0.9, 0, 0, 40)
Instructions.Position = UDim2.new(0.05, 0, 0.85, 0)
Instructions.BackgroundTransparency = 1
Instructions.Text = "Join our Discord to get your key!"
Instructions.TextColor3 = Color3.fromRGB(200, 200, 200)
Instructions.TextWrapped = true
Instructions.Font = Enum.Font.Gotham
Instructions.TextSize = 14
Instructions.Parent = Frame

EnterButton.MouseButton1Click:Connect(function()
    local entered = (TextBox.Text or ""):gsub("^%s*(.-)%s*$", "%1")
    if entered:lower() == ValidKey:lower() then
        Frame:Destroy()
        notif("Local Hub", "Valid key found, loading hub...")
        loadHub()
    else
        notif("Local Hub", "❌ Invalid Key")
    end
end)

DiscordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/XXtB3Vth53")
    notif("Local Hub", "Discord Link copied!")
end)

local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local tweenGoal = {Position = UDim2.new(0.5, 0, 0.5, 0)}
local tween = TweenService:Create(Frame, tweenInfo, tweenGoal)
tween:Play()