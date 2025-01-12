-- Script s'occupant de la zone de collisions du Blower pour la première fois ! (Lors de la connexion)
local Players = game:GetService("Players")
local player = Players.LocalPlayer  -- Référence au joueur local
local groundLevelY = 0  -- Niveau Y pour ancrer la hitbox au sol (évite de faire monter ou descendre la hitbox)

-- Référence aux types d'objets du joueur (main, râteau, grand râteau, souffleur)
local handType = player:WaitForChild("handType")
local rakeType = player:WaitForChild("rakeType")
local largeRakeType = player:WaitForChild("largeRakeType")
local blowerType = player:WaitForChild("blowerType")

-- Quand le personnage du joueur est chargé (après la connexion ou la réapparition)
player.CharacterAdded:Connect(function(character)
	-- Déclaration des dimensions de la hitbox du souffleur
	local blowerX; local blowerY; local blowerZ

	-- Création de la hitbox du souffleur
	local blowerHitBox = Instance.new("Part")
	blowerHitBox.Transparency = 0.5  -- La hitbox est semi-transparente
	blowerHitBox.BrickColor = BrickColor.new("Really red")  -- Couleur de la hitbox (rouge)
	blowerHitBox.Name = "blowerHitBox"
	blowerHitBox.Parent = workspace  -- Ajout de la hitbox dans le workspace
	blowerHitBox.Anchored = true  -- La hitbox est ancrée et ne bougera pas toute seule
	blowerHitBox.CanCollide = false  -- La hitbox ne crée pas de collision avec d'autres objets

	-- Logique pour définir la taille de la hitbox en fonction de l'équipement du joueur
	if handType.Value == true then
		print("Hand type")  -- Affiche dans la console si le joueur a la main équipée
		local blowerX = 3
		local blowerY = 1
		local blowerZ = 3
		blowerHitBox.Size =  Vector3.new(blowerX, blowerY, blowerZ)  -- Taille de la hitbox pour la main
	elseif rakeType.Value == true then
		print("rake type")  -- Affiche si le joueur a un râteau équipé
		local blowerX = 4
		local blowerY = 1
		local blowerZ = 4
		blowerHitBox.Size =  Vector3.new(blowerX, blowerY, blowerZ)  -- Taille pour le râteau
	elseif largeRakeType.Value == true then
		print("rake type")  -- Affiche si le joueur a un grand râteau équipé
		local blowerX = 5
		local blowerY = 1
		local blowerZ = 5
		blowerHitBox.Size =  Vector3.new(blowerX, blowerY, blowerZ)  -- Taille pour le grand râteau
	elseif blowerType.Value == true then
		print("rake type")  -- Affiche si le joueur a un souffleur équipé
		local blowerX = 7
		local blowerY = 1
		local blowerZ = 7
		blowerHitBox.Size =  Vector3.new(blowerX, blowerY, blowerZ)  -- Taille pour le souffleur
	else
		print("No type")  -- Affiche si aucun équipement n'est sélectionné
		local blowerX = 0
		local blowerY = 0
		local blowerZ = 0
		blowerHitBox.Size =  Vector3.new(blowerX, blowerY, blowerZ)  -- Pas de hitbox si aucun équipement n'est équipé
	end

	-- Référence aux parties du personnage pour déplacer la hitbox
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local humanoid = character:WaitForChild("Humanoid")

	-- Boucle pour déplacer la hitbox en fonction de la position du personnage
	while humanoid.Health > 0 and humanoidRootPart do
		local lookDirection = humanoidRootPart.CFrame.LookVector  -- Direction dans laquelle le personnage regarde
		local newPosition = humanoidRootPart.Position + lookDirection  -- Calcul de la nouvelle position de la hitbox
		newPosition = Vector3.new(newPosition.X, groundLevelY, newPosition.Z)  -- Maintien la position sur le même niveau au sol

		blowerHitBox.Position = newPosition  -- Déplace la hitbox à la nouvelle position
		blowerHitBox.CFrame = CFrame.new(newPosition, newPosition + lookDirection)  -- Oriente la hitbox en fonction de la direction du regard du joueur

		task.wait(0)  -- Pause pour éviter de surcharger le serveur (légère attente)
	end
end)
