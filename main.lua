-- ============================================================
-- YASSIN HUB - LIGHTWEIGHT, MUSIC & GALAXY EDITION
-- ============================================================
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
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

-- 2. Play Custom Song Automatically in Background
task.spawn(function()
    pcall(function()
        local sound = Instance.new("Sound")
        sound.Name = "YassinCustomSong"
        sound.SoundId = "https://files.catbox.moe/0sah2q.mp3"
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = SoundService or LocalPlayer:WaitForChild("PlayerGui")
        sound:Play()
    end)
end)

-- 3. Auto Galaxy Sky (Toggles automatically by itself)
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

-- 4. Name Tag Over Player ("ياسين هب")
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

-- 5. Auto Memory / RAM Optimizer (تظبيط الرمات تلقائياً في الخلفية)
task.spawn(function()
    while true do
        pcall(function()
            collectgarbage("collect")
        end)
        task.wait(10)
    end
end)

print("YASSIN HUB - Light, Music & Galaxy Version Loaded Successfully!")
