-- Script s'occupant de la zone de collisions du Blower pour la première fois ! (Lors de la connection)
local Players = game:GetService("Players")
local groundLevelY = 0

-- Création du StringValue pour garder la trace du type de blower
local blowerTypeValue = Instance.new("StringValue")
blowerTypeValue.Name = "blowerType"
blowerTypeValue.Parent = workspace
blowerTypeValue.Value = "Hand"

-- Fonction pour obtenir les dimensions du blower en fonction du type
local function getBlowerDimensions()  
	local blowerX, blowerY, blowerZ = 0, 0, 0

	if blowerTypeValue.Value == "Hand" then
		blowerX = 3
		blowerY = 1
		blowerZ = 3
	elseif blowerTypeValue.Value == "Rake" then
		blowerX = 4
		blowerY = 1
		blowerZ = 4
	elseif blowerTypeValue.Value == "LargeRake" then
		blowerX = 5
		blowerY = 1
		blowerZ = 5
	elseif blowerTypeValue.Value == "Blower" then
		blowerX = 7
		blowerY = 1
		blowerZ = 7
	end
	return blowerX, blowerY, blowerZ
end


local player = Players.LocalPlayer
player.CharacterAdded:Connect(function(character)
	local blowerX, blowerY, blowerZ = getBlowerDimensions()  -- Caller la fonction pour obtenir les dimensions

	-- Création de la hitbox pour le blower
	local blowerHitBox = Instance.new("Part")
	blowerHitBox.Transparency = 0.5 
	blowerHitBox.BrickColor = BrickColor.new("Really red")
	blowerHitBox.Name = "blowerHitBox"
	blowerHitBox.Parent = workspace
	blowerHitBox.Anchored = true
	blowerHitBox.CanCollide = false
	blowerHitBox.Size = Vector3.new(blowerX, blowerY, blowerZ) -- Utiliser les dimensions calculées
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local humanoid = character:WaitForChild("Humanoid")

	-- Déplacer la hitbox en fonction du personnage
	while humanoid.Health > 0 and humanoidRootPart do
		local lookDirection = humanoidRootPart.CFrame.LookVector
		local newPosition = humanoidRootPart.Position + lookDirection * 6
		newPosition = Vector3.new(newPosition.X, groundLevelY, newPosition.Z)

		blowerHitBox.Position = newPosition
		blowerHitBox.CFrame = CFrame.new(newPosition, newPosition + lookDirection)

		task.wait(0.1)
	end

end)


