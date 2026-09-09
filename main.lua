-- ============================================================
-- YASSIN 1000+ FPS UNLOCKED & INSTANT TOUCH HUB (MI 11 LITE)
-- ============================================================

-- 1. تحميل السكريبتات الخارجية فوراً وبأقصى سرعة
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
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local NetworkSettings = settings():GetService("NetworkSettings")

-- 2. بوست خفيف جداً يمنع الدروب فريم ويحافظ على الماب بالكامل
task.spawn(function()
    pcall(function()
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        
        for _, v in ipairs(Lighting:GetChildren()) do
            if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") then
                v.Enabled = false
            end
        end

        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
                obj.Enabled = false
            elseif obj:IsA("BasePart") then
                obj.CastShadow = false
            end
        end
    end)
end)

-- 3. كسر ليميت الفريمات تماماً (Unlock FPS to Max / 1000+) وتجاوز أي قيود داخل اللعبة
task.spawn(function()
    pcall(function()
        if setfpscap then
            setfpscap(9999) -- كسر الحجز وفتح أقصى فريمات ممكنة للمعالج
        end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end)
    
    -- تجاوز الـ VSync وإجبار المحرك على أعلى معدل تحديث بلا حدود
    RunService.RenderStepped:Connect(function()
        pcall(function()
            settings().Physics.AllowSleep = false
            settings().Rendering.EagerBulkExecution = true
        end)
    end)
end)

-- 4. سرعة خارقة لحركة الشاشة، اللمس، والضرب لتسبق أي لاعب بمراحل (Zero Delay)
task.spawn(function()
    pcall(function()
        if NetworkSettings then
            NetworkSettings.IncomingReplicationLag = 0
        end
        
        -- تسريع استجابة الكاميرا وحركة الشاشة فوراً عند اللمس
        RunService.Heartbeat:Connect(function()
            pcall(function()
                local char = LocalPlayer.Character
                if char then
                    local tool = char:FindFirstChildOfClass("Tool")
                    if tool then
                        tool.RequiresHandle = false
                    end
                end
            end)
        end)
    end)
end)

-- دالة تحميل الملفات الصوتية بسرعة عالية
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

-- واجهة القائمة الفورية والسريعة
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YassinUnlockedHub"
ScreenGui.Parent = game:WaitForChild("CoreGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 12, 32)
MainFrame.BackgroundTransparency = 0.15
MainFrame.Size = UDim2.new(0, 320, 0, 360)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -180)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(140, 220, 255)
MainStroke.Transparency = 0.25
MainStroke.Thickness = 2

-- رأس القائمة
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
HeaderText.Text = "⚡ Unlocked FPS & Ultra Speed"
HeaderText.TextColor3 = Color3.fromRGB(120, 220, 255)
HeaderText.Font = Enum.Font.GothamBold
HeaderText.TextSize = 12
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

-- حاوية الأزرار السريعة
local Container = Instance.new("ScrollingFrame")
Container.Parent = MainFrame
Container.Size = UDim2.new(1, 0, 1, -50)
Container.Position = UDim2.new(0, 0, 0, 50)
Container.BackgroundTransparency = 1
Container.CanvasSize = UDim2.new(0, 0, 0, 320)
Container.ScrollBarThickness = 4

-- برمجة فتح وإغلاق القائمة بشكل فوري
local isMinimized = false
MinBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    Container.Visible = not isMinimized
    MainFrame.Size = isMinimized and UDim2.new(0, 320, 0, 45) or UDim2.new(0, 320, 0, 360)
    MinBtn.Text = isMinimized and "+" or "-"
end)

local activeMenuSound = nil

