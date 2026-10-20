-- Ice Tower Script for Solo Domination in 2026 Tower Update

local IceTower = script.Parent

-- Increase attack range
local attackRange = IceTower.AttackRange
attackRange.Value = attackRange.Value * 1.5

-- Increase attack speed
local attackSpeed = IceTower.AttackSpeed
attackSpeed.Value = attackSpeed.Value * 1.5

-- Increase damage
local damage = IceTower.Damage
local damageMultiplier = 1.5
damage.Value = damage.Value * damageMultiplier

-- Freeze enemies on hit
local function onHit(enemy)
    local freezeEffect = Instance.new("ParticleEmitter")
    freezeEffect.Parent = enemy
    freezeEffect.Texture = "rbxassetid://123456789"
    freezeEffect.LightEmission = 1
    freezeEffect.Size = NumberSequence.new(0.5)
    freezeEffect.Transparency = NumberSequence.new(0.5)
    freezeEffect.Lifetime = NumberRange.new(2)
    freezeEffect.Rate = 100
    freezeEffect.Enabled = true

    local freezeDuration = 2
    local originalSpeed = enemy.WalkSpeed.Value
    enemy.WalkSpeed.Value = 0

    wait(freezeDuration)

    enemy.WalkSpeed.Value = originalSpeed
    freezeEffect.Enabled = false
    freezeEffect:Destroy()
end

-- Connect the onHit function to the tower's attack event
IceTower.AttackEvent:Connect(onHit)

-- Broadcast message when the tower is activated
local function onActivated()
    local message = "Ice Tower Activated! Enemies will be frozen on hit!"
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Ice Tower",
        Text = message,
        Duration = 5
    })
end

IceTower.Activated:Connect(onActivated)