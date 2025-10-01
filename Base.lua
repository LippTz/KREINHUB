local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- GUI Utama
local KreinGui = Instance.new("ScreenGui", game.CoreGui)
KreinGui.Name = "KreinHub_UI"
KreinGui.ResetOnSpawn = false

-- ðŸ”Š Sound Loading
local LoadingSound = Instance.new("Sound")
LoadingSound.SoundId = "rbxassetid://71501562798859" -- Ganti dengan ID sesuai selera kamu
LoadingSound.Volume = 1
LoadingSound.Looped = true
LoadingSound.Name = "LoadingSound"
LoadingSound.Parent = KreinGui
LoadingSound:Play()

-- Loading Container
local LoadingFrame = Instance.new("Frame", KreinGui)
LoadingFrame.Size = UDim2.new(0, 400, 0, 200)
LoadingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
LoadingFrame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner", LoadingFrame)
UICorner.CornerRadius = UDim.new(0, 12)

-- LOGO Typewriter Text
local LogoText = Instance.new("TextLabel", LoadingFrame)
LogoText.Size = UDim2.new(1, 0, 0.4, 0)
LogoText.Position = UDim2.new(0, 0, 0.1, 0)
LogoText.BackgroundTransparency = 1
LogoText.Font = Enum.Font.Code
LogoText.TextColor3 = Color3.fromRGB(0, 255, 140)
LogoText.TextScaled = true
LogoText.Text = ""

-- Loading Bar Background
local BarBack = Instance.new("Frame", LoadingFrame)
BarBack.Size = UDim2.new(0.8, 0, 0.15, 0)
BarBack.Position = UDim2.new(0.1, 0, 0.65, 0)
BarBack.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BarBack.BorderSizePixel = 0

local BarCorner = Instance.new("UICorner", BarBack)
BarCorner.CornerRadius = UDim.new(1, 0)

-- Loading Bar Fill
local BarFill = Instance.new("Frame", BarBack)
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(0, 255, 140)
BarFill.BorderSizePixel = 0

local FillCorner = Instance.new("UICorner", BarFill)
FillCorner.CornerRadius = UDim.new(1, 0)

-- RGB Loop (Optional)
task.spawn(function()
	while BarFill.Parent do
		local hue = tick() % 5 / 5
		local rgb = Color3.fromHSV(hue, 1, 1)
		BarFill.BackgroundColor3 = rgb
		LogoText.TextColor3 = rgb
		task.wait(0.1)
	end
end)

-- Typewriter Animation
local targetText = "KREINHUB"
for i = 1, #targetText do
	LogoText.Text = string.sub(targetText, 1, i)
	wait(0.08)
end

-- Loading Bar Animation
TweenService:Create(BarFill, TweenInfo.new(2, Enum.EasingStyle.Quad), {
	Size = UDim2.new(1, 0, 1, 0)
}):Play()
wait(2.2)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- GUI Setup
local KreinGui = Instance.new("ScreenGui", game.CoreGui)
KreinGui.Name = "KreinHub_UI"
KreinGui.ResetOnSpawn = false


-- Main Frame
local MainFrame = Instance.new("Frame", KreinGui)
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 450, 0, 300)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
MainFrame.Visible = false -- atau apa pun nama frame utama kamu

TweenService:Create(LoadingFrame, TweenInfo.new(1), {
	Size = UDim2.new(0, 0, 0, 0),
	Position = UDim2.new(0.5, 0, 0.5, 0),
	BackgroundTransparency = 1
}):Play()

for _, v in pairs(LoadingFrame:GetDescendants()) do
	if v:IsA("TextLabel") or v:IsA("Frame") then
		TweenService:Create(v, TweenInfo.new(1), {Transparency = 1}):Play()
	end
end

task.delay(1, function()
    LoadingSound:Stop()
    LoadingSound:Destroy()
	LoadingFrame:Destroy()
	MainFrame.Visible = true
end)

