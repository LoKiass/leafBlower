game.Players.PlayerAdded:Connect(function(player) -- stat du joueur :
	local leaderstat = Instance.new("Folder")
	leaderstat.Name = "leaderstats"
	leaderstat.Parent = player

	local leaf = Instance.new("IntValue")
	leaf.Name = "Leaf"
	leaf.Parent = leaderstat
	leaf.Value = 0 
end)