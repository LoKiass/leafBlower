local blowerHitBox = Instance.new("Part") -- Creation d'un object près du joueur
local Players = game:GetService("Players") -- Recuperer le service joueur
blowerHitBox.Transparency = 0 -- Paramètre de transparence de la hitbox
blowerHitBox.BrickColor = BrickColor.new("Really red") -- Manière actuelle de verifier ou la hitbox ce promènne
blowerHitBox.Parent = workspace 
blowerHitBox.Anchored = true -- Pour que le bloc grade des position X,Y,Z stable
blowerHitBox.CanCollide = false -- Manière de ne pas collide avec le joueurs

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart") -- Recuper les partie du joueur 
		local humanoid = character:WaitForChild("Humanoid") -- Recuper l'object humanoid 

		while humanoidRootPart and humanoid.Health > 0 do -- Si est en vie et que humanoidRootPart existe
			local lookDirection = humanoidRootPart.CFrame.LookVector 
			local newPosition = humanoidRootPart.Position + lookDirection * 5 

			blowerHitBox.Position = newPosition
			blowerHitBox.CFrame = CFrame.new(newPosition, newPosition + lookDirection) 
			
			task.wait(0) 
		end
	end)
end)

-- EN/US : Problem to solve : 
-- Refresh time is very low, any optimisation for the code ?