local allowedexploits = issentinelclosure or syn or is_synapse_function or KRNL_LOADED
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
local LIUI = game:GetObjects('rbxassetid://5456804084')[1]
if not allowedexploits then LP:Kick('This exploit is not supported in GR! Supported exploits : Sentinel,Synapse,Krnl (prob broken)') end
local function startLIBversion(keyEntered)
	local key = game:HttpGet('https://0x02342054689kf3i5g35g9.000webhostapp.com/check.php?key='..keyEntered)
	if key == 'Whitelisted' then
		local UILIB = loadstring(game:HttpGet('https://raw.githubusercontent.com/Kiwi-i/wallys-ui-fork/master/lib.lua'))()
		local function killUser(name)
			local A_1 = 999999999
			local A_2 = game.Players[name].Character
			local A_3 = {game.Players.LocalPlayer}
			local A_4 = {
				["nightTimeMin"] = 0, 
				["stealRange"] = 0, 
				["percentageDamage"] = 0, 
				["animFrames"] = 0, 
				["nightTimeMax"] = 0, 
				["defaultBubbleRadius"] = 0, 
				["veloTime"] = 0, 
				["veloSpeed"] = 0, 
				["healRange"] = 0, 
				["percentageHeal"] = 0, 
				["cooldowns"] = {["E"] = 0, ["G"] =0, ["F"] = 0}}
			local Event = game:GetService("ReplicatedStorage").RemoteFunctions.HealBall
			Event:FireServer(A_1, A_2, A_3, A_4)
		end
		local function healUser(name)
			local A_1 = -999999999
			local A_2 = game.Players[name].Character
			local A_3 = {game.Players.LocalPlayer}
			local A_4 = {
				["nightTimeMin"] = 0, 
				["stealRange"] = 0, 
				["percentageDamage"] = 0, 
				["animFrames"] = 0, 
				["nightTimeMax"] = 0, 
				["defaultBubbleRadius"] = 0, 
				["veloTime"] = 0, 
				["veloSpeed"] = 0, 
				["healRange"] = 0, 
				["percentageHeal"] = 0, 
				["cooldowns"] = {["E"] = 0, ["G"] =0, ["F"] = 0}}
			local Event = game:GetService("ReplicatedStorage").RemoteFunctions.HealBall
			Event:FireServer(A_1, A_2, A_3, A_4)
		end
		local function gunmod()
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v,"FireRate") then
					v.Spread = 0
					v.AmmoPerMag = 9999
					v.FireRate= 00.00
					v.BaseDamage = math.huge
					v.Auto = true
					v.ReloadTime = 0
					v.CameraShakingEnabled = false
					v.Recoil = 0
					v.AngleX = 0
					v.AngleY = 0
					v.Spread = 0
					v.RecoilRedution = 0
					v.RecoilSpeed = 0.01
					v.LifeSteal = 1000000000
				end
			end
		end
		local function nukemod()
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v,"FireRate") then
					v.Spread = 0
					v.AmmoPerMag = 9999
					v.FireRate= 00.00
					v.BaseDamage = math.huge
					v.Auto = true
					v.ReloadTime = 0
					v.CameraShakingEnabled = false
					v.Recoil = 0
					v.AngleX = 0
					v.AngleY = 0
					v.Spread = 0
					v.RecoilRedution = 0
					v.RecoilSpeed = 0.01
					v.LifeSteal = 1000000000
					v.Radius = 1000000000
					v.ExplosiveEnabled = true
				end
			end
		end
		local function batUser(name)
			local A_1 = game.Players[name].Character
			local A_2 = 
			{
				["nightTimeMin"] = 20, 
				["stealRange"] = 40, 
				["percentageDamage"] = 0.35, 
				["animFrames"] = 24, 
				["nightTimeMax"] = 8, 
				["defaultBubbleRadius"] = 12, 
				["veloTime"] = 0.35, 
				["veloSpeed"] = 60, 
				["healRange"] = 12, 
				["percentageHeal"] = 0.5, 
				["cooldowns"] = 
				{
					["E"] = 1.5, 
					["G"] = 1.5, 
					["F"] = 1.5
				}
			}
			local Event = game:GetService("ReplicatedStorage").RemoteFunctions.BatBlink
			Event:FireServer(A_1, A_2)
		end
		local loopedkilled = {}
		local loopedbatted = {}
		local loopedhealed = {}
		local Cheats = UILIB:CreateWindow('Cheats')
		Cheats:Section('Weapon Cheats')
		Cheats:Button('gunmod',function()
			gunmod()
		end)
		Cheats:Button('nukemod',function()
			nukemod()
		end)
	else
		LP:Kick('Incorrect key detected.')
	end
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

dragify(LIUI)

LIUI.Parent = SG

LIUI.submit.TextButton.MouseButton1Click:Connect(function()
	local key = game:HttpGet('https://0x02342054689kf3i5g35g9.000webhostapp.com/check.php?key='..LIUI.KEY.TextBox.Text)
	if key == 'Not Whitelisted' then
		wait(1)
		LP:Kick('Invalid key detected.')
	elseif key == 'Whitelisted' then
		LIUI:remove()
		wait(1)
		startLIBversion(LIUI.KEY.TextBox.Text)
	end
end)