-- Title
local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "KreinHub"
Title.Size = UDim2.new(1, -80, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.Code
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Minimize & Close
local Minimize = Instance.new("TextButton", MainFrame)
Minimize.Text = "-"
Minimize.Size = UDim2.new(0, 30, 0, 30)
Minimize.Position = UDim2.new(1, -70, 0, 5)
Minimize.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Minimize.TextColor3 = Color3.fromRGB(0, 255, 0)
Minimize.Font = Enum.Font.Code
Minimize.TextSize = 22

local Close = Instance.new("TextButton", MainFrame)
Close.Text = "X"
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -35, 0, 5)
Close.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Close.TextColor3 = Color3.fromRGB(255, 0, 0)
Close.Font = Enum.Font.Code
Close.TextSize = 20

-- Content Frame
local Content = Instance.new("Frame", MainFrame)
Content.Name = "ContentFrame"
Content.Position = UDim2.new(0, 0, 0, 40)
Content.Size = UDim2.new(1, 0, 1, -45)
Content.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Content.BorderSizePixel = 0
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 8)

-- Tab Container (Scroll)
local TabContainer = Instance.new("ScrollingFrame", Content)
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(0, 120, 1, 0)
TabContainer.Position = UDim2.new(0, 0, 0, 0)
TabContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TabContainer.BorderSizePixel = 0
TabContainer.ScrollBarThickness = 6
TabContainer.ScrollingDirection = Enum.ScrollingDirection.Y
TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
Instance.new("UICorner", TabContainer).CornerRadius = UDim.new(0, 8)

local TabLayout = Instance.new("UIListLayout", TabContainer)
TabLayout.Padding = UDim.new(0, 6)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder

TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
TabContainer.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y + 10)
end)

-- Page Container
local PageContainer = Instance.new("Frame", Content)
PageContainer.Name = "PageContainer"
PageContainer.Position = UDim2.new(0, 130, 0, 0)
PageContainer.Size = UDim2.new(1, -130, 1, 0)
PageContainer.BackgroundTransparency = 1
PageContainer.ClipsDescendants = true

-- Minimize Logic
local minimized = false
local fullSize = UDim2.new(1, 0, 1, -45)
local fullFrameSize = UDim2.new(0, 450, 0, 300)
local minimizedFrameSize = UDim2.new(0, 190, 0, 40)

Minimize.MouseButton1Click:Connect(function()
minimized = not minimized

if minimized then  
	TweenService:Create(Content, TweenInfo.new(0.25), { Size = UDim2.new(1, 0, 0, 0) }):Play()  
	wait(0.2)  
	Content.Visible = false  
	TweenService:Create(MainFrame, TweenInfo.new(0.25), { Size = minimizedFrameSize }):Play()  
else  
	TweenService:Create(MainFrame, TweenInfo.new(0.25), { Size = fullFrameSize }):Play()  
	wait(0.2)  
	Content.Visible = true  
	TweenService:Create(Content, TweenInfo.new(0.25), { Size = fullSize }):Play()  
end

end)

Close.MouseButton1Click:Connect(function()
KreinGui:Destroy()
end)

-- Tab Logic
local Tabs = {}
local tabCount = 0

local function CreateTab(tabName)
if Tabs[tabName] then return Tabs[tabName] end

local TabButton = Instance.new("TextButton", TabContainer)  
TabButton.Text = tabName  
TabButton.Size = UDim2.new(1, -10, 0, 30)  
TabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  
TabButton.TextColor3 = Color3.fromRGB(0, 255, 0)  
TabButton.Font = Enum.Font.Code  
TabButton.TextSize = 18  
TabButton.AutoButtonColor = false  
Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0, 6)  

local Page = Instance.new("ScrollingFrame", PageContainer)  
Page.Name = tabName  
Page.Size = UDim2.new(1, 0, 1, 0)  
Page.BackgroundTransparency = 1  
Page.ScrollBarThickness = 6  
Page.ScrollingDirection = Enum.ScrollingDirection.Y  
Page.CanvasSize = UDim2.new(0, 0, 0, 0)  
Page.Visible = false  

