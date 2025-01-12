local inventoryButton = script.Parent
local inventoryFrame = script.Parent.Parent:WaitForChild("Frame")
local handButton = script.Parent.Parent.Frame.handButton
local rakeButton = script.Parent.Parent.Frame.rakeButton
local largeRakeButton = script.Parent.Parent.Frame.largeRakeButton
local blowerButton = script.Parent.Parent.Frame.blowerButton

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local handInstance = player:WaitForChild("handType")
local rakeInstance = player:WaitForChild("rakeType")
local largeRakeInstance = player:WaitForChild("largeRakeType")
local blowerInstance = player:WaitForChild("blowerType")

inventoryFrame.Visible = false  -- Initialement, la fenêtre de l'inventaire est cachée
handButton.Visible = false  -- Le bouton de la main est également caché au départ

-- Gestion du clic sur le bouton d'inventaire pour afficher ou masquer l'inventaire
inventoryButton.MouseButton1Down:Connect(function()
	if inventoryFrame.Visible == false then 
		inventoryFrame.Visible = true 
		handButton.Visible = true  -- Affiche le bouton de la main lorsque l'inventaire est visible
	else
		inventoryFrame.Visible = false
		handButton.Visible = false  -- Masque le bouton de la main lorsque l'inventaire est masqué
	end
end)

-- Fonction d'équipement de la main
handButton.MouseButton1Down:Connect(function()
	if handInstance.Value == true then  -- Vérifie si la main est équipée
		local blowerHitBox = workspace:WaitForChild("blowerHitBox") 
		local blowerX, blowerY, blowerZ = 3, 1, 3  -- Taille du hitbox de la main
		blowerHitBox.Size = Vector3.new(blowerX, blowerY, blowerZ)
		handButton.TextColor = BrickColor.new("Tr. Green")  -- Indique que la main est équipée
		handButton.Text = "Hand Equipped"

		-- Réinitialise les autres boutons
		rakeButton.TextColor = BrickColor.new("Black")
		rakeButton.Text = "Rake"
		largeRakeButton.TextColor = BrickColor.new("Black")
		largeRakeButton.Text = "Large Rake"
		blowerButton.TextColor = BrickColor.new("Black")
		blowerButton.Text = "blower"
	else
		handButton.TextColor = BrickColor.new("Really red")  -- Erreur si la main n'est pas achetée
		handButton.Text = "Purchassed it first !"
		task.wait(2)  -- Attendre 2 secondes avant de réinitialiser
		handButton.TextColor = BrickColor.new("Black")
		handButton.Text = "Hand"
	end
end)

-- Fonction d'équipement du râteau
rakeButton.MouseButton1Down:Connect(function()
	if rakeInstance.Value == true then  -- Vérifie si le râteau est équipé
		local blowerHitBox = workspace:WaitForChild("blowerHitBox") 
		local blowerX, blowerY, blowerZ = 4, 1, 4  -- Taille du hitbox du râteau
		blowerHitBox.Size = Vector3.new(blowerX, blowerY, blowerZ)
		rakeButton.TextColor = BrickColor.new("Tr. Green")  -- Indique que le râteau est équipé
		rakeButton.Text = "rake Equipped"

		-- Réinitialise les autres boutons
		handButton.TextColor = BrickColor.new("Black")
		handButton.Text = "Hand"
		largeRakeButton.TextColor = BrickColor.new("Black")
		largeRakeButton.Text = "Large Rake"
		blowerButton.TextColor = BrickColor.new("Black")
		blowerButton.Text = "blower"
	else
		rakeButton.TextColor = BrickColor.new("Really red")  -- Erreur si le râteau n'est pas acheté
		rakeButton.Text = "Purchassed it first !"
		task.wait(2)
		rakeButton.TextColor = BrickColor.new("Black")
		rakeButton.Text = "Rake"
	end
end)

-- Fonction d'équipement du grand râteau
largeRakeButton.MouseButton1Down:Connect(function()
	if largeRakeInstance.Value == true then  -- Vérifie si le grand râteau est équipé
		local blowerHitBox = workspace:WaitForChild("blowerHitBox") 
		local blowerX, blowerY, blowerZ = 5, 1, 5  -- Taille du hitbox du grand râteau
		blowerHitBox.Size = Vector3.new(blowerX, blowerY, blowerZ)
		largeRakeButton.TextColor = BrickColor.new("Tr. Green")  -- Indique que le grand râteau est équipé
		largeRakeButton.Text = "Large Rake Equipped"

		-- Réinitialise les autres boutons
		handButton.TextColor = BrickColor.new("Black")
		handButton.Text = "Hand"
		rakeButton.TextColor = BrickColor.new("Black")
		rakeButton.Text = "Rake"
		blowerButton.TextColor = BrickColor.new("Black")
		blowerButton.Text = "blower"
	else
		largeRakeButton.TextColor = BrickColor.new("Really red")  -- Erreur si le grand râteau n'est pas acheté
		largeRakeButton.Text = "Purchassed it first !"
		task.wait(2)
		largeRakeButton.TextColor = BrickColor.new("Black")
		largeRakeButton.Text = "Large Rake"
	end
end)

-- Fonction d'équipement du souffleur
blowerButton.MouseButton1Down:Connect(function()
	if blowerInstance.Value == true then  -- Vérifie si le souffleur est équipé
		local blowerHitBox = workspace:WaitForChild("blowerHitBox") 
		local blowerX, blowerY, blowerZ = 7, 1, 7  -- Taille du hitbox du souffleur
		blowerHitBox.Size = Vector3.new(blowerX, blowerY, blowerZ)
		blowerButton.TextColor = BrickColor.new("Tr. Green")  -- Indique que le souffleur est équipé
		blowerButton.Text = "blower Equipped"

		-- Réinitialise les autres boutons
		handButton.TextColor = BrickColor.new("Black")
		handButton.Text = "Hand"
		rakeButton.TextColor = BrickColor.new("Black")
		rakeButton.Text = "Rake"
		largeRakeButton.TextColor = BrickColor.new("Black")
		largeRakeButton.Text = "Large Rake"
	else
		blowerButton.TextColor = BrickColor.new("Really red")  -- Erreur si le souffleur n'est pas acheté
		blowerButton.Text = "Purchassed it first !"
		task.wait(2)
		blowerButton.TextColor = BrickColor.new("Black")
		blowerButton.Text = "blower"
	end
end)
