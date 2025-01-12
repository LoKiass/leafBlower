-- Déclaration des services et variables utilisés dans le script
local Players = game:GetService("Players")  -- Obtient le service des joueurs pour accéder aux informations des joueurs
local leafFolder = game.Workspace:WaitForChild("leafFolderPart")  -- Référence au dossier contenant toutes les feuilles dans l'espace de travail
local blowerHitBox = game.Workspace:WaitForChild("blowerHitBox")  -- Référence à la zone de collision du souffleur

local earningArea = game.Workspace.Area:WaitForChild("earningArea")  -- Référence à la zone où les feuilles sont collectées
local leafSuprresion = game.Workspace.leafFolderPart:WaitForChild("actualLeaf")  -- Variable pour suivre et mettre à jour le nombre de feuilles à supprimer

-- Fonction qui gère la collecte des feuilles dans la zone de collecte
function leafOnEarningArea()  
	-- Quand une feuille touche la zone de collecte
	for _, leaf in ipairs(leafFolder:GetChildren()) do  -- Parcourt toutes les feuilles dans le dossier
		if leaf:IsA("BasePart") and leaf.Name == "Leaf" then  -- Vérifie que l'objet est bien une feuille
			leaf.Touched:Connect(function(hit)
				if hit == earningArea then  -- Si la feuille touche la zone de collecte
					leafSuprresion.Value = leafSuprresion.Value - 1  -- Décrémente le compteur de feuilles collectées
					leaf:Destroy()  -- Détruit la feuille collectée
					getStat()  -- Met à jour les statistiques du joueur
				end
			end)
		end
	end
end

-- Fonction qui gère la collision des feuilles avec la zone du souffleur
function checkColisionWithBlower()  
	-- Quand une feuille touche la zone du souffleur
	for _, leaf in ipairs(leafFolder:GetChildren()) do  -- Parcourt toutes les feuilles dans le dossier
		if leaf:IsA("BasePart") and leaf.Name == "Leaf" then  -- Vérifie que l'objet est bien une feuille
			leaf.Touched:Connect(function(hit)
				if hit == blowerHitBox then  -- Si la feuille touche la zone du souffleur
					local direction = (leaf.Position - blowerHitBox.Position).Unit  -- Calcule la direction de l'expulsion de la feuille
					leaf.AssemblyLinearVelocity = direction * 50  -- Applique une vitesse pour expulser la feuille
				end
			end)
		end
	end
end

-- Fonction pour mettre à jour le compteur de feuilles collectées du joueur
function getStat()  
	local player = Players.LocalPlayer  -- Obtient le joueur local
	local leaderstats = player:WaitForChild("leaderstats")  -- Accède aux statistiques du joueur
	local stat = leaderstats:WaitForChild("Leaf")  -- Accède au compteur de feuilles du joueur
	stat.Value += 1  -- Augmente le compteur de feuilles
end

-- Boucle principale qui appelle les fonctions pour gérer les collisions en continu
while true do
	checkColisionWithBlower()  -- Vérifie les collisions avec la zone du souffleur
	leafOnEarningArea()  -- Vérifie les collisions avec la zone de collecte
	task.wait(0)  -- Boucle rapide pour une exécution fluide
end
