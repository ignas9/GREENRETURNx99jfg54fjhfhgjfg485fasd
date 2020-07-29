local CG = game:GetService("CoreGui")
local SG = Instance.new("ScreenGui",CG)
SG.ResetOnSpawn = false
local UIS = game:GetService("UserInputService")
local TWS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local LP = game.Players.LocalPlayer
local Char = LP.Character
local Hum = Char:WaitForChild('Humanoid')
local Mouse = LP:GetMouse()
local function TS(obj,tabl,decay)
	TWS:Create(obj,TweenInfo.new(decay),tabl):Play()
end
function dragify(Frame)
    dragToggle = nil
    local dragSpeed = 0.25
    dragInput = nil
    dragStart = nil
    local dragPos = nil
    function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        TWS:Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
    end
    Frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
            dragToggle = true
            dragStart = input.Position
            startPos = Frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)
end

local function ripple(button, x, y)
	spawn(function()
		local circle = Instance.new("ImageLabel",button)
		circle.Name = 'circle'
		circle.BackgroundTransparency = 1
		circle.ImageTransparency = 1
		circle.BackgroundColor3 = Color3.fromRGB(255,255,255)
		circle.Image = 'rbxassetid://266543268'
		circle.ZIndex = 1000
		
		button.ClipsDescendants = true

		local new_x = x - circle.AbsolutePosition.X
		local new_y = y - circle.AbsolutePosition.Y
		circle.Position = UDim2.new(0, new_x, 0, new_y)

		local size = 0
		if button.AbsoluteSize.X > button.AbsoluteSize.Y then
			 size = button.AbsoluteSize.X * 1.5
		elseif button.AbsoluteSize.X < button.AbsoluteSize.Y then
			 size = button.AbsoluteSize.Y * 1.5
		elseif button.AbsoluteSize.X == button.AbsoluteSize.Y then
			size = button.AbsoluteSize.X * 1.5
		end

		circle:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, -size / 2, 0.5, -size / 2), "Out", "Quad", 0.5, false, nil)
		TS(circle,{ImageTrasnparency = 1},0.5)

		wait(0.5)
		circle:Destroy()
	end)
end

local function createTab(name)
	local Tab = Instance.new("ImageLabel",MUI.TTabs)
	local TB = Instance.new("TextButton",Tab)
	local tab = Instance.new("Frame",MUI)
	local table = {}
	function table:Button(text,func)
		func = func or function() end
		local hdf = Instance.new("ImageLabel",tab)
		local b = Instance.new("TextButton",hdf)
		hdf.Name = "Tab"
		hdf.Active = true
		hdf.BackgroundTransparency = 1.000
		hdf.BorderSizePixel = 0
		hdf.Image = "rbxassetid://1307995459"
		hdf.ImageColor3 = Color3.fromRGB(20, 20, 20)
		hdf.ScaleType = Enum.ScaleType.Slice
		hdf.SliceCenter = Rect.new(2, 2, 254, 254)
		b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		b.BackgroundTransparency = 1.000
		b.BorderSizePixel = 0
		b.Size = UDim2.new(1, 0, 1, 0)
		b.ZIndex = 2
		b.Font = Enum.Font.GothamSemibold
		b.Text = text
		b.TextColor3 = Color3.fromRGB(255, 255, 255)
		b.TextSize = 14.000
		b.TextWrapped = true
		hdf.Size = UDim2.new(0,(b.TextBounds.X+15),0,17)
		ripple(b,Mouse.X,Mouse.Y)
		b.MouseButton1Click:Connect(func)
	end

	Tab.Name = "Tab"
	Tab.Active = true
	Tab.BackgroundTransparency = 1.000
	Tab.BorderSizePixel = 0
	Tab.Size = UDim2.new(0, 75, 1, 0)
	Tab.Image = "rbxassetid://1307995459"
	Tab.ImageColor3 = Color3.fromRGB(20, 20, 20)
	Tab.ScaleType = Enum.ScaleType.Slice
	Tab.SliceCenter = Rect.new(2, 2, 254, 254)

	TB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TB.BackgroundTransparency = 1.000
	TB.BorderSizePixel = 0
	TB.Size = UDim2.new(1, 0, 1, 0)
	TB.ZIndex = 2
	TB.Font = Enum.Font.GothamSemibold
	TB.Text = name
	TB.TextColor3 = Color3.fromRGB(255, 255, 255)
	TB.TextSize = 14.000
	TB.TextWrapped = true
	ripple(TB,Mouse.X,Mouse.Y)
	
	tab.Name = 'tab'..math.random(1,math.random(500,9999))
	tab.BackgroundTransparency = 1
	tab.Position = UDim2.new(0.015,0,0.214,0)
	tab.Size = UDim2.new(0,566,0,202)

	TB.MouseButton1Click:Connect(function()
		for i,v in next, MUI:GetChildren() do
			if string.find(v.Name,'tab') then
				v.Visible = false
			end
		end
		tab.Visible = true
	end)
	return table
end
local test = createTab('Test1')
test:Button('Print test',function()
	print('Test')
end)
test:Button('Kick self',function()
	LP:Kick('Test')
end)
local test2 = createTab('Test2')
test2:Button('Kill Self',function()
	Hum.Health = 0
end)

LIUI = game:GetObjects('rbxassetid://5456804084')[1]
MUI = game:GetObjects('rbxassetid://5457552891')[1]
LIUI.Parent = SG
dragify(LIUI)
dragify(MUI)

LIUI.submit.TextButton.MouseButton1Click:Connect(function()
	local returned = loadstring(game:HttpGet('https://0x02342054689kf3i5g35g9.000webhostapp.com/check.php?key='..LIUI.KEY.TextBox.Text))()
	if returned == 'Not Whitelisted' then
		wait(1)
		LP:Kick('Invalid key detected.')
	elseif returned == 'Whitelisted' then
		wait(1)
		MUI.Parent = SG
	end
end)