-- âœ… FIX: Tampilkan tab pertama otomatis  
if not next(Tabs) then  
	Page.Visible = true  
end  

local Layout = Instance.new("UIListLayout", Page)  
Layout.Padding = UDim.new(0, 6)  
Layout.SortOrder = Enum.SortOrder.LayoutOrder  
Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()  
	Page.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 10)  
end)  

Tabs[tabName] = Page  

TabButton.MouseButton1Click:Connect(function()  
	for _, page in pairs(Tabs) do  
		page.Visible = false  
	end  
	Page.Visible = true  
end)  

return Page

end

local function AddButton(tab, text, callback)
local button = Instance.new("TextButton", tab)
button.Size = UDim2.new(1, -10, 0, 30)
button.Text = text
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.TextColor3 = Color3.fromRGB(0, 255, 0)
button.Font = Enum.Font.Code
button.TextSize = 16
Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)
button.MouseButton1Click:Connect(callback)
end

local function AddToggle(tab, text, default, callback)
local toggle = Instance.new("TextButton", tab)
toggle.Size = UDim2.new(1, -10, 0, 30)
toggle.Text = text .. ": " .. (default and "ON" or "OFF")
toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggle.TextColor3 = Color3.fromRGB(0, 255, 0)
toggle.Font = Enum.Font.Code
toggle.TextSize = 16
local state = default
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 6)

toggle.MouseButton1Click:Connect(function()  
	state = not state  
	toggle.Text = text .. ": " .. (state and "ON" or "OFF")  
	callback(state)  
end)

end

local function AddDropdown(tab, title, options, default, callback)
local dropdown = Instance.new("TextButton", tab)
dropdown.Size = UDim2.new(1, -10, 0, 30)
dropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
dropdown.TextColor3 = Color3.fromRGB(0, 255, 0)
dropdown.Font = Enum.Font.Code
dropdown.TextSize = 16
Instance.new("UICorner", dropdown).CornerRadius = UDim.new(0, 6)

local current = default or options[1]  
dropdown.Text = title .. ": " .. current  

local open = false  
local buttons = {}  

dropdown.MouseButton1Click:Connect(function()  
	open = not open  
	for _, btn in ipairs(buttons) do  
		btn.Visible = open  
	end  
end)  

for _, opt in ipairs(options) do  
	local btn = Instance.new("TextButton", tab)  
	btn.Size = UDim2.new(1, -20, 0, 25)  
	btn.Text = opt  
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  
	btn.TextColor3 = Color3.fromRGB(0, 255, 0)  
	btn.Font = Enum.Font.Code  
	btn.TextSize = 14  
	btn.Visible = false  
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)  

	btn.MouseButton1Click:Connect(function()  
		current = opt  
		dropdown.Text = title .. ": " .. current  
		open = false  
		for _, b in ipairs(buttons) do  
			b.Visible = false  
		end  
		callback(opt)  
	end)  

	table.insert(buttons, btn)  
end

end

