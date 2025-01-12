local inventoryButton = script.Parent  -- Référence au bouton d'inventaire
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer  -- Référence au joueur local

-- Création et initialisation de la valeur "handType" pour le joueur
local handType = Instance.new("BoolValue")
handType.Name = "handType"  -- Nom donné à la valeur booléenne
handType.Parent = LocalPlayer  -- Attache "handType" au joueur local
handType.Value = false  -- Valeur initiale : la main n'est pas équipée

-- Création et initialisation de la valeur "rakeType" pour le joueur
local rakeType = Instance.new("BoolValue")
rakeType.Name = "rakeType"
rakeType.Parent = LocalPlayer
rakeType.Value = false  -- Valeur initiale : le râteau n'est pas équipé

-- Création et initialisation de la valeur "largeRakeType" pour le joueur
local largeRakeType = Instance.new("BoolValue")
largeRakeType.Name = "largeRakeType"
largeRakeType.Parent = LocalPlayer
largeRakeType.Value = false  -- Valeur initiale : le grand râteau n'est pas équipé

-- Création et initialisation de la valeur "blowerType" pour le joueur
local blowerType = Instance.new("BoolValue")
blowerType.Name = "blowerType"
blowerType.Parent = LocalPlayer
blowerType.Value = false  -- Valeur initiale : le souffleur n'est pas équipé

-- Référence au hitbox du souffleur dans le workspace
local blowerHitBox = workspace:WaitForChild("blowerHitBox")