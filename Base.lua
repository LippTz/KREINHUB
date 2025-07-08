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

-- Tab Area
local TabContainer = Instance.new("Frame", Content)
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(0, 120, 1, 0)
TabContainer.Position = UDim2.new(0, 0, 0, 0)
TabContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TabContainer.BorderSizePixel = 0
Instance.new("UICorner", TabContainer).CornerRadius = UDim.new(0, 8)

local TabLayout = Instance.new("UIListLayout", TabContainer)
TabLayout.Padding = UDim.new(0, 6)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder

local PageContainer = Instance.new("Frame", Content)
PageContainer.Name = "PageContainer"
PageContainer.Position = UDim2.new(0, 130, 0, 0)
PageContainer.Size = UDim2.new(1, -130, 1, 0)
PageContainer.BackgroundTransparency = 1
PageContainer.ClipsDescendants = true

-- Minimize logic
local minimized = false
local fullSize = UDim2.new(1, 0, 1, -45)
local fullFrameSize = UDim2.new(0, 450, 0, 300)
local minimizedFrameSize = UDim2.new(0, 450, 0, 40)

Minimize.MouseButton1Click:Connect(function()
	minimized = not minimized

	if minimized then
		TweenService:Create(Content, TweenInfo.new(0.25), { Size = UDim2.new(1, 0, 0, 0) }):Play()
		wait(0.25)
		Content.Visible = false
		TweenService:Create(MainFrame, TweenInfo.new(0.25), { Size = minimizedFrameSize }):Play()
	else
		TweenService:Create(MainFrame, TweenInfo.new(0.25), { Size = fullFrameSize }):Play()
		wait(0.25)
		Content.Visible = true
		TweenService:Create(Content, TweenInfo.new(0.25), { Size = fullSize }):Play()
	end
end)

Close.MouseButton1Click:Connect(function()
	KreinGui:Destroy()
end)

-- Core Logic
local Tabs = {}

local function CreateTab(tabName)
	if Tabs[tabName] then return Tabs[tabName] end

	local TabButton = Instance.new("TextButton", TabContainer)
	TabButton.Text = tabName
	TabButton.Size = UDim2.new(1, -10, 0, 30)
	TabButton.Position = UDim2.new(0, 5, 0, 0)
	TabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TabButton.TextColor3 = Color3.fromRGB(0, 255, 0)
	TabButton.Font = Enum.Font.Code
	TabButton.TextSize = 18
	TabButton.AutoButtonColor = false
	Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0, 6)

	-- ✅ Pakai ScrollingFrame
	local Page = Instance.new("ScrollingFrame", PageContainer)
	Page.Name = tabName
	Page.Size = UDim2.new(1, 0, 1, 0)
	Page.BackgroundTransparency = 1
	Page.ScrollBarThickness = 6
	Page.ScrollingDirection = Enum.ScrollingDirection.Y
	Page.CanvasSize = UDim2.new(0, 0, 0, 0)
	Page.Visible = false

	local Layout = Instance.new("UIListLayout", Page)
	Layout.Padding = UDim.new(0, 6)
	Layout.SortOrder = Enum.SortOrder.LayoutOrder

	-- Auto update canvas size
	Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		Page.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 10)
	end)

	Tabs[tabName] = Page

	TabButton.MouseButton1Click:Connect(function()
		for _, page in pairs(Tabs) do page.Visible = false end
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

-- Export
_G.KreinHub = {
	CreateTab = CreateTab,
	AddButton = AddButton,
	AddToggle = AddToggle,
}
