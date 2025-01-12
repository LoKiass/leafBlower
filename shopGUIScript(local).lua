local shopButton = script.Parent
local ShopFrame = script.Parent.Parent:WaitForChild("Frame")
local handButton = script.Parent.Parent.Frame.handUpgradeButton
local rakeButton = script.Parent.Parent.Frame.rakeUpgradeButton
local largeRakeButton = script.Parent.Parent.Frame.largeRakeUpgradeButton
local blowerButton = script.Parent.Parent.Frame.blowerUpgradeButton

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local leaderstats = player:WaitForChild("leaderstats")
local stat = leaderstats:WaitForChild("Leaf")

local handInstance = player:WaitForChild("handType")
local rakeInstance = player:WaitForChild("rakeType")
local largeRakeInstance = player:WaitForChild("largeRakeType")
local blowerInstance = player:WaitForChild("blowerType")

ShopFrame.Visible = false

-- Toggle visibility of shop frame when clicking the shop button
shopButton.MouseButton1Down:Connect(function()
	if ShopFrame.Visible == false then 
		ShopFrame.Visible = true 
	else
		ShopFrame.Visible = false
	end
end)

-- Handle purchase for Hand upgrade
handButton.MouseButton1Down:Connect(function()
	if stat.Value >= 0 then
		handInstance.Value = true  -- Activate hand upgrade
		stat.Value = stat.Value - 0  -- Subtract currency (value 0, so no change)
		handButton.TextColor = BrickColor.new("Tr. Green")  -- Change text color to green
		handButton.Text = "Hand purchassed !"  -- Indicate purchase success
	else
		handButton.TextColor = BrickColor.new("Tr. Red")  -- Show error (red)
		handButton.Text = "You don't have enought"  -- Not enough currency
		task.wait(2)  -- Wait for 2 seconds
		handButton.TextColor = BrickColor.new("Black")  -- Reset text color
		handButton.Text = "Hand"  -- Reset button text
	end
end)

-- Handle purchase for Rake upgrade
rakeButton.MouseButton1Down:Connect(function()
	if stat.Value >= 30 then
		rakeInstance.Value = true  -- Activate rake upgrade
		stat.Value = stat.Value - 30  -- Subtract currency (30)
		rakeButton.TextColor = BrickColor.new("Tr. Green")  -- Success
		rakeButton.Text = "rake purchassed !"  -- Indicate purchase
	else
		rakeButton.TextColor = BrickColor.new("Tr. Red")  -- Show error
		rakeButton.Text = "You don't have enought"  -- Not enough currency
		task.wait(2)  -- Wait for 2 seconds
		rakeButton.TextColor = BrickColor.new("Black")  -- Reset
		rakeButton.Text = "rake"  -- Reset button text
	end
end)

-- Handle purchase for Large Rake upgrade
largeRakeButton.MouseButton1Down:Connect(function()
	if stat.Value >= 150 then
		largeRakeInstance.Value = true  -- Activate large rake upgrade
		stat.Value = stat.Value - 150  -- Subtract currency (150)
		largeRakeButton.TextColor = BrickColor.new("Tr. Green")  -- Success
		largeRakeButton.Text = "Large Rake purchassed !"  -- Indicate purchase
	else
		largeRakeButton.TextColor = BrickColor.new("Tr. Red")  -- Error (insufficient funds)
		largeRakeButton.Text = "You don't have enought"  -- Not enough currency
		task.wait(2)  -- Wait for 2 seconds
		largeRakeButton.TextColor = BrickColor.new("Black")  -- Reset text color
		largeRakeButton.Text = "Large Rake"  -- Reset button text
	end
end)

-- Handle purchase for Blower upgrade
blowerButton.MouseButton1Down:Connect(function()
	if stat.Value >= 500 then
		blowerInstance.Value = true  -- Activate blower upgrade
		stat.Value = stat.Value - 500  -- Subtract currency (500)
		blowerButton.TextColor = BrickColor.new("Tr. Green")  -- Success
		blowerButton.Text = "blower purchassed !"  -- Indicate purchase
	else
		blowerButton.TextColor = BrickColor.new("Tr. Red")  -- Error (insufficient funds)
		blowerButton.Text = "You don't have enought"  -- Not enough currency
		task.wait(2)  -- Wait for 2 seconds
		blowerButton.TextColor = BrickColor.new("Black")  -- Reset text color
		blowerButton.Text = "blower"  -- Reset button text
	end
end)