local function AddDropdownSection(tab, title)
	local container = Instance.new("Frame")
	container.BackgroundTransparency = 1
	container.Size = UDim2.new(1, 0, 0, 0)
	container.AutomaticSize = Enum.AutomaticSize.Y
	container.Parent = tab

	local toggleBtn = Instance.new("TextButton")
	toggleBtn.Size = UDim2.new(1, -10, 0, 30)
	toggleBtn.Position = UDim2.new(0, 5, 0, 0)
	toggleBtn.Text = "• " .. title
	toggleBtn.Font = Enum.Font.Code
	toggleBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
	toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	toggleBtn.TextSize = 16
	toggleBtn.AutoButtonColor = false
	toggleBtn.Parent = container
	Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 6)

	local contentFrame = Instance.new("Frame")
	contentFrame.BackgroundTransparency = 1
	contentFrame.Size = UDim2.new(1, 0, 0, 0)
	contentFrame.Position = UDim2.new(0, 0, 0, 30)
	contentFrame.AutomaticSize = Enum.AutomaticSize.Y
	contentFrame.Visible = false
	contentFrame.Parent = container

	local layout = Instance.new("UIListLayout", contentFrame)
	layout.Padding = UDim.new(0, 6)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	local expanded = false
	toggleBtn.MouseButton1Click:Connect(function()
		expanded = not expanded
		contentFrame.Visible = expanded
		toggleBtn.Text = (expanded and "| " or "• ") .. title
	end)

	local sectionAPI = {}

	function sectionAPI:AddButton(text, callback)
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(1, -10, 0, 30)
		btn.Position = UDim2.new(0, 0, 0, 0)
		btn.Text = text
		btn.Font = Enum.Font.Code
		btn.TextColor3 = Color3.new(1, 1, 1)
		btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		btn.TextSize = 14
		btn.Parent = contentFrame
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
		btn.MouseButton1Click:Connect(callback)
	end

	function sectionAPI:AddToggle(text, default, callback)
		local toggle = Instance.new("TextButton")
		toggle.Size = UDim2.new(1, -10, 0, 30)
		toggle.Position = UDim2.new(0, 0, 0, 0)
		toggle.Font = Enum.Font.Code
		toggle.TextColor3 = Color3.new(1, 1, 1)
		toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		toggle.TextSize = 14
		toggle.Parent = contentFrame
		Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 6)

		local state = default
		toggle.Text = (state and "[ON] " or "[OFF] ") .. text
		toggle.MouseButton1Click:Connect(function()
			state = not state
			toggle.Text = (state and "[ON] " or "[OFF] ") .. text
			pcall(callback, state)
		end)
	end

	return sectionAPI
end


-- âœ… Changelog Tab Internal (Tidak bisa diubah dari luar)
do
	local changelogText = [[
ðŸ“¢ KREINHUB CHANGELOG

ðŸŸ¢ v1.0.0 - 2025-07-08
â€¢ Rilis perdana KreinHub dengan sistem modular
â€¢ Tab dan page auto layout
â€¢ Sistem Button & Toggle siap pakai
â€¢ Dropdown berisi sub-toggle dan button (collapsible)
â€¢ UI hacker style dengan tema gelap

ðŸ§  Sistem Eksport API
â€¢ Loader luar bisa pakai: CreateTab, AddButton, AddToggle, AddDropdown

ðŸ”’ Fitur Terproteksi
â€¢ Tab Changelog tidak bisa diubah dari luar
â€¢ Sistem Minimize dan Close dengan animasi Tween

âš™ï¸ Framework Stabil
â€¢ Ukuran tab dan scroll otomatis
â€¢ GUI auto resize saat minimize
â€¢ Corner dan font tersinkron
]]

	local changelogTab = CreateTab("Changelog")

	local changelogBox = Instance.new("TextLabel", changelogTab)
	changelogBox.Size = UDim2.new(1, -10, 0, 220)
	changelogBox.Text = changelogText
	changelogBox.TextWrapped = true
	changelogBox.TextYAlignment = Enum.TextYAlignment.Top
	changelogBox.TextXAlignment = Enum.TextXAlignment.Left
	changelogBox.TextColor3 = Color3.fromRGB(200, 255, 200)
	changelogBox.Font = Enum.Font.Code
	changelogBox.TextSize = 15
	changelogBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	changelogBox.BorderSizePixel = 0
	changelogBox.ClipsDescendants = true
	changelogBox.TextTruncate = Enum.TextTruncate.AtEnd
	Instance.new("UICorner", changelogBox).CornerRadius = UDim.new(0, 6)

	local layout = Instance.new("UIListLayout", changelogTab)
	layout.Padding = UDim.new(0, 6)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
end


