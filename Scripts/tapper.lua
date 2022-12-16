local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Stair Tappers", HidePremium = false, SaveConfig = false, IntroText = "Shadow Scripts", ConfigFolder = "OrionTest"})

-----------------------
local Inviter = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
local fakeStairs = {}
local vim = game:GetService("VirtualInputManager")
local players = game:GetService("Players")
local player = players.LocalPlayer
local playerCharacter = workspace[player.Name]
local title = player.PlayerGui.GameplayGUI.Timer.Title.Text

function hold(keyCode, time)
  vim:SendKeyEvent(true, keyCode, false, game)
  task.wait(time)
  vim:SendKeyEvent(false, keyCode, false, game)
end

function check()
    local pos = playerCharacter.HumanoidRootPart.Position
    local rayOrigin = pos
    local rayDirection = Vector3.new(0, 8, 6)
    local raycastParams = RaycastParams.new()
    if #fakeStairs > 0 then fakeStairs = {} end
    for i,v in pairs(workspace.Stairs:GetChildren()) do
        if v.Transparency == 0 then
            table.insert(fakeStairs,v)
        end
    end
    raycastParams.FilterDescendantsInstances = fakeStairs
    raycastParams.FilterType = Enum.RaycastFilterType.Whitelist
    local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
    if raycastResult then
        else
        return false
    end
    return true
end

-----------------------

local CreditsTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://11348555035",
	PremiumOnly = false
})

CreditsTab:AddParagraph("Coding","ShadowSlime#6473")

CreditsTab:AddParagraph("Group","Shadow Scripts")

CreditsTab:AddParagraph("Discord","discord.gg/4vT5j8efrg")

CreditsTab:AddButton({
	Name = "Copy Discord Link",
	Callback = function()
      		setclipboard("https://discord.com/invite/4vT5j8efrg")
wait(0.5)
OrionLib:MakeNotification({
	Name = "Done!",
	Content = "Discord Invite Link Was Copied To Your Clipboard",
	Image = "rbxassetid://8215093320",
	Time = 5
})
  	end    
})

CreditsTab:AddButton({
	Name = "Join Discord Server (App)",
	Callback = function()
      		Inviter.Prompt({
    name = "Shadow's Scripts",
    invite = "https://discord.gg/4vT5j8efrg",
})
  	end    
})







local AutoTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://11347112400",
	PremiumOnly = false
})

local sliderValue = 75
AutoTab:AddSlider({
	Name = "Auto-Tap Slowness",
	Min = 1,
	Max = 150,
	Default = 75,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Slowness level",
	Callback = function(Value)
		sliderValue = (Value)
	end    
})

AutoTab:AddParagraph("Tip!","The Less the Slowness is The Faster you Go!     Examble: If Slowness is 1, You Go SO FAST   BUT IF its 150, You go too Slow!")

local AutoTap = false
AutoTab:AddToggle({
	Name = "Auto-Tap",
	Default = true,
	Callback = function(Value)
		 AutoTap = (Value)   
end    
})

AutoTab:AddParagraph("Note:","Auto-Tab CAN Be Turned Off. But to Turn On Again. You Have To Re-Execute the script!")


while AutoTap == true and wait() do
            if #player.PlayerGui.SpectateGUI:GetChildren() <= 0 then
                if #workspace.Stairs:GetChildren() > 0 then
                    if title == "Beginning In..." or title == "Intermission" then
                        
                        else
                        if check() == true then
                            hold(Enum.KeyCode.Left,0.005)
                        else
                            hold(Enum.KeyCode.Right,0.005)
                        end
                        wait((sliderValue - math.random(-2,2)) / 1000)
                    end
                end
            end
        end



OrionLib:Init()