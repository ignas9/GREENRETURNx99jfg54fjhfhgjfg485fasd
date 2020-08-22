local allowedexploits = issentinelclosure or syn or is_synapse_function or KRNL_LOADED
local CG = game:GetService("CoreGui")
local SG = Instance.new("ScreenGui",CG)
SG.ResetOnSpawn = false
local UIS = game:GetService("UserInputService")
local TWS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local LP = game.Players.LocalPlayer
local Char = LP.Character
local Hum = Char:WaitForChild('Humanoid')
local Mouse = LP:GetMouse()
local LIUI = game:GetObjects('rbxassetid://5456804084')[1]
LIUI.KEY.TextBox.Text = _G.__key__ or ''
if not allowedexploits then LP:Kick('This exploit is not supported in GR! Supported exploits : Sentinel,Synapse,Krnl (prob broken)') end
local function startLIBversion(keyEntered)
	local key = game:HttpGet('https://0x02342054689kf3i5g35g9.000webhostapp.com/check.php?key='..keyEntered)
	if key == 'Whitelisted' then
        local UILIB = loadstring(game:HttpGet('https://pastebin.com/raw/zH17BK2a'))()
        UIS.InputBegan:Connect(function(input,istext)
            if not istext then
                if input.KeyCode == Enum.KeyCode.RightControl then
                    UILIB.gui.Enabled = not UILIB.gui.Enabled
                end
            end
        end)
        local function modgun(t)
            t=t or {}
            local z = 'BaseDamage'
            for i,v in next, getgc(true) do
                if type(v)=='table'and rawget(v,z) then
                    for n,j in next, t do
                        v[n]=j
                    end
                end
            end
        end
        local function killUser(name)
            print(name)
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
        local function shortname(nameString)
            local matches = {}
            for i,v in pairs(game:GetService('Players'):GetChildren()) do
                if string.string.match(v.Name:lower(),nameString:lower()) then
                    table.insert(matches,v.Name)
                end
            end
            if #matches == 1 then
                return matches[1]
            else
                return ''
            end
        end
		local function gunmod()
            local v = {}
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
			v.RecoilSpeed = 0
            v.LifeSteal = 1000000000
            modgun(v)
		end
		local function nukemod()
			local v = {}
			v.Spread = 0
			v.AmmoPerMag = math.huge
			v.FireRate= 0
			v.BaseDamage = math.huge
			v.Auto = true
			v.ReloadTime = 0
			v.CameraShakingEnabled = false
			v.Recoil = 0
			v.AngleX = 0
			v.AngleY = 0
			v.Spread = 0
			v.RecoilRedution = 0
			v.RecoilSpeed = 0
			v.LifeSteal = 1000000000
			v.Radius = 1000000000
            v.ExplosiveEnabled = true
            modgun(v)
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
		local killaura = false
		local Cheats = UILIB:CreateWindow({text = 'Cheats'})
		local Trolls = UILIB:CreateWindow({text = 'Trolls'})
		local Abusive = UILIB:CreateWindow({text = 'AbusiveScripts'})
		local Misc = UILIB:CreateWindow({text = 'FriendlyScripts'})
		local Credits = UILIB:CreateWindow({text = 'Creditst'})
		spawn(function()
			RS.RenderStepped:Connect(function()
				for i,v in next,loopedkilled do
					if v=='looped'then
						killUser(i)
					end
				end
			end)
        end)
        local function closestTarget(dist)
            local target = nil
            for i,v in next, game.Players:GetPlayers() do
                local enemychar = v.Character
                if enemychar then
                    local hd = enemychar:FindFirstChild('Head')
                    if (Char.Head.Position - hd.Position) and enemychar.Humanoid.Health > 0 then
                        target = enemychar
                    end
                end
            end
            return target
        end
		RS.RenderStepped:Connect(function()
			if killaura == true then
                local tar = closestTarget(8)
                killUser(tar)
			end
		end)
		Credits:AddLabel('Wally: UI Lib\nHitury: Web based stuff\nscripter man: Scripting\nPress RightCtrl to toggle gui!')
		Cheats:AddButton('gunmod',function()
			gunmod()
		end)
		Misc:AddBox('UnLoopKill',function(obj,foc)
			if foc then
				loopedkilled[shortname(obj.Text)] = 'not looped'
			end
		end)
		Abusive:AddToggle('KillAura',function(st)
            killaura = not killaura
            print(killaura)
		end)
		Abusive:AddButton('KillAll',function()
			for i,v in next,game.Players:GetPlayers() do
				if v.Character then
					killUser(v.Name)
				end
			end
		end)
		Abusive:AddBox('LoopKill',function(obj,foc)
			if foc then
				loopedkilled[shortname(obj.Text)] = 'looped'
			end
		end)
		Trolls:AddBox('Kill User',function(obj,foc)
			if foc then
				killUser(shortname(obj.Text))
				obj.Text=''
			end
		end)
		Trolls:AddBox('Heal User',function(obj,foc)
			if foc then
				healUser(shortname(obj.Text))
				obj.Text=''
			end
		end)
		Trolls:AddBox('Bat User',function(obj,foc)
			if foc then
				batUser(shortname(obj.Text))
				obj.Text=''
			end
		end)
		Abusive:AddButton('nukemod',function()
			nukemod()
		end)
		Cheats:AddButton('No Spread',function()
            local v = {}
            v.Spread = 0
            modgun(v)
		end)
		Cheats:AddButton('No Recoil',function()
            local v = {}
            v.CameraShakingEnabled = false
			v.Recoil = 0
			v.AngleX = 0
			v.AngleY = 0
			v.RecoilRedution = 0
            v.RecoilSpeed = 0
            modgun(v)
		end)
		Cheats:AddButton('Infinite Ammo',function()
			local v = {}
            v.AmmoPerMag = math.huge
            modgun(v)
		end)
		Cheats:AddButton('Instant Damage',function()
            local v = {}
            v.BaseDamage = math.huge
            modgun(v)
		end)
		Cheats:AddButton('RapidFire',function()
            local v = {}
            v.Auto = true
            v.FireRate = 0
            modgun(v)
		end)
		Cheats:AddButton('No ReloadTime',function()
            local v = {}
            v.ReloadTime = 0
            modgun(v)
		end)
	else
		LP:Kick('Invalid key detected.')
	end
end

function dragify(Frame)
	local UIS = game:GetService("UserInputService")
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
	local cz = LIUI.KEY.TextBox.Text
	local key = game:HttpGet('https://0x02342054689kf3i5g35g9.000webhostapp.com/check.php?key='..cz)
	if key == 'Not Whitelisted' then
		wait(1)
		LP:Kick('Invalid key detected.')
	elseif key == 'Whitelisted' then
		LIUI:remove()
		wait(1)
		startLIBversion(cz)
	end
end)