local Themes = {
	["Dark Green"] = {
		MainBG = Color3.fromRGB(10, 10, 10),
		Accent = Color3.fromRGB(0, 255, 0),
		Button = Color3.fromRGB(20, 20, 20),
		Tab = Color3.fromRGB(25, 25, 25),
		Dropdown = Color3.fromRGB(40, 40, 40),
		Text = Color3.fromRGB(0, 255, 0),
	},
	["Neon Blue"] = {
		MainBG = Color3.fromRGB(10, 10, 20),
		Accent = Color3.fromRGB(0, 170, 255),
		Button = Color3.fromRGB(30, 30, 50),
		Tab = Color3.fromRGB(20, 20, 40),
		Dropdown = Color3.fromRGB(40, 40, 60),
		Text = Color3.fromRGB(230, 240, 255),
	},
	["Hot Pink"] = {
		MainBG = Color3.fromRGB(25, 10, 25),
		Accent = Color3.fromRGB(255, 0, 150),
		Button = Color3.fromRGB(60, 20, 60),
		Tab = Color3.fromRGB(40, 20, 40),
		Dropdown = Color3.fromRGB(80, 30, 80),
		Text = Color3.fromRGB(255, 220, 255),
	},
	["Monokai"] = {
		MainBG = Color3.fromRGB(39, 40, 34),
		Accent = Color3.fromRGB(249, 38, 114),
		Button = Color3.fromRGB(73, 72, 62),
		Tab = Color3.fromRGB(50, 50, 50),
		Dropdown = Color3.fromRGB(90, 90, 90),
		Text = Color3.fromRGB(255, 255, 255),
	}
}

-- Theme Switch Logic
local function ApplyTheme(theme)
	local t = Themes[theme]
	if not t then return end

	MainFrame.BackgroundColor3 = t.MainBG
	Title.TextColor3 = t.Accent
	Minimize.BackgroundColor3 = t.Button
	Minimize.TextColor3 = t.Accent
	Close.BackgroundColor3 = t.Button
	Close.TextColor3 = Color3.fromRGB(255, 100, 100)

	for _, obj in pairs(MainFrame:GetDescendants()) do
		if obj:IsA("TextButton") or obj:IsA("TextLabel") then
			obj.TextColor3 = t.Text
		end
		if obj:IsA("TextButton") and obj.Parent == TabContainer then
			obj.BackgroundColor3 = t.Tab
		end
		if obj:IsA("TextButton") and obj.Text:match(":") then
			obj.BackgroundColor3 = t.Dropdown
		end
		if obj:IsA("TextButton") and not obj.Text:match(":") then
			obj.BackgroundColor3 = t.Button
		end
	end
end

-- Create Setting Tab
local settingTab = CreateTab("Setting")
AddDropdown(settingTab, "Select Theme", { "Dark Green", "Neon Blue", "Hot Pink", "Monokai" }, "Dark Green", function(selected)
	ApplyTheme(selected)
end)

-- Apply default
ApplyTheme("Dark Green")

-- ðŸ”§ Misc Tab + Script Runner
local miscTab = CreateTab("Misc")

-- Runner UI
local runnerBox = Instance.new("TextBox", miscTab)
runnerBox.Size = UDim2.new(1, -10, 0, 100)
runnerBox.Text = "-- Tulis script Lua di sini lalu tekan Execute"
runnerBox.TextWrapped = true
runnerBox.TextYAlignment = Enum.TextYAlignment.Top
runnerBox.TextXAlignment = Enum.TextXAlignment.Left
runnerBox.ClearTextOnFocus = false
runnerBox.MultiLine = true
runnerBox.Font = Enum.Font.Code
runnerBox.TextSize = 15
runnerBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
runnerBox.TextColor3 = Color3.fromRGB(0, 255, 0)
Instance.new("UICorner", runnerBox).CornerRadius = UDim.new(0, 6)

local execBtn = Instance.new("TextButton", miscTab)
execBtn.Size = UDim2.new(1, -10, 0, 30)
execBtn.Text = "â–¶ Execute"
execBtn.Font = Enum.Font.Code
execBtn.TextSize = 16
execBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
execBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
Instance.new("UICorner", execBtn).CornerRadius = UDim.new(0, 6)

execBtn.MouseButton1Click:Connect(function()
	local src = runnerBox.Text
	if src and src:match("%S") then
		local func, err = loadstring(src)
		if func then
			pcall(func)
		else
			warn("Error in script:", err)
		end
	end
end)

