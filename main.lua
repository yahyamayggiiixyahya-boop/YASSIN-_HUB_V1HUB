-- ============================================================
-- YASSIN HUB - ULTIMATE COMBINED EDITION (v3.0)
-- ============================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

-- 1. Load External Scripts Safely (Yo-Deals & Anti-Kicks)
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yahyamayggiiixyahya-boop/Yo-Deals-HUB-PRO/refs/heads/main/main.lua"))()
    end)
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yahyamayggiiixyahya-boop/Anti_KickV1/refs/heads/main/main.lua"))()
    end)
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yahyamayggiiixyahya-boop/Anti_KickV2/refs/heads/main/main.lua"))()
    end)
end)

-- Cleanup old GUI
pcall(function()
    for _, old in ipairs(LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        if old.Name == "YassinHubUI" then
            old:Destroy()
        end
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YassinHubUI"
ScreenGui.DisplayOrder = 999999
ScreenGui.Enabled = true
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Main Window Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Active = true
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 7, 26)
MainFrame.BackgroundTransparency = 0.08
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 480, 0, 320)
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(120, 40, 200)
MainStroke.Thickness = 1.6
MainStroke.Parent = MainFrame

-- ==================== TOP BAR (HEADER) ====================
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.BackgroundTransparency = 1
TopBar.Size = UDim2.new(1, 0, 0, 55)
TopBar.Parent = MainFrame

local LogoBox = Instance.new("Frame")
LogoBox.BackgroundColor3 = Color3.fromRGB(25, 10, 45)
LogoBox.Position = UDim2.new(0, 12, 0, 8)
LogoBox.Size = UDim2.new(0, 40, 0, 40)
LogoBox.Parent = TopBar

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 8)
LogoCorner.Parent = LogoBox

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Color3.fromRGB(160, 70, 240)
LogoStroke.Thickness = 1
LogoStroke.Parent = LogoBox

local LogoText = Instance.new("TextLabel")
LogoText.BackgroundTransparency = 1
LogoText.Size = UDim2.new(1, 0, 1, 0)
LogoText.Font = Enum.Font.GothamBlack
LogoText.Text = "YH"
LogoText.TextColor3 = Color3.fromRGB(210, 140, 255)
LogoText.TextSize = 16
LogoText.Parent = LogoBox

local TitleLabel = Instance.new("TextLabel")
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 62, 0, 10)
TitleLabel.Size = UDim2.new(0, 300, 0, 20)
TitleLabel.Font = Enum.Font.GothamBlack
TitleLabel.Text = "YASSIN HUB"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 15
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

local VersionLabel = Instance.new("TextLabel")
VersionLabel.BackgroundTransparency = 1
VersionLabel.Position = UDim2.new(0, 62, 0, 28)
VersionLabel.Size = UDim2.new(0, 300, 0, 16)
VersionLabel.Font = Enum.Font.GothamBold
VersionLabel.Text = "v3.0 | COMBINED & GALAXY EDITION"
VersionLabel.TextColor3 = Color3.fromRGB(140, 110, 190)
VersionLabel.TextSize = 10
VersionLabel.TextXAlignment = Enum.TextXAlignment.Left
VersionLabel.Parent = TopBar

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(25, 10, 45)
MinimizeBtn.Position = UDim2.new(1, -42, 0, 12)
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "−"
MinimizeBtn.TextColor3 = Color3.fromRGB(190, 140, 240)
MinimizeBtn.TextSize = 16
MinimizeBtn.Parent = TopBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = MinimizeBtn

local MinStroke = Instance.new("UIStroke")
MinStroke.Color = Color3.fromRGB(120, 40, 200)
MinStroke.Thickness = 1
MinStroke.Parent = MinimizeBtn

-- ==================== SIDEBAR (TABS) ====================
local Sidebar = Instance.new("Frame")
Sidebar.BackgroundColor3 = Color3.fromRGB(11, 5, 20)
Sidebar.BorderSizePixel = 0
Sidebar.Position = UDim2.new(0, 0, 0, 55)
Sidebar.Size = UDim2.new(0, 110, 1, -55)
Sidebar.Parent = MainFrame

