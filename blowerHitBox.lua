local Players = game:GetService("Players")
local groundLevelY = 0

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local blowerHitBox = Instance.new("Part")
		blowerHitBox.Transparency = 0
		blowerHitBox.BrickColor = BrickColor.new("Really red")
		blowerHitBox.Name = "blowerHitBox"
		blowerHitBox.Parent = workspace
		blowerHitBox.Anchored = true
		blowerHitBox.CanCollide = true
		blowerHitBox.Size = Vector3.new(3, 2, 3)

		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		local humanoid = character:WaitForChild("Humanoid")

		while humanoidRootPart and humanoid.Health > 0 do
			local lookDirection = humanoidRootPart.CFrame.LookVector
			local newPosition = humanoidRootPart.Position + lookDirection * 6

			newPosition = Vector3.new(newPosition.X, groundLevelY, newPosition.Z)

			blowerHitBox.Position = newPosition
			blowerHitBox.CFrame = CFrame.new(newPosition, newPosition + lookDirection)

			task.wait(0) 
		end
	end)
end)