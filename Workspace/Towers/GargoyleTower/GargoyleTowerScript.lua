-- Gargoyle Tower Script for Solo Domination in 2026 Tower Update

local tower = script.Parent
local attackRange = 20
local attackSpeed = 1.5
local damage = 50
local freezeDuration = 3

-- Function to attack enemies
local function attackEnemies()
    local enemies = tower:GetChildren()
    for _, enemy in ipairs(enemies) do
        if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") then
            local humanoid = enemy:FindFirstChild("Humanoid")
            if humanoid and (tower.Position - enemy.Position).Magnitude <= attackRange then
                humanoid:TakeDamage(damage)
                -- Freeze the enemy
                if humanoid:FindFirstChild("BodyVelocity") then
                    humanoid.BodyVelocity:Destroy()
                end
                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bodyVelocity.Parent = humanoid
                game:GetService("Debris"):AddItem(bodyVelocity, freezeDuration)
            end
        end
    end
end

-- Connect the attack function to the tower's attack event
tower.AttackEvent:Connect(attackEnemies)

-- Function to upgrade the tower
local function upgradeTower()
    attackRange = attackRange + 5
    attackSpeed = attackSpeed - 0.2
    damage = damage + 10
    freezeDuration = freezeDuration + 1
end

-- Connect the upgrade function to the tower's upgrade event
if tower:FindFirstChild("UpgradeEvent") then
    tower.UpgradeEvent:Connect(upgradeTower)
end
