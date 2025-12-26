-- VOIDZ HUB | ARSENAL by R4VV 
-- OWNER: R4VV

local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local TargetParent = (RunService:IsStudio() and PlayerGui) or CoreGui
if TargetParent:FindFirstChild("VOIDZ_HUB") then TargetParent.VOIDZ_HUB:Destroy() end

local Screen = Instance.new("ScreenGui", TargetParent)
Screen.Name = "VOIDZ_HUB"
Screen.ResetOnSpawn = false

-- ==========================================
-- V TEXT TOGGLE (VISIBLE & DRAGGABLE)
-- ==========================================
local ToggleIcon = Instance.new("TextButton", Screen)
ToggleIcon.Name = "V_Toggle"
ToggleIcon.Size = UDim2.new(0, 50, 0, 50)
ToggleIcon.Position = UDim2.new(0, 50, 0.5, 0) 
ToggleIcon.BackgroundTransparency = 1 
ToggleIcon.Text = "V"
ToggleIcon.TextSize = 40 
ToggleIcon.TextColor3 = Color3.fromRGB(255, 255, 255) 
ToggleIcon.TextTransparency = 0 
ToggleIcon.Font = Enum.Font.SourceSansBold
ToggleIcon.ZIndex = 999 

local draggingIcon, dragStartIcon, startPosIcon
ToggleIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingIcon = true
        dragStartIcon = input.Position
        startPosIcon = ToggleIcon.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if draggingIcon and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStartIcon
        ToggleIcon.Position = UDim2.new(startPosIcon.X.Scale, startPosIcon.X.Offset + delta.X, startPosIcon.Y.Scale, startPosIcon.Y.Offset + delta.Y)
    end
end)
ToggleIcon.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingIcon = false
    end
end)

-- ==========================================
-- MAIN FRAME & FEATURES
-- ==========================================
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 500, 0, 350)
Main.Position = UDim2.new(0.5, -250, 0.4, -175)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BackgroundTransparency = 0.1
Main.Visible = true
Main.ZIndex = 1
Instance.new("UIStroke", Main).Color = Color3.fromRGB(255, 0, 0)
Instance.new("UICorner", Main)

local Head = Instance.new("Frame", Main)
Head.Size = UDim2.new(1, 0, 0, 45)
Head.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Head.BackgroundTransparency = 0.8
Head.ZIndex = 2
Instance.new("UICorner", Head)

local Title = Instance.new("TextLabel", Head)
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "VOIDZ HUB | ARSENAL by R4VV"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left

local MinBtn = Instance.new("TextButton", Head)
MinBtn.Size = UDim2.new(0, 35, 0, 35)
MinBtn.Position = UDim2.new(1, -80, 0, 5)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 40

local CloseBtn = Instance.new("TextButton", Head)
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 25

local SideBar = Instance.new("Frame", Main)
SideBar.Size = UDim2.new(0, 120, 1, -60)
SideBar.Position = UDim2.new(0, 10, 0, 55)
SideBar.BackgroundTransparency = 1
Instance.new("UIListLayout", SideBar).Padding = UDim.new(0, 5)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -140, 1, -65)
Container.Position = UDim2.new(0, 130, 0, 55)
Container.BackgroundTransparency = 1

local MainP = Instance.new("ScrollingFrame", Container)
MainP.Size = UDim2.new(1, 0, 1, 0)
MainP.BackgroundTransparency = 1
MainP.ScrollBarThickness = 0
MainP.Visible = true
Instance.new("UIListLayout", MainP).Padding = UDim.new(0, 8)

local VisualP = Instance.new("ScrollingFrame", Container)
VisualP.Size = UDim2.new(1, 0, 1, 0)
VisualP.BackgroundTransparency = 1
VisualP.Visible = false
Instance.new("UIListLayout", VisualP).Padding = UDim.new(0, 8)

local function CreateToggle(parent, text, callback)
    local state = false
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 45)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = text .. " [ OFF ]"
    b.TextColor3 = Color3.fromRGB(255, 50, 50)
    b.Font = Enum.Font.SourceSansBold
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        state = not state
        b.Text = text .. (state and " [ ON ]" or " [ OFF ]")
        b.TextColor3 = state and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
        callback(state)
    end)
end

local function AddTab(txt, p)
    local b = Instance.new("TextButton", SideBar)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = txt
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        MainP.Visible = false
        VisualP.Visible = false
        p.Visible = true
    end)
end

AddTab("MAIN", MainP)
AddTab("VISUAL", VisualP)

CreateToggle(MainP, "SILENT AIM", function(s) if s then loadstring(game:HttpGet('https://pastefy.app/MEcxLYO0/raw'))() end end)
CreateToggle(MainP, "INFINITE AMMO", function(s)
    _G.InfAmmo = s
    if s then
        _G.AmmoLoop = RunService.Stepped:Connect(function()
            if not _G.InfAmmo then _G.AmmoLoop:Disconnect() return end
            pcall(function() local cc = getsenv(Player.PlayerGui.GUI.ClientControl) debug.setupvalue(cc.fire, 2, 999) end)
        end)
    end
end)
CreateToggle(VisualP, "HIGHLIGHT ESP", function(s)
    _G.ESPToggle = s
    if s then
        _G.LoopESP = RunService.RenderStepped:Connect(function()
            if not _G.ESPToggle then _G.LoopESP:Disconnect() return end
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= Player and v.Character and v.Team ~= Player.Team then
                    if not v.Character:FindFirstChild("VOIDZ_HL") then
                        local h = Instance.new("Highlight", v.Character)
                        h.Name = "VOIDZ_HL"
                        h.FillColor = Color3.fromRGB(255, 0, 0)
                    end
                end
            end
        end)
    else
        for _, v in pairs(game.Players:GetPlayers()) do if v.Character and v.Character:FindFirstChild("VOIDZ_HL") then v.Character.VOIDZ_HL:Destroy() end end
    end
end)

MinBtn.MouseButton1Click:Connect(function() Main.Visible = false end)
CloseBtn.MouseButton1Click:Connect(function() Screen:Destroy() end)
ToggleIcon.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)
