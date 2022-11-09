local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
local CF = CFrame.new
local ProximityPromptService = game:GetService("ProximityPromptService")
local Players = game:GetService("Players"):GetChildren()
local RunService = game:GetService("RunService")
local highlight = Instance.new("Highlight")
highlight.Name = "Highlight"
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/50)
        end
    end)
end)
local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local Window = Rayfield:CreateWindow({
	Name = "Doors Script 3.5",
	LoadingTitle = "Doors",
	LoadingSubtitle = "by ShadowSlime#6473",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "DoorsEntitySpawnerShdow2"
	},
        Discord = {
        	Enabled = true,
        	Invite = "4vT5j8efrg", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = false -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "Doors Script 3.5",
		Subtitle = "Enter key",
		Note = "Get key in (discord.gg/4vT5j8efrg)",
		FileName = "DoorsKeyByshadows",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "joemama"
	}
})

Rayfield:Notify({
    Title = "Doors script By ShadowSlime#6473",
    Content = "Have a great time!",
    Duration = 10.5,
    Image = 5962561114,
    Actions = { -- Notification Buttons
        Ignore = {
            Name = "Okay!!!1!",
            Callback = function()
                print("> ShadowSlime#6473 <")
            end
		},
	},
})

local Tab = Window:CreateTab("Spawner", 7539983780) -- Title, Image
local Section = Tab:CreateSection("Spawner")
local Button = Tab:CreateButton({
	Name = "Spawn Screech",
	Callback = function()
		require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data)
	end,
})

local Button = Tab:CreateButton({
	Name = "Spawn Halt",
	Callback = function()
		require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
	end,
})

local Button = Tab:CreateButton({
	Name = "Spawn Glitch",
	Callback = function()
		require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
	end,
})

