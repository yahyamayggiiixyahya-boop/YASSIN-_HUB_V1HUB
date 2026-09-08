-- ============================================================
-- YASSIN HUB - NO SKY, MUSIC & LIGHTWEIGHT EDITION
-- ============================================================
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
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

-- 2. Menu Song System (Automatic Music)
local currentSound = nil
local eg2Playing = false

local function StopMenuSong()
    pcall(function()
        if currentSound then
            currentSound:Stop()
            currentSound:Destroy()
            currentSound = nil
        end
    end)
    eg2Playing = false
end

local function PlayMenuSong(url, fileName, soundName)
    StopMenuSong()
    pcall(function()
        local sound = Instance.new("Sound")
        sound.Name = soundName or "Yassin_Egyptian2"
        sound.SoundId = url
        sound.Volume = 3
        sound.Looped = true
        sound.Parent = SoundService
        sound:Play()
        currentSound = sound
    end)
end

local function resetSongButtons()
    eg2Playing = false
end

-- تشغيل الأغنية تلقائياً فوراً أول ما السكريبت يفتح
task.spawn(function()
    task.wait(1)
    pcall(function()
        resetSongButtons()
        eg2Playing = true
        PlayMenuSong("https://files.catbox.moe/0sah2q.mp3", "egyptian2_song.mp3", "Yassin_Egyptian2")
    end)
end)

-- 3. Name Tag Over Player ("ياسين هب")
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

-- 4. Auto Memory / RAM Optimizer (تظبيط الرامات تلقائياً)
task.spawn(function()
    while true do
        pcall(function()
            collectgarbage("collect")
        end)
        task.wait(10)
    end
end)

print("YASSIN HUB - No Sky Version Loaded Successfully!")
