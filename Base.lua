-- ✅ KreinHub Key System
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local KeyGui = Instance.new("ScreenGui", game.CoreGui)
KeyGui.Name = "KreinHub_KeyUI"
KeyGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", KeyGui)
Frame.Size = UDim2.new(0, 360, 0, 200)
Frame.Position = UDim2.new(0.5, -180, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Instance.new("UICorner", Frame)

-- Title
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "KreinHub Access Key"
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.Font = Enum.Font.Code
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Center

-- Notif
local Notif = Instance.new("TextLabel", Frame)
Notif.Size = UDim2.new(1, -20, 0, 20)
Notif.Position = UDim2.new(0, 10, 0, 40)
Notif.BackgroundTransparency = 1
Notif.TextColor3 = Color3.fromRGB(255, 255, 255)
Notif.Font = Enum.Font.Code
Notif.TextSize = 14
Notif.Text = "Enter your key to access KreinHub"
Notif.TextXAlignment = Enum.TextXAlignment.Center

-- Input Key
local Input = Instance.new("TextBox", Frame)
Input.Size = UDim2.new(1, -40, 0, 30)
Input.Position = UDim2.new(0, 20, 0, 70)
Input.PlaceholderText = "Enter Key Here"
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Input.TextColor3 = Color3.new(1, 1, 1)
Input.Font = Enum.Font.Code
Input.TextSize = 16
Instance.new("UICorner", Input)

-- Config
local GitHubURL = "https://github.com/LippTz/KREINHUB"
local KeyURL = "https://kreinproject.xyz/getkey"
local CorrectKey = "kreinhub"

-- Buttons
local function createButton(name, pos, callback)
	local btn = Instance.new("TextButton", Frame)
	btn.Size = UDim2.new(0.3, 0, 0, 30)
	btn.Position = pos
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	btn.TextColor3 = Color3.fromRGB(0, 255, 0)
	btn.Font = Enum.Font.Code
	btn.TextSize = 14
	Instance.new("UICorner", btn)
	btn.MouseButton1Click:Connect(callback)
end

createButton("🌐 GitHub", UDim2.new(0.05, 0, 0, 120), function()
	setclipboard(GitHubURL)
	Notif.Text = "✅ GitHub link copied!"
end)

createButton("🔑 Get Key", UDim2.new(0.35, 0, 0, 120), function()
	setclipboard(KeyURL)
	Notif.Text = "✅ Key page copied!"
end)

createButton("✅ Verify", UDim2.new(0.65, 0, 0, 120), function()
	if Input.Text == CorrectKey then
		Notif.Text = "✅ Access Granted!"
		wait(0.5)
		KeyGui:Destroy()
		loadstring(game:HttpGet("https://yourkreinhublink.lua"))() -- Ganti dengan link asli GUI-mu
	else
		Notif.Text = "❌ Key is invalid!"
	end
end)

-- Configurable public API
_G.KreinKeySystem = {
	SetGitHub = function(link) GitHubURL = link end,
	SetKeyURL = function(link) KeyURL = link end,
	SetKey = function(key) CorrectKey = key end,
}

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
		TweenService:Create(Content, TweenInfo.new(0.15), { Size = UDim2.new(1, 0, 0, 0) }):Play()
		wait(0.15)
		Content.Visible = false
		TweenService:Create(MainFrame, TweenInfo.new(0.15), { Size = minimizedFrameSize }):Play()
	else
		TweenService:Create(MainFrame, TweenInfo.new(0.15), { Size = fullFrameSize }):Play()
		wait(0.15)
		Content.Visible = true
		TweenService:Create(Content, TweenInfo.new(0.15), { Size = fullSize }):Play()
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

	-- ✅ FIX: Tampilkan tab pertama otomatis
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
	button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
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
		btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		btn.TextColor3 = Color3.fromRGB(200, 200, 200)
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
	toggleBtn.Position = UDim2.new(0, 0, 0, 0)
	toggleBtn.Text = "▼ " .. title
	toggleBtn.Font = Enum.Font.Code
	toggleBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
	toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
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
		toggleBtn.Text = (expanded and "▲ " or "▼ ") .. title
	end)

	local sectionAPI = {}

	function sectionAPI:AddButton(text, callback)
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(1, -10, 0, 30)
		btn.Position = UDim2.new(0, 0, 0, 0)
		btn.Text = text
		btn.Font = Enum.Font.Code
		btn.TextColor3 = Color3.new(0, 255, 0)
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
		toggle.TextColor3 = Color3.new(0, 255, 0)
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

-- Exported API
_G.KreinHub = {
	CreateTab = CreateTab,
	AddButton = AddButton,
	AddToggle = AddToggle,
	AddDropdown = AddDropdown,
	AddDropdownSection = AddDropdownSection, -- ✅ Tambahkan ini
}

-- ✅ Changelog Tab Internal (Tidak bisa diubah dari luar)
do
	local changelogText = [[
📢 KREINHUB CHANGELOG

🟢 v1.0.0 - 2025-07-08
• Rilis perdana KreinHub dengan sistem modular
• Tab dan page auto layout
• Sistem Button & Toggle siap pakai
• Dropdown berisi sub-toggle dan button (collapsible)
• UI hacker style dengan tema gelap

🧠 Sistem Eksport API
• Loader luar bisa pakai: CreateTab, AddButton, AddToggle, AddDropdown

🔒 Fitur Terproteksi
• Tab Changelog tidak bisa diubah dari luar
• Sistem Minimize dan Close dengan animasi Tween

⚙️ Framework Stabil
• Ukuran tab dan scroll otomatis
• GUI auto resize saat minimize
• Corner dan font tersinkron
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
	changelogBox.TextSize = 14
	changelogBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	changelogBox.BorderSizePixel = 0
	changelogBox.ClipsDescendants = true
	changelogBox.TextTruncate = Enum.TextTruncate.AtEnd
	Instance.new("UICorner", changelogBox).CornerRadius = UDim.new(0, 6)

	local layout = Instance.new("UIListLayout", changelogTab)
	layout.Padding = UDim.new(4, 6)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
end
