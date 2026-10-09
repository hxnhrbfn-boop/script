-- Made by Delifell
-- Join my Discord server: https://discord.gg/9d79Eg3uAg

local FriendlyFolder = workspace:WaitForChild("NPCFolders"):WaitForChild("FriendlyFolder")
local BaseFolder = workspace:WaitForChild("NPCFolders"):WaitForChild("BaseFolder")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
local RemoteFunction = Events:WaitForChild("RemoteFunction")
local SandboxSettings = RemoteFunction:WaitForChild("SandboxSettings")
local SandboxSpawn = RemoteFunction:WaitForChild("SandboxSpawn")
local BotThread = nil

-- Settings:
local Form = "A"
local Magnification = 1
local SpawnRate = 1
local Limit = 30


local SpawnTeamsSwap = {[1] = "SpawnTeamsSwap", [2] = true}
local EnableHealthBars = {[1] = "EnableHealthBars", [2] = true}

local Boss = {[1] = "Enemy", [2] = 149, [3] = Form, [4] = Magnification}
local Enemy1 = {[1] = "Enemy", [2] = 130, [3] = Form, [4] = Magnification}
local Enemy2 = {[1] = "Enemy", [2] = 144, [3] = Form, [4] = Magnification}
local Enemy3 = {[1] = "Enemy", [2] = 146, [3] = Form, [4] = Magnification}
local Enemy4 = {[1] = "Enemy", [2] = 142, [3] = Form, [4] = Magnification}
local Enemy5 = {[1] = "Enemy", [2] = 135, [3] = Form, [4] = Magnification}
local Enemy6 = {[1] = "Enemy", [2] = 145, [3] = Form, [4] = Magnification}
local Enemy7 = {[1] = "Enemy", [2] = 147, [3] = Form, [4] = Magnification}
local Enemy8 = {[1] = "Enemy", [2] = 148, [3] = Form, [4] = Magnification}

local function EnemyLimit(Names)
    local LimitCount = 0
    for _, Enemy in FriendlyFolder:GetChildren() do
        if Names[Enemy.Name] then
            if Enemy:GetAttribute("ConfusedTime") then continue end
            local Humanoid = Enemy:FindFirstChildOfClass("Humanoid")
            if Humanoid and Humanoid.Health > 0 then
                LimitCount += 1
            end
        end
    end
    return LimitCount
end

local Limit3 = {["Spambox Battler"] = true, ["Sorcus Battler"] = true}
local Limit4 = {["Drakocage"] = true, ["Monfined"] = true}
local Limit5 = {["Sign Buddy"] = true, ["Fish Buddy"] = true}
local Limit6 = {["Dopamine"] = true, ["Dendritic"] = true}
local Limit7 = {["Flower"] = true, ["Depriver"] = true}
local Limit8 = {["Oscar"] = true, ["Edmond"] = true}

local function AliveEnemies()
    local AliveCount = 0
    for _, Enemy in FriendlyFolder:GetChildren() do
        if Enemy:GetAttribute("NoClog") then continue end
        if Enemy:GetAttribute("ConfusedTime") then continue end
        local Humanoid = Enemy:FindFirstChildOfClass("Humanoid")
        if Humanoid and Humanoid.Health > 0 then
            AliveCount += 1
        end
    end
    return AliveCount
end

local function Spawn(Enemy)
    while AliveEnemies() >= Limit do task.wait(0.1) end
    SandboxSpawn:InvokeServer(unpack(Enemy))
end


