local UserInputService = game:GetService("UserInputService")
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TabButtons = Instance.new("Frame")
local ButtonsTab = Instance.new("TextButton")
local LuaExecutorTab = Instance.new("TextButton")
local ButtonsFrame = Instance.new("Frame")
local LuaExecutorFrame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local RunButton = Instance.new("TextButton")

-- Title properties
Title.Parent = MainFrame
Title.Text = "ShadowForce Executor"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.BorderSizePixel = 0

-- Tab buttons container
TabButtons.Parent = MainFrame
TabButtons.Size = UDim2.new(1, 0, 0, 30)
TabButtons.Position = UDim2.new(0, 0, 0, 30)
TabButtons.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TabButtons.BorderSizePixel = 0

-- Buttons tab button
ButtonsTab.Parent = TabButtons
ButtonsTab.Text = "Buttons"
ButtonsTab.Size = UDim2.new(0.5, 0, 1, 0)
ButtonsTab.Position = UDim2.new(0, 0, 0, 0)
ButtonsTab.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ButtonsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonsTab.Font = Enum.Font.SourceSansBold
ButtonsTab.TextSize = 16

-- Lua Executor tab button
LuaExecutorTab.Parent = TabButtons
LuaExecutorTab.Text = "Lua Executor"
LuaExecutorTab.Size = UDim2.new(0.5, 0, 1, 0)
LuaExecutorTab.Position = UDim2.new(0.5, 0, 0, 0)
LuaExecutorTab.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
LuaExecutorTab.TextColor3 = Color3.fromRGB(255, 255, 255)
LuaExecutorTab.Font = Enum.Font.SourceSansBold
LuaExecutorTab.TextSize = 16

-- Buttons frame
ButtonsFrame.Parent = MainFrame
ButtonsFrame.Size = UDim2.new(1, 0, 1, -60)
ButtonsFrame.Position = UDim2.new(0, 0, 0, 60)
ButtonsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ButtonsFrame.Visible = true

-- Lua Executor frame
LuaExecutorFrame.Parent = MainFrame
LuaExecutorFrame.Size = UDim2.new(1, 0, 1, -60)
LuaExecutorFrame.Position = UDim2.new(0, 0, 0, 60)
LuaExecutorFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
LuaExecutorFrame.Visible = false

-- TextBox for Lua code input
TextBox.Parent = LuaExecutorFrame
TextBox.Size = UDim2.new(0.9, 0, 0.7, 0)
TextBox.Position = UDim2.new(0.05, 0, 0.1, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextSize = 16
TextBox.ClearTextOnFocus = false
TextBox.MultiLine = true

-- Run Button
RunButton.Parent = LuaExecutorFrame
RunButton.Text = "Run"
RunButton.Size = UDim2.new(0.3, 0, 0.1, 0)
RunButton.Position = UDim2.new(0.35, 0, 0.85, 0)
RunButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
RunButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RunButton.Font = Enum.Font.SourceSansBold
RunButton.TextSize = 16

-- Toggle tab visibility
ButtonsTab.MouseButton1Click:Connect(function()
    ButtonsFrame.Visible = true
    LuaExecutorFrame.Visible = false
end)

LuaExecutorTab.MouseButton1Click:Connect(function()
    ButtonsFrame.Visible = false
    LuaExecutorFrame.Visible = true
end)

-- Run Lua code on button click
RunButton.MouseButton1Click:Connect(function()
    local code = TextBox.Text
    local success, err = pcall(function()
        loadstring(code)()
    end)
    if not success then
        warn("Error in code: " .. err)
    end
end)

local function createToggle(name, positionY)
    local Label = Instance.new("TextLabel")
    local Toggle = Instance.new("Frame")
    local Knob = Instance.new("Frame")

    -- Label properties
    Label.Parent = ButtonsFrame
    Label.Text = name
    Label.Size = UDim2.new(0, 100, 0, 30)
    Label.Position = UDim2.new(0, 10, 0, positionY)
    Label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.SourceSansBold
    Label.TextSize = 20
    Label.BorderSizePixel = 0

    -- Toggle frame properties
    Toggle.Parent = ButtonsFrame
    Toggle.Size = UDim2.new(0, 50, 0, 20)
    Toggle.Position = UDim2.new(0, 120, 0, positionY + 5)
    Toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Toggle.BorderSizePixel = 0

    -- Knob properties (rounded/circular)
    Knob.Parent = Toggle
    Knob.Size = UDim2.new(0, 20, 0, 20)
    Knob.Position = UDim2.new(0, 0, 0, 0)
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.BorderSizePixel = 0
    Knob.BackgroundTransparency = 0
    Knob.ZIndex = 2
    Knob.ClipsDescendants = true

    -- Make the Knob circular
    local UICornerKnob = Instance.new("UICorner")
    UICornerKnob.CornerRadius = UDim.new(1, 0)
    UICornerKnob.Parent = Knob

    -- Toggle frame rounded corners
    local UICornerToggle = Instance.new("UICorner")
    UICornerToggle.CornerRadius = UDim.new(0.5, 0)
    UICornerToggle.Parent = Toggle

    -- Toggle functionality
    local isOn = false
    Toggle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isOn = not isOn
            if isOn then
                Knob:TweenPosition(UDim2.new(0, 30, 0, 0), "Out", "Quad", 0.2, true)
                Toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 255) -- Blue when ON
                print(name .. " enabled (fake)")
            else
                Knob:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.2, true)
                Toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70) -- Gray when OFF
                print(name .. " disabled (fake)")
            end
        end
    end)
end

-- Enable dragging functionality for the MainFrame
local dragging = false
local dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- Set parent for GUI
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- MainFrame properties
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BorderSizePixel = 0

-- Create toggles
createToggle("Aimbot", 50)
createToggle("Aim Assist", 100)
createToggle("Trigger Bot", 150)
