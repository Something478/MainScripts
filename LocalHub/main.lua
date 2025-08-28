local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local Player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local PlayerGui = Player:WaitForChild("PlayerGui")

local BypassUsers = {
    "Theo_TheoBenzo",
    "yourgames9"
}

local function notif(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 5
    })
end

local function loadHub()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/refs/heads/main/Blacklist.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/ScriptLoader/main/DevTag.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MainScripts/refs/heads/main/LocalHub/hub.lua"))()
end

for _, name in ipairs(BypassUsers) do
    if Player.Name == name then
        loadHub()
        return
    end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 350, 0, 300)
Frame.Position = UDim2.new(0.5, 0, -0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "Key System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0, 35)
TextBox.Position = UDim2.new(0.1, 0, 0.2, 0)
TextBox.PlaceholderText = "Enter Key..."
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 16
TextBox.Text = ""
TextBox.ClipsDescendants = true
TextBox.Parent = Frame

local UICornerBox = Instance.new("UICorner")
UICornerBox.CornerRadius = UDim.new(0, 10)
UICornerBox.Parent = TextBox

local EnterButton = Instance.new("TextButton")
EnterButton.Size = UDim2.new(0.5, 0, 0, 35)
EnterButton.Position = UDim2.new(0.25, 0, 0.35, 0)
EnterButton.Text = "Enter"
EnterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EnterButton.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
EnterButton.Font = Enum.Font.GothamBold
EnterButton.TextSize = 18
EnterButton.Parent = Frame

local UICornerButton = Instance.new("UICorner")
UICornerButton.CornerRadius = UDim.new(0, 10)
UICornerButton.Parent = EnterButton

local ValidKey = "LOCAL-HUB-ACCESS-KEY--2025--9DJ2OEJIW-SK919KFI2KSHK119KDIQLSK91LZLCMMZNID9SJK01SKK0QOZKCLTP302IW-LGLYP40WISHCJ-T9493INNO229AKLFPT93UWJFKT0493NK-GPT93U2SKFP492UEJOT0E8WIWXKKGP3JQGZXYUF932BSGYF8RPTPLGJDHWUE7RITKXNSHWITOTKDHUWIR"

local function checkKey()
    local entered = (TextBox.Text or ""):gsub("^%s*(.-)%s*$", "%1")
    if entered:lower() == ValidKey:lower() then
        Frame:Destroy()
        notif("Local Hub", "Valid key found, now loading Local Hub...")
        loadHub()
    else
        notif("Local Hub", "Invalid Key!")
    end
end

EnterButton.MouseButton1Click:Connect(checkKey)

local DiscordButton = Instance.new("TextButton")
DiscordButton.Size = UDim2.new(0.8, 0, 0, 35)
DiscordButton.Position = UDim2.new(0.1, 0, 0.55, 0)
DiscordButton.Text = "Copy Discord Link"
DiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordButton.BackgroundColor3 = Color3.fromRGB(114, 137, 218)
DiscordButton.Font = Enum.Font.GothamBold
DiscordButton.TextSize = 16
DiscordButton.Parent = Frame

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0, 10)
DiscordCorner.Parent = DiscordButton

DiscordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/XXtB3Vth53")
    notif("Discord", "Link copied to clipboard!")
end)

local KeyGuideButton = Instance.new("TextButton")
KeyGuideButton.Size = UDim2.new(0.8, 0, 0, 35)
KeyGuideButton.Position = UDim2.new(0.1, 0, 0.7, 0)
KeyGuideButton.Text = "How to Get Key"
KeyGuideButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyGuideButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
KeyGuideButton.Font = Enum.Font.GothamBold
KeyGuideButton.TextSize = 16
KeyGuideButton.Parent = Frame

local KeyGuideCorner = Instance.new("UICorner")
KeyGuideCorner.CornerRadius = UDim.new(0, 10)
KeyGuideCorner.Parent = KeyGuideButton

KeyGuideButton.MouseButton1Click:Connect(function()
    notif("Key Instructions", "Join Discord server, go to 🔑︱Keys channel, copy and paste the key.")
end)

local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local tweenGoal = {Position = UDim2.new(0.5, 0, 0.5, 0)}
local tween = TweenService:Create(Frame, tweenInfo, tweenGoal)
tween:Play()