local function SpawnCycle()
    Spawn(Boss)
    while true do
        task.wait(8 / SpawnRate)
        Spawn(Enemy1)

        task.wait(4 / SpawnRate)
        Spawn(Enemy1)

        task.wait(6 / SpawnRate)
        Spawn(Enemy2)

        if EnemyLimit(Limit3) < 2 then
            task.wait(8 / SpawnRate)
            if EnemyLimit(Limit3) < 2 then
                Spawn(Enemy3)
            end
        end

        if EnemyLimit(Limit3) < 2 then
            task.wait(6 / SpawnRate)
            if EnemyLimit(Limit3) < 2 then
                Spawn(Enemy3)
            end
        end

        task.wait(10 / SpawnRate)
        Spawn(Enemy1)

        task.wait(4 / SpawnRate)
        Spawn(Enemy1)

        if EnemyLimit(Limit4) < 3 then
            task.wait(16 / SpawnRate)
            if EnemyLimit(Limit4) < 3 then
                Spawn(Enemy4)
            end
        end

        task.wait(6 / SpawnRate)
        Spawn(Enemy2)

        if EnemyLimit(Limit3) < 2 then
            task.wait(6 / SpawnRate)
            if EnemyLimit(Limit3) < 2 then
                Spawn(Enemy3)
            end
        end

        if EnemyLimit(Limit5) < 2 then
            task.wait(5 / SpawnRate)
            if EnemyLimit(Limit5) < 2 then
                Spawn(Enemy5)
            end
        end

        if EnemyLimit(Limit6) < 2 then
            task.wait(8 / SpawnRate)
            if EnemyLimit(Limit6) < 2 then
                Spawn(Enemy6)
            end
        end

        task.wait(10 / SpawnRate)
        Spawn(Enemy1)

        task.wait(3 / SpawnRate)
        Spawn(Enemy1)

        task.wait(5 / SpawnRate)
        Spawn(Enemy2)

        if EnemyLimit(Limit7) < 3 then
            task.wait(6 / SpawnRate)
            if EnemyLimit(Limit7) < 3 then
                Spawn(Enemy7)
            end
        end

        task.wait(16 / SpawnRate)
        Spawn(Enemy2)

        task.wait(6 / SpawnRate)
        Spawn(Enemy2)

        if EnemyLimit(Limit3) < 2 then
            task.wait(8 / SpawnRate)
            if EnemyLimit(Limit3) < 2 then
                Spawn(Enemy3)
            end
        end

        if EnemyLimit(Limit4) < 3 then
            task.wait(16 / SpawnRate)
            if EnemyLimit(Limit4) < 3 then
                Spawn(Enemy4)
            end
        end

        task.wait(6 / SpawnRate)
        Spawn(Enemy2)

        if EnemyLimit(Limit5) < 2 then
            task.wait(8 / SpawnRate)
            if EnemyLimit(Limit5) < 2 then
                Spawn(Enemy5)
            end
        end

        if EnemyLimit(Limit5) < 2 then
            task.wait(8 / SpawnRate)
            if EnemyLimit(Limit5) < 2 then
                Spawn(Enemy5)
            end
        end

        task.wait(5 / SpawnRate)
        Spawn(Enemy2)

        task.wait(10 / SpawnRate)
        Spawn(Enemy1)

        task.wait(3 / SpawnRate)
        Spawn(Enemy1)

        if EnemyLimit(Limit8) < 2 then
            task.wait(20 / SpawnRate)
            if EnemyLimit(Limit8) < 2 then
                Spawn(Enemy8)
            end
        end

        if EnemyLimit(Limit6) < 2 then
            task.wait(6 / SpawnRate)
            if EnemyLimit(Limit6) < 2 then
                Spawn(Enemy6)
            end
        end

        task.wait(6 / SpawnRate)
        Spawn(Enemy2)

        if EnemyLimit(Limit7) < 3 then
            task.wait(8 / SpawnRate)
            if EnemyLimit(Limit7) < 3 then
                Spawn(Enemy7)
            end
        end

        task.wait(2 / SpawnRate)
    end
end


BaseFolder.ChildAdded:Connect(function(Child)
    if Child.Name == "Blue Base" and not BotThread then
        SandboxSettings:InvokeServer(unpack(SpawnTeamsSwap))
        SandboxSettings:InvokeServer(unpack(EnableHealthBars))
        BotThread = task.spawn(SpawnCycle)
    end
end)

BaseFolder.ChildRemoved:Connect(function(Child)
    if Child.Name == "Blue Base" and BotThread then
        task.cancel(BotThread)
        BotThread = nil
    end
end)