local SideLayout = Instance.new("UIListLayout")
SideLayout.FillDirection = Enum.FillDirection.Vertical
SideLayout.Padding = UDim.new(0, 4)
SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SideLayout.Parent = Sidebar

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 10)
SidePadding.Parent = Sidebar

local Divider = Instance.new("Frame")
Divider.BackgroundColor3 = Color3.fromRGB(70, 25, 120)
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(0, 110, 0, 55)
Divider.Size = UDim2.new(0, 1, 1, -55)
Divider.Parent = MainFrame

local ContainerArea = Instance.new("Frame")
ContainerArea.BackgroundTransparency = 1
ContainerArea.Position = UDim2.new(0, 120, 0, 65)
ContainerArea.Size = UDim2.new(1, -130, 1, -75)
ContainerArea.Parent = MainFrame

local Tabs = {}
local function createTabContent(name)
    local scrolling = Instance.new("ScrollingFrame")
    scrolling.Name = name .. "Tab"
    scrolling.BackgroundTransparency = 1
    scrolling.Size = UDim2.new(1, 0, 1, 0)
    scrolling.CanvasSize = UDim2.new(0, 0, 0, 450)
    scrolling.ScrollBarThickness = 3
    scrolling.Visible = false
    scrolling.Parent = ContainerArea

    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Vertical
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = scrolling

    Tabs[name] = scrolling
    return scrolling
end

local function switchTab(name)
    for tabName, frame in pairs(Tabs) do
        frame.Visible = (tabName == name)
    end
end

local tabNames = {"SPEED", "COMBAT", "MECH", "MOVE", "MISC"}
for i, name in ipairs(tabNames) do
    createTabContent(name)

    local tabBtn = Instance.new("TextButton")
    tabBtn.BackgroundColor3 = Color3.fromRGB(20, 10, 38)
    tabBtn.BackgroundTransparency = 1
    tabBtn.Size = UDim2.new(0, 95, 0, 36)
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.Text = name
    tabBtn.TextColor3 = Color3.fromRGB(150, 120, 190)
    tabBtn.TextSize = 11
    tabBtn.Parent = Sidebar

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = tabBtn

    tabBtn.MouseButton1Click:Connect(function()
        switchTab(name)
        for _, child in ipairs(Sidebar:GetChildren()) do
            if child:IsA("TextButton") then
                child.TextColor3 = Color3.fromRGB(150, 120, 190)
                child.BackgroundTransparency = 1
            end
        end
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabBtn.BackgroundTransparency = 0
    end)

    if i == 1 then
        switchTab(name)
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabBtn.BackgroundTransparency = 0
    end
end

-- ==================== UI BUILDERS ====================
local function addToggle(tabName, text, order, callback)
    local tab = Tabs[tabName]
    if not tab then return end

    local row = Instance.new("Frame")
    row.LayoutOrder = order
    row.BackgroundColor3 = Color3.fromRGB(22, 11, 40)
    row.Size = UDim2.new(1, -10, 0, 38)
    row.Parent = tab

    local rc = Instance.new("UICorner")
    rc.CornerRadius = UDim.new(0, 8)
    rc.Parent = row

    local rs = Instance.new("UIStroke")
    rs.Color = Color3.fromRGB(100, 35, 160)
    rs.Thickness = 1
    rs.Parent = row

    local lbl = Instance.new("TextLabel")
    lbl.BackgroundTransparency = 1
    lbl.Position = UDim2.new(0, 12, 0, 0)
    lbl.Size = UDim2.new(0.65, 0, 1, 0)
    lbl.Font = Enum.Font.GothamBold
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(220, 200, 255)
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row

    local pill = Instance.new("Frame")
    pill.BackgroundColor3 = Color3.fromRGB(12, 6, 22)
    pill.Position = UDim2.new(1, -48, 0.5, -9)
    pill.Size = UDim2.new(0, 38, 0, 18)
    pill.Parent = row

    local pc = Instance.new("UICorner")
    pc.CornerRadius = UDim.new(0, 9)
    pc.Parent = pill

    local knob = Instance.new("Frame")
    knob.BackgroundColor3 = Color3.fromRGB(170, 140, 210)
    knob.Position = UDim2.new(0, 2, 0.5, -7)
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Parent = pill

    local kc = Instance.new("UICorner")
    kc.CornerRadius = UDim.new(0, 7)
    kc.Parent = knob

    local btn = Instance.new("TextButton")
    btn.BackgroundTransparency = 1
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.Text = ""
    btn.Parent = row

    local toggled = false
    btn.MouseButton1Click:Connect(function()
        toggled = not toggled
        TweenService:Create(knob, TweenInfo.new(0.2), {
            Position = toggled and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7),
            BackgroundColor3 = toggled and Color3.fromRGB(0, 255, 140) or Color3.fromRGB(170, 140, 210)
        }):Play()
        callback(toggled)
    end)
