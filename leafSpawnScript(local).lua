-- Script pout le créations des feuilles en fonction d'un pourcentage de chance
local leafSpawnArea = workspace.Area:WaitForChild("leafSpawnArea")
local maxLeaf = 30

-- Créations de l'instance ActualLeaf pour effectuer des calcule ou modification de valeur
local actualLeaf = Instance.new("IntValue")
actualLeaf.Name = "actualLeaf"
actualLeaf.Parent = game.Workspace:WaitForChild("leafFolderPart")
actualLeaf.Value = 0

-- Fonction random qui permet ou non de faire appataître une feuille
function triggerRandomEvent()
	local minX, maxX, minZ, maxZ = limiteOfSpawnArea()
	local randomIndex = math.random(1, 10)
	
	if randomIndex == 1 then
		if actualLeaf.Value < maxLeaf then
			local leaf = Instance.new("Part")
			leaf.Size = Vector3.new(1, 0.5, 1) 
			leaf.BrickColor = BrickColor.new("Tr. Green")
			leaf.Anchored = false
			leaf.Name = "Leaf"
			leaf.CanCollide = true

			local randomX = math.random(minX, maxX)
			local randomZ = math.random(minZ, maxZ)
			local yPosition = leafSpawnArea.Position.Y + 10

			leaf.Position = Vector3.new(randomX, yPosition, randomZ)
			leaf.Parent = workspace:WaitForChild("leafFolderPart")

			actualLeaf.Value = actualLeaf.Value + 1
		end	
	end
end

-- Fonction permetant de determiner la taille de la zone du spawn des feuille (Operation arytmétique)
function limiteOfSpawnArea()
	local leafSpawnAreaPosition = leafSpawnArea.Position
	local leafSpawnAreaSize = leafSpawnArea.Size

	local minX = (leafSpawnAreaPosition.X - leafSpawnAreaSize.X / 2) + 3
	local maxX = (leafSpawnAreaPosition.X + leafSpawnAreaSize.X / 2) - 3
	local minZ = (leafSpawnAreaPosition.Z - leafSpawnAreaSize.Z / 2) + 3
	local maxZ = (leafSpawnAreaPosition.Z + leafSpawnAreaSize.Z / 2) - 3

	return minX, maxX, minZ, maxZ
end

while true do 
	triggerRandomEvent()
	wait(0)	
end