--  Sound Setup
local Sound = Instance.new("Sound")
Sound.Name = "MusicPlayer"
Sound.Volume = 1
Sound.Looped = true
Sound.Parent = game:GetService("SoundService")

--  Musik Frame
local MusicFrame = Instance.new("Frame")
MusicFrame.Size = UDim2.new(0, 250, 0, 120)
MusicFrame.Position = UDim2.new(1, -820, 1, -330)
MusicFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MusicFrame.BorderSizePixel = 0
MusicFrame.Visible = true
MusicFrame.Name = "MusicPlayerFrame"
MusicFrame.Parent = KreinGui

-- UICorner & Shadow
local corner = Instance.new("UICorner", MusicFrame)
corner.CornerRadius = UDim.new(0, 8)

-- Judul
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -30, 0, 25)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = " KreinHub Music"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MusicFrame

-- TextBox untuk input Sound ID
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -20, 0, 30)
TextBox.Position = UDim2.new(0, 10, 0, 35)
TextBox.PlaceholderText = "Masukkan Sound ID Roblox"
TextBox.Text = ""
TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 14
TextBox.ClearTextOnFocus = false
TextBox.Parent = MusicFrame
Instance.new("UICorner", TextBox)

-- Tombol Play
local PlayButton = Instance.new("TextButton")
PlayButton.Size = UDim2.new(0.5, -15, 0, 30)
PlayButton.Position = UDim2.new(0, 10, 0, 75)
PlayButton.Text = " Play"
PlayButton.BackgroundColor3 = Color3.fromRGB(0, 170, 100)
PlayButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayButton.Font = Enum.Font.GothamBold
PlayButton.TextSize = 14
PlayButton.Parent = MusicFrame
Instance.new("UICorner", PlayButton)

-- Tombol Stop
local StopButton = Instance.new("TextButton")
StopButton.Size = UDim2.new(0.5, -15, 0, 30)
StopButton.Position = UDim2.new(0.5, 5, 0, 75)
StopButton.Text = " Stop"
StopButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 14
StopButton.Parent = MusicFrame
Instance.new("UICorner", StopButton)

--  Tombol Minimize
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, 0, 0, 5)
MinimizeButton.AnchorPoint = Vector2.new(1, 0)
MinimizeButton.Text = "-"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 14
MinimizeButton.Parent = MusicFrame
Instance.new("UICorner", MinimizeButton)

local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        MusicFrame:TweenSize(UDim2.new(0, 40, 0, 40), "Out", "Quart", 0.3, true)
        for _, child in pairs(MusicFrame:GetChildren()) do
            if child ~= MinimizeButton and child:IsA("GuiObject") then
                child.Visible = false
            end
        end
    else
        MusicFrame:TweenSize(UDim2.new(0, 250, 0, 120), "Out", "Quart", 0.3, true)
        task.wait(0.3)
        for _, child in pairs(MusicFrame:GetChildren()) do
            if child ~= MinimizeButton and child:IsA("GuiObject") then
                child.Visible = true
            end
        end
    end
end)

--  Play Musik
PlayButton.MouseButton1Click:Connect(function()
	local id = TextBox.Text:match("%d+")
	if id then
		Sound.SoundId = "rbxassetid://"..id
		Sound:Play()
	end
end)

--  Stop Musik
StopButton.MouseButton1Click:Connect(function()
	Sound:Stop()
end)

--  Drag Function (biar MusicFrame bisa digeser)
local UserInputService = game:GetService("UserInputService")

local function dragify(frame)
	local dragging, dragInput, dragStart, startPos

	local function update(input)
		local delta = input.Position - dragStart
		local pos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		frame.Position = pos
	end

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

dragify(MusicFrame) -- aktifkan drag



--  Export semua fungsi supaya bisa dipanggil di Loader.lua
_G.KreinHub = {
    CreateTab = CreateTab,
    AddButton = AddButton,
    AddToggle = AddToggle,
    AddDropdown = AddDropdown,
    AddDropdownSection = AddDropdownSection
}