end

-- ==================== FEATURE 1: NAME OVER PLAYER "ياسين هب" ====================
local function applyNameTag(char)
    if not char then return end
    local head = char:WaitForChild("Head", 5)
    if head and not head:FindFirstChild("YassinHubTag") then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "YassinHubTag"
        billboard.Adornee = head
        billboard.Size = UDim2.new(0, 150, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 2.5, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = head

        local textLbl = Instance.new("TextLabel")
        textLbl.BackgroundTransparency = 1
        textLbl.Size = UDim2.new(1, 0, 1, 0)
        textLbl.Font = Enum.Font.GothamBlack
        textLbl.Text = "ياسين هب"
        textLbl.TextColor3 = Color3.fromRGB(190, 130, 255)
        textLbl.TextSize = 16
        textLbl.Parent = billboard
        
        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(0, 0, 0)
        stroke.Thickness = 2
        stroke.Parent = textLbl
    end
end

LocalPlayer.CharacterAdded:Connect(applyNameTag)
if LocalPlayer.Character then
    applyNameTag(LocalPlayer.Character)
end

-- ==================== FEATURE 2: AUTO GALAXY SKY ====================
task.spawn(function()
    pcall(function()
        for _, v in ipairs(Lighting:GetChildren()) do
            if v:IsA("Sky") then v:Destroy() end
        end
        local sky = Instance.new("Sky")
        sky.Name = "YassinGalaxySky"
        sky.SkyboxBk = "rbxassetid://159454286"
        sky.SkyboxDn = "rbxassetid://159454296"
        sky.SkyboxFt = "rbxassetid://159454293"
        sky.SkyboxLf = "rbxassetid://159454284"
        sky.SkyboxRt = "rbxassetid://159454291"
        sky.SkyboxUp = "rbxassetid://159454289"
        sky.Parent = Lighting
    end)
end)

-- ==================== COMBAT & MISC FEATURES ====================
addToggle("COMBAT", "لمس اللاعب يطيره بره الماب", 1, function(state)
    _G.TouchFling = state
    task.spawn(function()
        local vel = Vector3.new(0, 0, 0)
        RunService.Heartbeat:Connect(function()
            if not _G.TouchFling then return end
            pcall(function()
                local char = LocalPlayer.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local rot = hrp.CFrame - hrp.Position
                        hrp.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 0.1, 0)) * rot
                        vel = hrp.Velocity
                        hrp.Velocity = Vector3.new(30000, 30000, 30000)
                        RunService.RenderStepped:Wait()
                        hrp.Velocity = vel
                    end
                end
            end)
        end)
    end)
end)

addToggle("SPEED", "Infinite Jump", 1, function(state)
    _G.InfJump = state
end)

UserInputService.JumpRequest:Connect(function()
    if _G.InfJump then
        local char = LocalPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Velocity = Vector3.new(hrp.Velocity.X, 55, hrp.Velocity.Z)
            end
        end
    end
end)

-- ==================== DRAGGING SYSTEM (ANYWHERE) ====================
local dragging, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- ==================== MINIMIZE TOGGLE ====================
local isMinimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    Sidebar.Visible = not isMinimized
    Divider.Visible = not isMinimized
    ContainerArea.Visible = not isMinimized
    
    TweenService:Create(MainFrame, TweenInfo.new(0.25), {
        Size = isMinimized and UDim2.new(0, 480, 0, 55) or UDim2.new(0, 480, 0, 320)
    }):Play()
    MinimizeBtn.Text = isMinimized and "+" or "−"
end)

print("YASSIN HUB V3.0 - Combined & Galaxy Loaded Successfully!")