local Button = Tab:CreateButton({
	Name = "Spawn AMBUSH (Killable)",
	Callback = function()
		local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Ambush", -- Custom name of your entity
    Model = "https://github.com/RegularVynixu/Utilities/blob/main/Doors%20Entity%20Spawner/Models/Ambush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 200, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 25,
    BreakLights = true,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(0, 0, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 4,
                Max = 4,
            },
        },
    },
    CustomDialog = {"You died to who you call Ambush...", "He rebounds", "Shadow Slime Uwu-"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("Entity has spawned:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("Entity has despawned:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("Entity has started moving:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("Entity has finished rebound:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("Entity:", entityTable.Model, "has entered room:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("Player has looked at entity:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("Player has died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
	end,
})

local Button = Tab:CreateButton({
	Name = "Spawn Timothy",
	Callback = function()
	local a = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game
    require(a.RemoteListener.Modules.SpiderJumpscare)(require(a), workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)].Assets.Table.DrawerContainer, 0.2)
	end,
})

local Paragraph = Tab:CreateParagraph({Title = "Btw", Content = "Timothy will only work in rooms with drawers!"})

local Button = Tab:CreateButton({
	Name = "Spawn EYES (Killable)",
	Callback = function()
	  local enableDamage = true
repenttimes = 0
local deadeyescrucifix = false
local repentcomplete = false
local currentLoadedRoom = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
local eyes = game:GetObjects("rbxassetid://11488518082")[1]
local num = math.floor(#currentLoadedRoom.Nodes:GetChildren() / 2)
eyes.CFrame = (num == 0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]).CFrame + Vector3.new(0, 7, 0)

eyes.Parent = workspace
eyes.Initiate:Play()
task.wait(0.5)
eyes.Attachment.Eyes.Enabled = true
eyes.whisper:Play()
eyes.whisper.Looped = true
function EyesHell()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(10,30,0.7,0.1)
ts = game:GetService("TweenService")
wait(0.2)
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(2,30,5,2)
wait(3)

eyes.Scream:Play()
ts:Create(eyes,TweenInfo.new(5),{CFrame = eyes.CFrame - Vector3.new(0,12,0)}):Play()
wait(7)
eyes:Destroy()
end
local hum = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

local function IsVisible(part)
	local vec, found=workspace.CurrentCamera:WorldToViewportPoint(part.Position)
	local onscreen = found and vec.Z > 0
	local cfg = RaycastParams.new();
	cfg.FilterType = Enum.RaycastFilterType.Blacklist
	cfg.FilterDescendantsInstances = {part};

	local cast = workspace:Raycast(part.Position, (game.Players.LocalPlayer.Character.UpperTorso.Position - part.Position), cfg);
	return (onscreen and true) and ((cast and cast.Instance).Parent==game.Players.LocalPlayer.Character and true)
end

while true do
	if workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value] ~= currentLoadedRoom then
		enableDamage = false
		task.wait(0.2)
		eyes:Destroy()
	end
	if enableDamage then
		if (IsVisible(eyes)) and not game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and deadeyescrucifix == false then
		game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.Health - 10
		wait(0.2)
		elseif (IsVisible(eyes)) and game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and repenttimes < 5 and deadeyescrucifix == false then
        print("GET THAT AWAY FROM ME")
        eyes.Repent:Play()
        eyes.Attachment.Angry.Enabled = true
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()

camShake:ShakeOnce(5,50,0.7,0.2)
        wait(0.7)
        repenttimes = repenttimes + 1
        print(repenttimes)
        eyes.Attachment.Angry.Enabled = false
        wait(0.4)
		elseif game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and repenttimes == 5 and deadeyescrucifix == false then
		local hi = game.Players.LocalPlayer.Character:FindFirstChild("Crucifix").Handle:Clone()
        hi.Anchored = true
        hi.Parent = workspace
        hi:PivotTo(game.Players.LocalPlayer.Character:FindFirstChild("Crucifix").Handle.CFrame)
        game.Players.LocalPlayer.Character:FindFirstChild("Crucifix"):Destroy()
        EyesHell()
        enableDamage = false
			if hum.Health <= 0 then
				game:GetService("ReplicatedStorage").GameStats["Player_" .. game.Players.LocalPlayer.Name].Total.DeathCause.Value =
					"Eyes"
				debug.setupvalue(
					getconnections(game:GetService("ReplicatedStorage").Bricks.DeathHint.OnClientEvent)[1].Function,
					1,
					{
						"You died to the Eyes...",
						"They don't like to be stared at.",
					}
				)
			end
		end
	end
	task.wait(0.2)
end

	  	     
	end,
})

