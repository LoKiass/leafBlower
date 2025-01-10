local leafSpawnArea = workspace:WaitForChild("leafSpawnArea")
local maxLeaf = 30
local minLeaf = 0

function triggerRandomEvent()
	local minX, maxX, minZ, maxZ = limiteOfSpawnArea()
	local randomIndex = math.random(1, 1)
	
	if randomIndex == 1 then
		if minLeaf < maxLeaf then
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

			minLeaf = minLeaf + 1
		end	
	end
end

function limiteOfSpawnArea()
	local leafSpawnAreaPosition = leafSpawnArea.Position
	local leafSpawnAreaSize = leafSpawnArea.Size

	local minX = (leafSpawnAreaPosition.X - leafSpawnAreaSize.X / 2) + 5
	local maxX = (leafSpawnAreaPosition.X + leafSpawnAreaSize.X / 2) - 5
	local minZ = (leafSpawnAreaPosition.Z - leafSpawnAreaSize.Z / 2) + 5
	local maxZ = (leafSpawnAreaPosition.Z + leafSpawnAreaSize.Z / 2) - 5

	return minX, maxX, minZ, maxZ
end

while true do 
	triggerRandomEvent()
	wait(1)	
end




