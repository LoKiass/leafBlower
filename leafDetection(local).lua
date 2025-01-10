local Players = game:GetService("Players")
local leafFolder = game.Workspace:WaitForChild("leafFolderPart")
local blowerHitBox = game.Workspace:WaitForChild("blowerHitBox")
local debounce = false
local earningArea = game.Workspace:WaitForChild("earningArea")

function leafOnEarningArea()
	for _, leaf in ipairs(leafFolder:GetChildren()) do
		if leaf:IsA("BasePart") and leaf.Name == "Leaf" then
			leaf.Touched:Connect(function(hit)
				if hit == earningArea then
					if debounce == false then
						debounce = true
						leaf:Destroy()
						getStat()
						debounce = false
					end
				end
			end)
		end
	end
end

function checkColisionWithBlower()
	for _, leaf in ipairs(leafFolder:GetChildren()) do
		if leaf:IsA("BasePart") and leaf.Name == "Leaf" then
			leaf.Touched:Connect(function(hit)
				if hit == blowerHitBox then
					if debounce == false then
						debounce = true 
						local direction = (leaf.Position - blowerHitBox.Position).Unit
						leaf.AssemblyLinearVelocity = direction * 50 -- Expulse la feuille
						task.wait(0)
						debounce = false
					end
				end
			end)
		end
	end
end
function getStat()
	local player = Players.LocalPlayer
	local leaderstats = player:WaitForChild("leaderstats")
	local stat = leaderstats:WaitForChild("Leaf")
	task.wait(0)
	stat.Value += 1
	return
end

while true do
	checkColisionWithBlower()
	leafOnEarningArea()
	task.wait(0) -- Boucle rapide
end