local Button = Tab:CreateButton({
	Name = "Spawn EYES ",
	Callback = function()
	  local enableDamage = false
repenttimes = 0
local deadeyescrucifix = false
local repentcomplete = false
local currentLoadedRoom = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
local eyes = game:GetObjects("rbxassetid://11488518082")[1]
local num = math.floor(#currentLoadedRoom.Nodes:GetChildren() / 2)
eyes.CFrame = (num == 0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]).CFrame + Vector3.new(0, 7, 0)

eyes.Parent = workspace
eyes.Initiate:Play()
task.wait(0.5)
eyes.Attachment.Eyes.Enabled = true
eyes.whisper:Play()
eyes.whisper.Looped = true
function EyesHell()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(10,30,0.7,0.1)
ts = game:GetService("TweenService")
wait(0.2)
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(2,30,5,2)
wait(3)

eyes.Scream:Play()
ts:Create(eyes,TweenInfo.new(5),{CFrame = eyes.CFrame - Vector3.new(0,12,0)}):Play()
wait(7)
eyes:Destroy()
end
local hum = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

local function IsVisible(part)
	local vec, found=workspace.CurrentCamera:WorldToViewportPoint(part.Position)
	local onscreen = found and vec.Z > 0
	local cfg = RaycastParams.new();
	cfg.FilterType = Enum.RaycastFilterType.Blacklist
	cfg.FilterDescendantsInstances = {part};

	local cast = workspace:Raycast(part.Position, (game.Players.LocalPlayer.Character.UpperTorso.Position - part.Position), cfg);
	return (onscreen and true) and ((cast and cast.Instance).Parent==game.Players.LocalPlayer.Character and true)
end

while true do
	if workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value] ~= currentLoadedRoom then
		enableDamage = false
		task.wait(0.2)
		eyes:Destroy()
	end
	if enableDamage then
		if (IsVisible(eyes)) and not game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and deadeyescrucifix == false then
		game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.Health - 10
		wait(0.2)
		elseif (IsVisible(eyes)) and game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and repenttimes < 5 and deadeyescrucifix == false then
        print("GET THAT AWAY FROM ME")
        eyes.Repent:Play()
        eyes.Attachment.Angry.Enabled = true
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()

camShake:ShakeOnce(5,50,0.7,0.2)
        wait(0.7)
        repenttimes = repenttimes + 1
        print(repenttimes)
        eyes.Attachment.Angry.Enabled = false
        wait(0.4)
		elseif game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and repenttimes == 5 and deadeyescrucifix == false then
		local hi = game.Players.LocalPlayer.Character:FindFirstChild("Crucifix").Handle:Clone()
        hi.Anchored = true
        hi.Parent = workspace
        hi:PivotTo(game.Players.LocalPlayer.Character:FindFirstChild("Crucifix").Handle.CFrame)
        game.Players.LocalPlayer.Character:FindFirstChild("Crucifix"):Destroy()
        EyesHell()
        enableDamage = false
			if hum.Health <= 0 then
				game:GetService("ReplicatedStorage").GameStats["Player_" .. game.Players.LocalPlayer.Name].Total.DeathCause.Value =
					"Eyes"
				debug.setupvalue(
					getconnections(game:GetService("ReplicatedStorage").Bricks.DeathHint.OnClientEvent)[1].Function,
					1,
					{
						"You died to the Eyes...",
						"They don't like to be stared at.",
					}
				)
			end
		end
	end
	task.wait(0.2)
end

	  	     
	end,
})

local Button = Tab:CreateButton({
	Name = "Spawn RUSH (Killable)",
	Callback = function()
local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Rush", -- Custom name of your entity
    Model = "https://github.com/Johnny39871/assets/blob/main/Rush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 100, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 25,
    BreakLights = true,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 1,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(0, 0, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 4,
                Max = 4,
            },
        },
    },
    CustomDialog = {"You died to Rush...", "Hide when light flickers", "Noob"}, -- Custom death message
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityTable)
    print("Entity has spawned:", entityTable.Model)
end

entity.Debug.OnEntityDespawned = function(entityTable)
    print("Entity has despawned:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("Entity has started moving:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("Entity has finished rebound:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("Entity:", entityTable.Model, "has entered room:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("Player has looked at entity:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("Player has died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
	end,
})

local Button = Tab:CreateButton({
	Name = "Spawn Shadow Every Door",
	Callback = function()
		Rayfield:Notify({
			Title = "Shadow",
			Content = "WILL HAUNT YOU EVERY SINGLE DOOR",
			Duration = 6.5,
			Image = 4483362458,
			Actions = { -- Notification Buttons
				Ignore = {
					Name = "Lol ok",
					Callback = function()
						print("SHADOW!")
					end
				},
			},
		})
		loadstring(game:HttpGet('https://github.com/Noonie1/RandomUtilities/blob/ShadowScript/ShadowMain.lua?raw=true'))()
	end,
})

local Section = Tab:CreateSection("Screech Paradise")

local Button = Tab:CreateButton({
	Name = "Spam screech",
	Callback = function()
		while true do -- Will run the script forever
  coroutine.wrap(function() require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data) end)() -- Coroutines prevent the script from yielding.
task.wait() -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
end
	end,
})

local Button = Tab:CreateButton({
	Name = "Spawn Screech Every Door",
	Callback = function()
	game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data)
end)
	end,
})

local Button = Tab:CreateButton({
	Name = "Spawn Screech Next Door",
	Callback = function()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data)
	end,
})

local Section = Tab:CreateSection("Spawn key binds")

local Keybind = Tab:CreateKeybind({
	Name = "Spawn Screech",
	CurrentKeybind = "Z",
	HoldToInteract = false,
	Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Keybind)
		require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data)
	end,
})

