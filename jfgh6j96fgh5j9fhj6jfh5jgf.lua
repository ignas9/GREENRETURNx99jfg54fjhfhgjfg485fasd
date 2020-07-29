local CG = game:GetService("CoreGui")
local SG = Instance.new("ScreenGui",CG)
SG.ResetOnSpawn = false

local UI = game:GetObjects('rbxassetid://5456804084')[1]
UI.Parent = SG

UI.submit.TextButton.MouseButton1Click:Connect(function()
	local returned = loadstring(game:HttpGet('https://0x02342054689kf3i5g35g9.000webhostapp.com/check.php?key='..UI.KEY.TextBox.Text))
	game.Players.LocalPlayer:Kick(returned)
end)
