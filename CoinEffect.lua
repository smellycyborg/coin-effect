local tweenService = game:GetService("TweenService")
local coin = game.ReplicatedStorage:WaitForChild("CoinGuiEffectPart")

local tweenInfo = TweenInfo.new(
	1, -- Time
	Enum.EasingStyle.Linear, -- EasingStyle
	Enum.EasingDirection.Out, -- EasingDirection
	-1, -- RepeatCount (when less than zero the tween will loop indefinitely)
	true, -- Reverses (tween will reverse once reaching it's goal)
	0 -- DelayTime
)

local function clone(character)
	local humanRoot = character.HumanoidRootPart

	local clone = coin:Clone()
	clone.Position = humanRoot.Position
	clone.Orientation = humanRoot.Orientation
	clone.Anchored = true
	clone.CanCollide = false
	clone.Parent = workspace

	return clone
end

return function(character) -- pass the player character into this function
	local clone = clone(character)
	
	local tween = tweenService:Create(clone, tweenInfo, {
		Position = Vector3.new(
			clone.Position.X, 
			clone.Position.Y + 5, 
			clone.Position.Z
		)
	})
	
	tween:Play()

	task.wait(1)

	tween:Cancel()
	clone:Destroy()
end