local Keybind = Tab:CreateKeybind({
	Name = "Spawn Halt",
	CurrentKeybind = "X",
	HoldToInteract = false,
	Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Keybind)
		require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
	end,
})

local Keybind = Tab:CreateKeybind({
	Name = "Spawn Glitch",
	CurrentKeybind = "V",
	HoldToInteract = false,
	Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Keybind)
		require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
	end,
})

local Keybind = Tab:CreateKeybind({
	Name = "Spawn Timothy",
	CurrentKeybind = "B",
	HoldToInteract = false,
	Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Keybind)
		require(a.RemoteListener.Modules.SpiderJumpscare)(require(a), workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)].Assets.Table.DrawerContainer, 0.2)
	end,
})



local Tab = Window:CreateTab("Events", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Room events")

local Button = Tab:CreateButton({
	Name = "Spawn Seek Eyes",
	Callback = function()
   require(game.ReplicatedStorage.ClientModules.EntityModules.Seek).tease(nil, workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")], 100)
	end,
})

local Button = Tab:CreateButton({
	Name = "Flicker Lights",
	Callback = function()
		firesignal(game.ReplicatedStorage.Bricks.UseEventModule.OnClientEvent, "flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, 1) 
	end,
})

local Button = Tab:CreateButton({
	Name = "Break Lights",
	Callback = function()
		firesignal(game.ReplicatedStorage.Bricks.UseEventModule.OnClientEvent, "breakLights", workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value], 0.416, 60) 
	end,
})

local Input = Tab:CreateInput({
	Name = "Red Room",
	PlaceholderText = "Duration",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		firesignal(game.ReplicatedStorage.Bricks.UseEventModule.OnClientEvent, "tryp", workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value], (Text)) 
	end,
})

local Button = Tab:CreateButton({
	Name = "Get all badges",
	Callback = function()
		for i,v in pairs(require(game.ReplicatedStorage.Achievements)) do
    spawn(function()
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.AchievementUnlock)(nil, i)
    end)
end
	end,
})

local Button = Tab:CreateButton({
	Name = "Heartbeat Minigame",
	Callback = function()
		firesignal(game.ReplicatedStorage.Bricks.ClutchHeartbeat.OnClientEvent)
		wait(1)
		firesignal(game.ReplicatedStorage.Bricks.ClutchHeartbeat.OnClientEvent)
		wait(1)
		firesignal(game.ReplicatedStorage.Bricks.ClutchHeartbeat.OnClientEvent)
		wait(1)
		firesignal(game.ReplicatedStorage.Bricks.ClutchHeartbeat.OnClientEvent)
		wait(1)
		firesignal(game.ReplicatedStorage.Bricks.ClutchHeartbeat.OnClientEvent)
		wait(1)
		firesignal(game.ReplicatedStorage.Bricks.ClutchHeartbeat.OnClientEvent)
		wait(1)
		firesignal(game.ReplicatedStorage.Bricks.ClutchHeartbeat.OnClientEvent)
		wait(1)
		firesignal(game.ReplicatedStorage.Bricks.ClutchHeartbeat.OnClientEvent)
		wait(1)
		firesignal(game.ReplicatedStorage.Bricks.ClutchHeartbeat.OnClientEvent) 
	end,
})
local Tab = Window:CreateTab("Game", 6406303413) -- Title, Image
local Button = Tab:CreateButton({
	Name = "Fullbright",
	Callback = function()
if not _G.FullBrightExecuted then

	_G.FullBrightEnabled = false

	_G.NormalLightingSettings = {
		Brightness = game:GetService("Lighting").Brightness,
		ClockTime = game:GetService("Lighting").ClockTime,
		FogEnd = game:GetService("Lighting").FogEnd,
		GlobalShadows = game:GetService("Lighting").GlobalShadows,
		Ambient = game:GetService("Lighting").Ambient
	}

	game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
		if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
			_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Brightness = 1
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
		if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
			_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").ClockTime = 12
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
		if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
			_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").FogEnd = 786543
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
		if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
			_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").GlobalShadows = false
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
		if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
			_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	game:GetService("Lighting").Brightness = 1
	game:GetService("Lighting").ClockTime = 12
	game:GetService("Lighting").FogEnd = 786543
	game:GetService("Lighting").GlobalShadows = false
	game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until _G.FullBrightEnabled
		while wait() do
			if _G.FullBrightEnabled ~= LatestValue then
				if not _G.FullBrightEnabled then
					game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
					game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
					game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
					game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
					game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
				else
					game:GetService("Lighting").Brightness = 1
					game:GetService("Lighting").ClockTime = 12
					game:GetService("Lighting").FogEnd = 786543
					game:GetService("Lighting").GlobalShadows = false
					game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
end

_G.FullBrightExecuted = true
_G.FullBrightEnabled = not _G.FullBrightEnabled
	end,
})

