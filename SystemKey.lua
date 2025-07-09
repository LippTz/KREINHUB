-- ✅ FILE 1: SystemKey.lua (UPLOAD ke GitHub)
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "KeySystemUI"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

local Box = Instance.new("TextBox", Frame)
Box.PlaceholderText = "Enter Key Here..."
Box.Size = UDim2.new(0.9, 0, 0, 30)
Box.Position = UDim2.new(0.05, 0, 0.3, 0)
Box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Box.Font = Enum.Font.Code
Box.TextSize = 16
Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 6)

local Button = Instance.new("TextButton", Frame)
Button.Text = "Verify"
Button.Size = UDim2.new(0.9, 0, 0, 30)
Button.Position = UDim2.new(0.05, 0, 0.65, 0)
Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Button.TextColor3 = Color3.fromRGB(0, 255, 0)
Button.Font = Enum.Font.Code
Button.TextSize = 16
Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 6)

local ValidKey = "krein123"

Button.MouseButton1Click:Connect(function()
    if Box.Text == ValidKey then
        _G.KREIN_KEY_VERIFIED = true
        ScreenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LippTz/KREINHUB/main/Base.lua"))()
    else
        Box.Text = "INVALID KEY!"
    end
end)