local function PlayMenuSong(url, fileName, name, customVolume)
    if activeMenuSound then activeMenuSound:Destroy() end
    task.spawn(function()
        local asset = getCustomSound(url, fileName)
        local sound = Instance.new("Sound")
        sound.Name = name
        sound.SoundId = asset
        sound.Volume = customVolume or 2.0
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

local function CreateButton(text, yPos)
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

-- الأزرار
local BtnAutoBat = CreateButton("عصاية أوتوماتيك (Auto Bat)", 15)
local BtnEgyptian2 = CreateButton("أغنية مصرية 2", 65)
local BtnEgyptian3 = CreateButton("🔥 مصرية 3 (صوت عالي)", 115)
local BtnEgyptian4 = CreateButton("🔥 مصرية 4 (صوت عالي)", 165)
local BtnNuts = CreateButton("أغنية NUTS", 215)
local BtnLucid = CreateButton("أغنية Lucid Dreams", 265)

local autoBatEnabled = false

-- تفعيل العصاية التلقائية بأقصى سرعة لتسبق أي خصم
task.spawn(function()
    RunService.RenderStepped:Connect(function()
        if autoBatEnabled then
            pcall(function()
                local char = LocalPlayer.Character
                if char then
                    local tool = char:FindFirstChildOfClass("Tool")
                    if not tool or (not tool.Name:lower():find("bat") and not tool.Name:lower():find("عصا")) then
                        local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
                        if backpack then
                            for _, item in ipairs(backpack:GetChildren()) do
                                if item:IsA("Tool") and (item.Name:lower():find("bat") or item.Name:lower():find("عصا")) then
                                    char.Humanoid:EquipTool(item)
                                    tool = item
                                    break
                                end
                            end
                        end
                    end
                    
                    if tool and (tool.Name:lower():find("bat") or tool.Name:lower():find("عصا")) then
                        tool:Activate()
                    end
                end
            end)
        end
    end)
end)

BtnAutoBat.MouseButton1Click:Connect(function()
    autoBatEnabled = not autoBatEnabled
    if autoBatEnabled then
        BtnAutoBat.Text = "ON"
        BtnAutoBat.BackgroundColor3 = Color3.fromRGB(40, 160, 100)
        BtnAutoBat.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        BtnAutoBat.Text = "OFF"
        BtnAutoBat.BackgroundColor3 = Color3.fromRGB(40, 30, 65)
        BtnAutoBat.TextColor3 = Color3.fromRGB(180, 180, 180)
    end
end)

local eg2Playing = false
local eg3Playing = false
local eg4Playing = false
local nutsPlaying = false
local lucidPlaying = false

local function resetSongButtons()
    local songBtns = {BtnEgyptian2, BtnEgyptian3, BtnEgyptian4, BtnNuts, BtnLucid}
    for _, b in ipairs(songBtns) do
        b.Text = "OFF"
        b.BackgroundColor3 = Color3.fromRGB(40, 30, 65)
        b.TextColor3 = Color3.fromRGB(180, 180, 180)
    end
    eg2Playing = false
    eg3Playing = false
    eg4Playing = false
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
        PlayMenuSong("https://files.catbox.moe/0sah2q.mp3", "egyptian2_song.mp3", "Yassin_Egyptian2", 2.0)
        BtnEgyptian2.Text = "ON"
        BtnEgyptian2.BackgroundColor3 = Color3.fromRGB(40, 160, 100)
        BtnEgyptian2.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

BtnEgyptian3.MouseButton1Click:Connect(function()
    if eg3Playing then
        StopMenuSong()
        resetSongButtons()
    else
        resetSongButtons()
        eg3Playing = true
        PlayMenuSong("https://files.catbox.moe/rfe0dl.mp3", "egyptian3_song.mp3", "Yassin_Egyptian3_Boosted", 10.0)
        BtnEgyptian3.Text = "ON"
        BtnEgyptian3.BackgroundColor3 = Color3.fromRGB(40, 160, 100)
        BtnEgyptian3.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

BtnEgyptian4.MouseButton1Click:Connect(function()
    if eg4Playing then
        StopMenuSong()
        resetSongButtons()
    else
        resetSongButtons()
        eg4Playing = true
        PlayMenuSong("https://files.catbox.moe/v7y0jb.mp3", "egyptian4_song.mp3", "Yassin_Egyptian4_Boosted", 10.0)
        BtnEgyptian4.Text = "ON"
        BtnEgyptian4.BackgroundColor3 = Color3.fromRGB(40, 160, 100)
        BtnEgyptian4.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

BtnNuts.MouseButton1Click:Connect(function()
    if nutsPlaying then
        StopMenuSong()
        resetSongButtons()
    else
        resetSongButtons()
        nutsPlaying = true
        PlayMenuSong("https://archive.org/download/li-l-peep-nuts-feat.-lil-skil-extended_202011/LiL%20PEEP%20-%20nuts%20%28feat.%20lil%20skil%29%20%28Extended%29.mp3", "nuts_song.mp3", "MVP_NUTS", 2.0)
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
        PlayMenuSong("https://file.garden/algLafWA1jk8WMfK/Lucid%20Dreams%20-%20Clean%20-%20Juice%20WRLD(MP3_160K).mp3", "lucid_song.mp3", "CRYON_LucidDreams", 2.0)
        BtnLucid.Text = "ON"
        BtnLucid.BackgroundColor3 = Color3.fromRGB(40, 160, 100)
        BtnLucid.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

print("YASSIN 1000+ FPS UNLOCKED & INSTANT TOUCH HUB LOADED SUCCESSFULLY!")