local Button = Tab:CreateButton({
	Name = "No E wait",
	Callback = function()
		PromptButtonHoldBegan = ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
			fireproximityprompt(prompt)
		end)
	end,
})

local Section = Tab:CreateSection("Guiding Light")

local Input = Tab:CreateInput({
	Name = "Guiding Light Message",
	PlaceholderText = "Message",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		firesignal(game.ReplicatedStorage.Bricks.DeathHint.OnClientEvent, {(Text),"Thanks for using ShadowSlime#6473's Guiding Lights generator! "})
	end,
})

local Button = Tab:CreateButton({
	Name = "Start",
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end,
})

local Tab = Window:CreateTab("LocalPlayer", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Health")

local Input = Tab:CreateInput({
	Name = "Health Set",
	PlaceholderText = "Health",
	RemoveTextAfterFocusLost = true,
	Callback = function(Text)
		game.Players.LocalPlayer.Character.Humanoid.Health = (Text)
	end,
})

local Button = Tab:CreateButton({
	Name = "Kill Yourself (works)",
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end,
})

local Section = Tab:CreateSection("Other")

local Slider = Tab:CreateSlider({
	Name = "Speed",
	Range = {10, 69},
	Increment = 1,
	Suffix = "Walkspeed",
	CurrentValue = 16,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
while true do
wait()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
	end
end,
})

local Button = Tab:CreateButton({
	Name = "Noclip (Can't Be Turned Off)",
	Callback = function()
local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

noclip() -- to toggle noclip() and clip()
end
})

local Section = Tab:CreateSection("Inventory")

local Button = Tab:CreateButton({
	Name = "Give Crucifix",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Johnny39871/assets/main/crucifixo'))()
	end,
})

local Button = Tab:CreateButton({
	Name = "Get Skeleton Key",
	Callback = function()
	function skelly()
    local DoorReplication = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Door%20Replication/Source.lua"))()


-- Get current room
local room = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]


-- Replicate door
local replicatedDoor = DoorReplication.ReplicateDoor(room, {
    CustomKeyName = "Skeleton Key",
    DestroyKey = false,
})


-- Debug features [advanced]
replicatedDoor.Debug.OnDoorOpened = function(doorTable)
    warn("Door", doorTable.Model, "has opened")
end
end
local DoorReplication = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Door%20Replication/Source.lua"))()


-- Get current room
local room = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]


-- Replicate door
local replicatedDoor = DoorReplication.ReplicateDoor(room, {
    CustomKeyName = "Skeleton Key",
    DestroyKey = false,
})


-- Debug features [advanced]
replicatedDoor.Debug.OnDoorOpened = function(doorTable)
    warn("Door", doorTable.Model, "has opened")
end
		local shadow=game:GetObjects("rbxassetid://11491147151")[1]
shadow.Parent = game.Players.LocalPlayer.Backpack
local anim = Instance.new("Animation")
local anim2 = Instance.new("Animation")
anim.AnimationId = 'https://www.roblox.com/Assest?ID=6525854363'
anim2.AnimationId = 'https://www.roblox.com/Assest?ID=10526835827'
local track
 
shadow.Equipped:Connect(function()
	track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim) 
		track.Priority = Enum.AnimationPriority.Action
		track:Play()
		track.Looped = false
		wait(1.4)
	track2 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim2) 
		track2.Priority = Enum.AnimationPriority.Action
		track2:Play()
		track2.Looped = false
 
