-- Script qui s'occupe du bouton pour mettre à jour la taille de la hitbox du blower en fonction de son upgrade

local button = script.Parent

local blowerTypeValue = workspace:WaitForChild("blowerType") 

local player = game.Players.LocalPlayer
local leaderstats = player:WaitForChild("leaderstats")
local stat = leaderstats:WaitForChild("Leaf")

local groundLevelY = 0



button.MouseButton1Down:Connect(function()
	local blowerHitBox = workspace:WaitForChild("blowerHitBox") 
	
	if stat.Value >= 0 then
		local blowerX, blowerY, blowerZ = 7, 1, 7
		blowerHitBox.Size = Vector3.new(blowerX, blowerY, blowerZ)
		blowerTypeValue.Value = "Blower"  
		button.TextColor = BrickColor.new("Really red")
		stat.Value = stat.Value - 5
		task.wait(2)	
	end

end)

