local function triggerRandomEvent()
	local randomIndex = math.random(1,5)
	local xRandomIndex = math.random()
	local yRandIndex = math.random()
	local zRandIndex = math.random()
	
	if randomIndex == 3 then
		local leaf = Instance.new("Part")
		leaf.BrickColor = BrickColor.new("Tr. Green")
		leaf.Parent = workspace.leafSpawArea
		print("Leaf spawned")
	else	
		print("No leaf spawned")
	end
end

while true do 
	triggerRandomEvent()
	wait(1)
end