end)
 
shadow.Unequipped:Connect(function()
	if track then
		track:Stop()
		track2:Stop()
	end
end)
game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
    if workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door:FindFirstChild("Lock") then
        print("YES KEY")
   skelly()
   else
       print("no.")
end
end)
	end,
})

local Paragraph = Tab:CreateParagraph({Title = "Btw", Content = "The Crucifix Works on eyes!"})

local Tab = Window:CreateTab("AutoFarm", 6406303413) -- Title, Image

local Button = Tab:CreateButton({
	Name = "Skip Door",
	Callback = function()
        pcall(function()
            local HasKey = false
            local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
            for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do
                if v.Name == "KeyObtain" then
                    HasKey = v
                end
            end
            if HasKey then
                game.Players.LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position))
                wait(0.3)
                fireproximityprompt(HasKey.ModulePrompt,0)
                game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                wait(0.3)
                fireproximityprompt(CurrentDoor.Lock.UnlockPrompt,0)
            end
            if LatestRoom == 50 then
                CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
            end
            game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
            wait(0.3)
            CurrentDoor.ClientOpen:FireServer()
        end)
  	end,    
})

local Keybind = Tab:CreateKeybind({
	Name = "Skip Door Key",
	CurrentKeybind = "P",
	HoldToInteract = false,
	Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Keybind)
		 pcall(function()
            local HasKey = false
            local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
            for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do
                if v.Name == "KeyObtain" then
                    HasKey = v
                end
            end
            if HasKey then
                game.Players.LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position))
                wait(0.3)
                fireproximityprompt(HasKey.ModulePrompt,0)
                game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                wait(0.3)
                fireproximityprompt(CurrentDoor.Lock.UnlockPrompt,0)
            end
            if LatestRoom == 50 then
                CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
            end
            game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
            wait(0.3)
            CurrentDoor.ClientOpen:FireServer()
        end)
	end,
})

local Tab = Window:CreateTab("Visuals test", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Player Esp")

local Button = Tab:CreateButton({
	Name = "Player Esp",
	Callback = function()
for i, v in pairs(Players) do
    repeat wait() until v.Character
    if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
        local highlightClone = highlight:Clone()
        highlightClone.Adornee = v.Character
        highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
        highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlightClone.Name = "Highlight"
    end
end

-- // A player joined

game.Players.PlayerAdded:Connect(function(player)
    repeat wait() until player.Character
    if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
        local highlightClone = highlight:Clone()
        highlightClone.Adornee = player.Character
        highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
        highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlightClone.Name = "Highlight"
    end
end)

-- // A player left

game.Players.PlayerRemoving:Connect(function(playerRemoved)
    playerRemoved.Characeter:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
end)

-- // Runservice

RunService.Heartbeat:Connect(function()
    for i, v in pairs(Players) do
        repeat wait() until v.Character
        if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = v.Character
            highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.Name = "Highlight"
            task.wait()
        end
    end
end)
	end,
})


local Tab = Window:CreateTab("Script Info", 6406303413) -- Title, Image
local Section = Tab:CreateSection("Credits")
local Paragraph = Tab:CreateParagraph({Title = "Coding", Content = "ShadowSlime#6473"})
		local Paragraph = Tab:CreateParagraph({Title = "Coding", Content = "Town#7431"})
local Paragraph = Tab:CreateParagraph({Title = "UI", Content = "Rayfield DOCS"})
local Paragraph = Tab:CreateParagraph({Title = "Inspired by", Content = "OminousVibes"})
local Section = Tab:CreateSection("Changelog")
local Paragraph = Tab:CreateParagraph({Title = "3.5 (Latest)", Content = "Added Shadow , Added Spawn Entities with keybinds , Updated Heartbeat Minigame Event , New credits Coder"})

local Button = Tab:CreateButton({
	Name = "Unload Script",
	Callback = function()
     Rayfield:Destroy()
	end,
})
