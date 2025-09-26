getgenv().Toggle = true -- This toggles the esp, turning it to false will turn it off
getgenv().TC = false -- This toggles team check, turning it on will turn on team check
local PlayerName = "Name" -- You can decide if you want the Player's name to be a display name which is "DisplayName", or username which is "Name"


local P = game:GetService("Players")
local LP = P.LocalPlayer


local DB = false


game.StarterGui:SetCore("SendNotification", {
    Title = "Notification",
    Text = "Best ESP by Qwiix21 with item and health display\n\nhttps://github.com/qwiix21/Roblox-ESP-script",
    Button1 = "Okay",
    Duration = math.huge
})


local function getHeldItemName(character)
    if not character then return "None" end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return "None" end
    

    local tool = character:FindFirstChildOfClass("Tool")
    if tool then
        return tool.Name
    end
    

    if humanoid:FindFirstChildOfClass("Tool") then
        return humanoid:FindFirstChildOfClass("Tool").Name
    end
    

    local player = P:GetPlayerFromCharacter(character)
    if player then
        local backpack = player:FindFirstChild("Backpack")
        if backpack then
            for _, item in ipairs(backpack:GetChildren()) do
                if item:IsA("Tool") and item.Enabled then
                    return item.Name
                end
            end
        end
    end
    
    return "None"
end


local function getHealthInfo(character)
    if not character then return "0/0" end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return "0/0" end
    
    local currentHealth = math.floor(humanoid.Health)
    local maxHealth = math.floor(humanoid.MaxHealth)
    
    return currentHealth .. "/" .. maxHealth
end


local function getHealthColor(character)
    if not character then return Color3.fromRGB(255, 255, 255) end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.MaxHealth == 0 then return Color3.fromRGB(255, 255, 255) end
    
    local healthPercent = humanoid.Health / humanoid.MaxHealth
    
    if healthPercent > 0.7 then
        return Color3.fromRGB(0, 255, 0) 
    elseif healthPercent > 0.3 then
        return Color3.fromRGB(255, 255, 0) 
    else
        return Color3.fromRGB(255, 0, 0) 
    end
end


while task.wait() do
    if not getgenv().Toggle then
        break
    end
    if DB then 
        return 
    end
    DB = true

    pcall(function()
        for i,v in pairs(P:GetChildren()) do
            if v:IsA("Player") then
                if v ~= LP then
                    if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then

                        local pos = math.floor(((LP.Character:FindFirstChild("HumanoidRootPart")).Position - (v.Character:FindFirstChild("HumanoidRootPart")).Position).magnitude)
                        
                        
                        local heldItem = getHeldItemName(v.Character)
                        local healthInfo = getHealthInfo(v.Character)
                        local healthColor = getHealthColor(v.Character)
                        
                        local itemText = ""
                        if heldItem ~= "None" then
                            itemText = " | Item: " .. heldItem
                        end

                        if v.Character:FindFirstChild("Totally NOT Esp") == nil and v.Character:FindFirstChild("Icon") == nil and getgenv().TC == false then
                            
                            local ESP = Instance.new("Highlight", v.Character)

                            ESP.Name = "Totally NOT Esp"
                            ESP.Adornee = v.Character
                            ESP.Archivable = true
                            ESP.Enabled = true
                            ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            ESP.FillColor = v.TeamColor.Color
                            ESP.FillTransparency = 0.5
                            ESP.OutlineColor = Color3.fromRGB(255, 255, 255)
                            ESP.OutlineTransparency = 0

                            
                            local Icon = Instance.new("BillboardGui", v.Character)
                            local ESPText = Instance.new("TextLabel")

                            Icon.Name = "Icon"
                            Icon.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            Icon.Active = true
                            Icon.AlwaysOnTop = true
                            Icon.ExtentsOffset = Vector3.new(0, 1, 0)
                            Icon.LightInfluence = 1.000
                            Icon.Size = UDim2.new(0, 800, 0, 50)

                            ESPText.Name = "ESP Text"
                            ESPText.Parent = Icon
                            ESPText.BackgroundColor3 = v.TeamColor.Color
                            ESPText.BackgroundTransparency = 1.000
                            ESPText.Size = UDim2.new(0, 800, 0, 50)
                            ESPText.Font = Enum.Font.SciFi
                            ESPText.Text = v[PlayerName].." | HP: "..healthInfo.." | Distance: "..pos..itemText
                            ESPText.TextColor3 = healthColor 
                            ESPText.TextSize = 10.800
                            ESPText.TextWrapped = true
                        else
                            if v.TeamColor ~= LP.TeamColor and v.Character:FindFirstChild("Totally NOT Esp") == nil and v.Character:FindFirstChild("Icon") == nil and getgenv().TC == true then
                                
                                local ESP = Instance.new("Highlight", v.Character)

                                ESP.Name = "Totally NOT Esp"
                                ESP.Adornee = v.Character
                                ESP.Archivable = true
                                ESP.Enabled = true
                                ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                ESP.FillColor = v.TeamColor.Color
                                ESP.FillTransparency = 0.5
                                ESP.OutlineColor = Color3.fromRGB(255, 255, 255)
                                ESP.OutlineTransparency = 0

                                
                                local Icon = Instance.new("BillboardGui", v.Character)
                                local ESPText = Instance.new("TextLabel")

                                Icon.Name = "Icon"
                                Icon.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                Icon.Active = true
                                Icon.AlwaysOnTop = true
                                Icon.ExtentsOffset = Vector3.new(0, 1, 0)
                                Icon.LightInfluence = 1.000
                                Icon.Size = UDim2.new(0, 800, 0, 50)

                                ESPText.Name = "ESP Text"
                                ESPText.Parent = Icon
                                ESPText.BackgroundColor3 = v.TeamColor.Color
                                ESPText.BackgroundTransparency = 1.000
                                ESPText.Size = UDim2.new(0, 800, 0, 50)
                                ESPText.Font = Enum.Font.SciFi
                                ESPText.Text = v[PlayerName].." | HP: "..healthInfo.." | Distance: "..pos..itemText
                                ESPText.TextColor3 = healthColor 
                                ESPText.TextSize = 10.800
                                ESPText.TextWrapped = true
                            else
                                if v.Character:FindFirstChild("Totally NOT Esp") and v.Character:FindFirstChild("Icon") then
                                    if not v.Character:FindFirstChild("Totally NOT Esp").FillColor == v.TeamColor.Color then
                                        v.Character:FindFirstChild("Totally NOT Esp").FillColor = v.TeamColor.Color
                                    end
                                    
                                    if v.Character:FindFirstChild("Totally NOT Esp").Enabled == false and v.Character:FindFirstChild("Icon").Enabled == false then
                                        v.Character:FindFirstChild("Totally NOT Esp").Enabled = true
                                        v.Character:FindFirstChild("Icon").Enabled = true
                                    else
                                        if v.Character:FindFirstChild("Icon") then
                                            local heldItem = getHeldItemName(v.Character)
                                            local healthInfo = getHealthInfo(v.Character)
                                            local healthColor = getHealthColor(v.Character)
                                            
                                            local itemText = ""
                                            if heldItem ~= "None" then
                                                itemText = " | Item: " .. heldItem
                                            end
                                            
                                            v.Character:FindFirstChild("Icon")["ESP Text"].Text = v[PlayerName].." | HP: "..healthInfo.." | Distance: "..pos..itemText
                                            v.Character:FindFirstChild("Icon")["ESP Text"].TextColor3 = healthColor
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    wait()

    DB = false
end 