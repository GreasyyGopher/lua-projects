wait(1)
-- Instances --
local teleportFolder = Instance.new('Folder')
teleportFolder.Parent = workspace
teleportFolder.Name = 'teleportFolder'


local gameModeOne = Instance.new('Part')
gameModeOne.Anchored = true
gameModeOne.Parent = teleportFolder
gameModeOne.BrickColor = BrickColor.new('Really red')
gameModeOne.Transparency = 0.5
gameModeOne.Name = 'gameModeOneTeleport'

local gameModeTwo = Instance.new('Part')
gameModeTwo.Anchored = true
gameModeTwo.Parent = teleportFolder
gameModeTwo.BrickColor = BrickColor.new('Really red')
gameModeTwo.Transparency = 0.5
gameModeTwo.Name = 'gameModeTwoTeleport'
gameModeTwo.Position = Vector3.new(gameModeOne.Position, 10, 0)

local Values = Instance.new('Folder')
Values.Parent = game.ReplicatedStorage
Values.Name = 'Values'

local playerCount = Instance.new('IntValue')
playerCount.Parent = Values
playerCount.Name = 'playerCount'
playerCount.Value = 0

-- Variables --

local Players = game:GetService('Players')
local playerCount = game.ReplicatedStorage.Values.playerCount
local gamemodes = {"gameModeOne", "gameModeTwo"}
local debugMode = true
local gameModeOnePosition = game.Workspace.teleportFolder.gameModeOneTeleport.Position
local gameModeTwoPosition = game.Workspace.teleportFolder.gameModeTwoTeleport.Position
local gameStarted = false
local timeLeft = 0

-- Functions for when a player joins. --

game.Players.PlayerAdded:Connect(function()
	playerCount.Value = playerCount.Value + 1
	print(playerCount.Value)
end)

game.Players.PlayerRemoving:Connect(function()
	playerCount.Value = playerCount.Value - 1
	print(playerCount.Value)
end)

-- Teleports all players. Parameters included to change the position depending on which gamemode --

local function teleport(pos)
	local target = CFrame.new(pos)
	for i, player in ipairs(game.Players:GetChildren()) do
		 player.Character.Torso.CFrame = target + Vector3.new(0, i * 2, 0)
	end
end

local function roundStart()
	if playerCount.Value == 2 or debugMode == true then
		local randomMode = Random.new() :NextInteger(1, #gamemodes)
		print(gamemodes[randomMode])
		if gamemodes[randomMode] == 'gameModeOne' then
			teleport(gameModeOnePosition)
		end
	end
end


roundStart()
