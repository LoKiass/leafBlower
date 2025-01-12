-- Déclaration de la zone où les feuilles apparaîtront et du nombre maximum de feuilles
local leafSpawnArea = workspace.Area:WaitForChild("leafSpawnArea")  -- Zone de spawn des feuilles dans l'espace de travail
local maxLeaf = 30  -- Nombre maximum de feuilles pouvant exister en même temps

-- Création d'une instance "actualLeaf" pour gérer le nombre de feuilles actuelles
local actualLeaf = Instance.new("IntValue")  -- Crée un objet de type IntValue pour stocker le nombre de feuilles
actualLeaf.Name = "actualLeaf"  -- Donne un nom à l'instance
actualLeaf.Parent = game.Workspace:WaitForChild("leafFolderPart")  -- Place "actualLeaf" dans le dossier des feuilles
actualLeaf.Value = 0  -- Initialise la valeur de feuilles à 0

-- Fonction qui génère ou non une feuille aléatoirement en fonction d'un pourcentage de chance
function triggerRandomEvent()
	local minX, maxX, minZ, maxZ = limiteOfSpawnArea()  -- Récupère les limites de la zone de spawn des feuilles
	local randomIndex = math.random(1, 10)  -- Génère un nombre aléatoire entre 1 et 10

	if randomIndex == 1 then  -- Si le nombre aléatoire est 1 (10% de chance)
		if actualLeaf.Value < maxLeaf then  -- Si le nombre de feuilles n'a pas atteint la limite
			local leaf = Instance.new("Part")  -- Crée un nouvel objet feuille
			leaf.Size = Vector3.new(1, 0.5, 1)  -- Définit la taille de la feuille
			leaf.BrickColor = BrickColor.new("Tr. Green")  -- Définit la couleur de la feuille en vert
			leaf.Anchored = false  -- La feuille n'est pas ancrée, elle peut se déplacer
			leaf.Name = "Leaf"  -- Donne le nom "Leaf" à l'objet
			leaf.CanCollide = true  -- Permet à la feuille de détecter des collisions

			-- Calcul des positions aléatoires pour la feuille dans les limites de la zone de spawn
			local randomX = math.random(minX, maxX)  -- Position aléatoire sur l'axe X
			local randomZ = math.random(minZ, maxZ)  -- Position aléatoire sur l'axe Z
			local yPosition = leafSpawnArea.Position.Y + 10  -- Position fixe sur l'axe Y (au-dessus de la zone de spawn)

			-- Définit la position finale de la feuille
			leaf.Position = Vector3.new(randomX, yPosition, randomZ)
			leaf.Parent = workspace:WaitForChild("leafFolderPart")  -- Ajoute la feuille à la partie des feuilles

			actualLeaf.Value = actualLeaf.Value + 1  -- Incrémente le nombre actuel de feuilles
		end	
	end
end

-- Fonction pour calculer les limites de la zone de spawn des feuilles (opérations arithmétiques)
function limiteOfSpawnArea()
	local leafSpawnAreaPosition = leafSpawnArea.Position  -- Récupère la position de la zone de spawn
	local leafSpawnAreaSize = leafSpawnArea.Size  -- Récupère la taille de la zone de spawn

	-- Calcule les limites X et Z de la zone de spawn en prenant en compte la taille de la zone
	local minX = (leafSpawnAreaPosition.X - leafSpawnAreaSize.X / 2) + 3  
	local maxX = (leafSpawnAreaPosition.X + leafSpawnAreaSize.X / 2) - 3  
	local minZ = (leafSpawnAreaPosition.Z - leafSpawnAreaSize.Z / 2) + 3 
	local maxZ = (leafSpawnAreaPosition.Z + leafSpawnAreaSize.Z / 2) - 3  

	return minX, maxX, minZ, maxZ  -- Retourne les limites calculées
end

-- Boucle infinie qui génère les feuilles à intervalles réguliers
while true do 
	triggerRandomEvent()  
	wait(0)
end
