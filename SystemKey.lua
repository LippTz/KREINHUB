if _G.KREIN_KEY_VERIFIED then return end
local config = loadstring(game:HttpGet("https://raw.githubusercontent.com/LippTz/KREINHUB/main/Key.lua"))()
local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui", game.CoreGui)

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 360, 0, 200)
frame.Position = UDim2.new(0.5, -180, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame)

local title = Instance.new("TextLabel", frame)
title.Text = "KreinHub Access Key"
title.Size = UDim2.new(1, 0, 0, 30)
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Code
title.TextSize = 20

local notif = Instance.new("TextLabel", frame)
notif.Size = UDim2.new(1, -20, 0, 20)
notif.Position = UDim2.new(0, 10, 0, 40)
notif.BackgroundTransparency = 1
notif.Text = "Enter your key to access KreinHub"
notif.TextColor3 = Color3.new(1, 1, 1)
notif.Font = Enum.Font.Code
notif.TextSize = 14

local input = Instance.new("TextBox", frame)
input.PlaceholderText = "Enter Key Here"
input.Size = UDim2.new(1, -40, 0, 30)
input.Position = UDim2.new(0, 20, 0, 70)
input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
input.TextColor3 = Color3.new(1, 1, 1)
input.Font = Enum.Font.Code
input.TextSize = 16
Instance.new("UICorner", input)

local function button(txt, pos, callback)
    local btn = Instance.new("TextButton", frame)
    btn.Text = txt
    btn.Size = UDim2.new(0.3, 0, 0, 30)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    btn.TextColor3 = Color3.fromRGB(0, 255, 0)
    btn.Font = Enum.Font.Code
    btn.TextSize = 14
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
end

button("🌐 GitHub", UDim2.new(0.05, 0, 0, 120), function()
    setclipboard(config.GitHubURL)
    notif.Text = "✅ GitHub link copied!"
end)

button("🔑 Get Key", UDim2.new(0.35, 0, 0, 120), function()
    setclipboard(config.KeyURL)
    notif.Text = "✅ Key page copied!"
end)

button("✅ Verify", UDim2.new(0.65, 0, 0, 120), function()
    if input.Text == config.CorrectKey then
        notif.Text = "✅ Access Granted!"
        --✅ Setelah berhasil verifikasi key:
_G.KREIN_KEY_VERIFIED = true

-- Load dan jalankan Base.lua
local Krein = loadstring(game:HttpGet("https://raw.githubusercontent.com/LippTz/KREINHUB/main/Base.lua"))()
Krein.Show() -- WAJIB! biar GUI-nya tampil

-- Simpan modul ke global biar bisa dipakai Loader
_G.KREIN_API = Krein
    else
        notif.Text = "❌ Key is invalid!"
    end
end)
