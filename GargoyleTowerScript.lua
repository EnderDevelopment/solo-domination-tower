-- Gargoyle Tower Script for Solo Domination in 2026 Tower Update

local GargoyleTower = script.Parent

-- Function to enhance the Gargoyle Tower
local function enhanceGargoyleTower()
    -- Increase attack range
    GargoyleTower.AttackRange.Value = 50
    
    -- Increase attack speed
    GargoyleTower.AttackSpeed.Value = 0.5
    
    -- Increase damage
    GargoyleTower.Damage.Value = 100
    
    -- Add special ability: Freeze enemies for 2 seconds
    GargoyleTower:FindFirstChild("FreezeAbility").Enabled = true
    GargoyleTower:FindFirstChild("FreezeDuration").Value = 2
end

-- Call the enhancement function when the script is loaded
enhanceGargoyleTower()

-- Function to handle enemy detection and attack
local function onEnemyDetected(enemy)
    -- Attack logic here
    print("Attacking enemy: " .. enemy.Name)
end

-- Connect the enemy detection function to the tower's detection event
GargoyleTower.DetectionEvent.Event:Connect(onEnemyDetected)
