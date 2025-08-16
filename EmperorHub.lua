local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Emperor Hub | Blue Lock: Rivals (Reworked)",
   Icon = 116346018087278,
   LoadingTitle = "Emperor Hub | Blue Lock: Rivals (Reworked)",
   LoadingSubtitle = "by SoyDevWin",
   Theme = "Serenity",
   ToggleUIKeybind = "K",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "EmperorHub",
      FileName = "Emperor Hub"
   },
   DisableRayfieldPrompts = true, 
   DisableBuildWarnings = true,   
   
   Discord = {
      Enabled = true,
      Invite = "https://discord.gg/R9Cg8rgrcT",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Emperor Keys",
      Subtitle = "Key System",
      Note = "the keys are: OneEyedGhoul, MichaelKaiser",
      FileName = "Key",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {"OneEyedGhoul", "oneeyedghoul", "MichaelKaiser", "michaelkaiser"}
   }
})

local sharkStealActive = false
local lastSharkTime = 0
local sharkCooldown = 3
local sharkDistance = 15

local VulnTab = Window:CreateTab("Vuln", 14502433595)
local KuronaTab = Window:CreateTab("Kurona", 10164183611) 
local StylesTab = Window:CreateTab("Styles", 18720028391)
local MobileTab = Window:CreateTab("Mobile", 5261794391)
local CodesTab = Window:CreateTab("Codes", 88893754691906)

local ParagraphCreator = StylesTab:CreateParagraph({
   Title = ":3",
   Content = "the custom styles that will be here are completely OP's."
})

local ButtonDiddyStyle = StylesTab:CreateButton({
   Name = "Diddy Style",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/p2K9298sigkahot/Ambatukammmm/refs/heads/main/PornhubMadeByP2K"))()
      Rayfield:Notify({
         Title = "W",
         Content = "👀. agora eles precisam ter cuidado por onde sentam.",
         Duration = 3,
         Image = 10653378249
      })
   end
})

local ParagraphCreator = VulnTab:CreateParagraph({
   Title = "SoyDevWin:",
   Content = "use this script as you wish. 😈"
})

local SectionHitbox = VulnTab:CreateSection("Hitbox Settings")

local hitboxSize = 5
local hitboxActive = false
local hitboxParts = {}

local function createInvisibleHitbox(player)
    if hitboxParts[player] then return end
    
    local fakePart = Instance.new("Part")
    fakePart.Name = "InvisibleHitbox"
    fakePart.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
    fakePart.Transparency = 1
    fakePart.CanCollide = true
    fakePart.Anchored = false
    fakePart.Massless = true
    
    local weld = Instance.new("WeldConstraint")
    weld.Part0 = player.Character.HumanoidRootPart
    weld.Part1 = fakePart
    
    fakePart.Parent = workspace
    weld.Parent = fakePart
    
    hitboxParts[player] = fakePart
end

local function updateHitboxes()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if hitboxActive then
                createInvisibleHitbox(player)
                if hitboxParts[player] then
                    hitboxParts[player].Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                end
            else
                if hitboxParts[player] then
                    hitboxParts[player]:Destroy()
                    hitboxParts[player] = nil
                end
            end
        end
    end
end

local ButtonHitbox = VulnTab:CreateButton({
   Name = "Expand Hitbox",
   Callback = function()
      hitboxActive = not hitboxActive
      updateHitboxes()
      Rayfield:Notify({
         Title = "Hitbox",
         Content = hitboxActive and ("ON (Size: "..hitboxSize..")") or "OFF",
         Duration = 3,
         Image = 116346018087278
      })
   end
})

local SliderHitbox = VulnTab:CreateSlider({
   Name = "Hitbox Size",
   Range = {1, 15}, 
   Increment = 0.5,
   Suffix = "m",
   CurrentValue = 5,
   Callback = function(Value)
      hitboxSize = Value
      if hitboxActive then
         updateHitboxes()
      end
   end
})

local SectionAuto = VulnTab:CreateSection("Cold ")

local autoSlideActive = false
local ButtonAutoSlide = VulnTab:CreateButton({
   Name = "Auto Steal (Delayed)",
   Callback = function()
      autoSlideActive = not autoSlideActive
      Rayfield:Notify({
         Title = "Auto Slide",
         Content = autoSlideActive and "ON" or "OFF",
         Duration = 3,
         Image = 116346018087278
      })
   end
})

local stealDistance = 25 
local SliderStealDistance = VulnTab:CreateSlider({
   Name = "Steal Distance",
   Range = {10, 50}, 
   Increment = 1,
   Suffix = "m",
   CurrentValue = 25,
   Callback = function(Value)
      stealDistance = Value
   end
})

local autoDribleActive = false
local dribleArgs = {"fd4e3f5f5e10484b9cd7a5b7efe5f228"}
local ButtonAutoDrible = VulnTab:CreateButton({
   Name = "Auto Drible ",
   Callback = function()
      autoDribleActive = not autoDribleActive
      Rayfield:Notify({
         Title = "Auto Drible",
         Content = autoDribleActive and "ON" or "OFF",
         Duration = 3,
         Image = 116346018087278
      })
   end
})

local SectionPlayer = VulnTab:CreateSection("Player")

local infStaminaActive = false
local ButtonInfStamina = VulnTab:CreateButton({
   Name = "Inf Stamina",
   Callback = function()
      infStaminaActive = not infStaminaActive
      Rayfield:Notify({
         Title = "Stamina Infinita",
         Content = infStaminaActive and "ON" or "OFF",
         Duration = 3,
         Image = 116346018087278
      })
   end
})

local ButtonNoCooldown = VulnTab:CreateButton({
   Name = "No Cooldown's",
   Callback = function()
      for i, v in pairs(getgc(true)) do
         if typeof(v) == "table" then
            for key, value in pairs(v) do
               if tostring(key):lower():find("cooldown") then
                  if typeof(value) == "number" then
                     v[key] = 0
                  elseif typeof(value) == "function" then
                     v[key] = function() return 0 end
                  end
               end
            end
         end
      end
      Rayfield:Notify({
         Title = "No Cooldown",
         Content = "Done.",
         Duration = 5,
         Image = 116346018087278
      })
   end
})

local SectionMain = VulnTab:CreateSection("Nothing.")

local ButtonKill = VulnTab:CreateButton({
   Name = "Kill",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end
})

local SectionKurona = KuronaTab:CreateSection("Kurona Tricks")

local ButtonSharkSteal = KuronaTab:CreateButton({
   Name = "Shark Steal",
   Callback = function()
      sharkStealActive = not sharkStealActive
      Rayfield:Notify({
         Title = "Shark Steal",
         Content = sharkStealActive and "ON" or "OFF",
         Duration = 3,
         Image = 116346018087278
      })
   end
})

local SliderSharkRange = KuronaTab:CreateSlider({
   Name = "Activation Distance ",
   Range = {5, 30},
   Increment = 1,
   Suffix = "m",
   CurrentValue = 15,
   Callback = function(Value)
      sharkDistance = Value
   end
})

local SliderSharkCooldown = KuronaTab:CreateSlider({
   Name = "Waiting Time",
   Range = {0.1, 10}, 
   Increment = 0.1,
   Suffix = "s",
   CurrentValue = 3,
   Callback = function(Value)
      sharkCooldown = Value
   end
})

game:GetService("RunService").Heartbeat:Connect(function()
   local player = game.Players.LocalPlayer
   if not player or not player.Character then return end
   
   local hrp = player.Character:FindFirstChild("HumanoidRootPart")
   if not hrp then return end
   
   for _, other in ipairs(game.Players:GetPlayers()) do
      if other ~= player and other.Character then
         local otherHrp = other.Character:FindFirstChild("HumanoidRootPart")
         if otherHrp then
            local distance = (hrp.Position - otherHrp.Position).Magnitude
            
            if distance < 25 then
               if autoSlideActive then
                  game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BallService"):WaitForChild("RE"):WaitForChild("Slide"):FireServer()
               end
               
               if autoDribleActive then
                  game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BallService"):WaitForChild("RE"):WaitForChild("Dribble"):FireServer(unpack(dribleArgs))
               end
            end
           
            if sharkStealActive and distance <= sharkDistance and (tick() - lastSharkTime) >= sharkCooldown then
               pcall(function()
                  local args = {
                     "SharkSteal",
                     other.Character
                  }
                  game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("AbilityService"):WaitForChild("RE"):WaitForChild("Ability"):FireServer(unpack(args))
                  lastSharkTime = tick()
               end)
            end
         end
      end
   end
   
   if hitboxActive then
      updateHitboxes()
   end
   
   if infStaminaActive then
      pcall(function()
         local stats = player:FindFirstChild("PlayerStats")
         if stats then
            local stamina = stats:FindFirstChild("Stamina")
            if stamina and stamina:IsA("NumberValue") then
               stamina.Value = 100
            end
         end
      end)
   end
end)

game:GetService("UserInputService").WindowFocusReleased:Connect(function()
   for _, part in pairs(hitboxParts) do
      part:Destroy()
   end
   hitboxParts = {}
end)

local SectionCodes = CodesTab:CreateSection("Code Redemption")

local validCodes = {
    "CHARLESTIME",
    "TONGUESOUT", 
    "DELAYSORRY",
    "1.5GOALHIT"
}

local function redeemCode(code)
    pcall(function()
        local args = {code}
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodesService"):WaitForChild("RF"):WaitForChild("Redeem"):InvokeServer(unpack(args))
    end)
end

local ButtonRedeemAll = CodesTab:CreateButton({
    Name = "Redeem all Codes",
    Callback = function()
        for _, code in pairs(validCodes) do
            redeemCode(code)
            task.wait(0.5) 
        end
        Rayfield:Notify({
            Title = "W",
            Content = "all codes have been redeemed.",
            Duration = 5,
            Image = 116346018087278
        })
    end
})

local ParagraphCreator = MobileTab:CreateParagraph({ 
   Title = "OwO",
   Content = "these functions are made just for fun and are made for mobile only."
})

local SectionMobile = MobileTab:CreateSection("Mobile Shortcuts")

local emoteActive = false

local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Player = game:GetService("Players").LocalPlayer

MobileTab:CreateToggle({
    Name = "Emote :3",
    CurrentValue = false,
    Callback = function(Value)
        emoteActive = Value
        if emoteActive then
            
            local gui = game:GetService("CoreGui"):FindFirstChild("EmoteButton") or Instance.new("ScreenGui")
            gui.Name = "EmoteButton"
            gui.ResetOnSpawn = false
            gui.IgnoreGuiInset = true
            gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            gui.Parent = game:GetService("CoreGui")

            local btn = gui:FindFirstChild("EmoteToggle") or Instance.new("ImageButton")
            btn.Name = "EmoteToggle"
            btn.Size = UDim2.new(0, 60, 0, 60)
            btn.Position = UDim2.new(1, -60, 0.5, -40)
            btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            btn.Image = "rbxassetid://113747851300451"
            btn.ScaleType = Enum.ScaleType.Fit
            btn.AutoButtonColor = true
            btn.ZIndex = 999
            btn.Parent = gui

            local corner = btn:FindFirstChild("UICorner") or Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 40)
            corner.Parent = btn

            btn.MouseButton1Click:Connect(function()
            
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.X, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.X, false, game)
            end)

            
            local dragging, dragStart, startPos = false
            btn.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    dragStart = input.Position
                    startPos = btn.Position
                end
            end)

            UIS.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)

            RunService.RenderStepped:Connect(function()
                if dragging then
                    local delta = UIS:GetMouseLocation() - dragStart
                    btn.Position = UDim2.new(
                        startPos.X.Scale,
                        startPos.X.Offset + math.floor(delta.X * 0.4),
                        startPos.Y.Scale,
                        startPos.Y.Offset + math.floor(delta.Y * 0.4)
                    )
                end
            end)
        else
      
            local gui = game:GetService("CoreGui"):FindFirstChild("EmoteButton")
            if gui then
                gui:Destroy()
            end
        end
        Rayfield:Notify({
            Title = "Emote :3",
            Content = emoteActive and "ON" or "OFF",
            Duration = 2,
            Image = 10653372143
        })
    end
})

local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Player = game:GetService("Players").LocalPlayer

local function CreateToggleButton()
    local gui = Instance.new("ScreenGui")
    gui.Name = "ToggleFluentUI"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = Player:WaitForChild("PlayerGui")

    local btn = Instance.new("ImageButton")
    btn.Name = "ZToggle"
    btn.Size = UDim2.new(0, 40, 0, 40)
    btn.Position = UDim2.new(1, -40, 0.5, 70)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.Image = "rbxassetid://110103893163146"
    btn.ScaleType = Enum.ScaleType.Fit
    btn.AutoButtonColor = true
    btn.ZIndex = 999
    btn.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 40)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.K, false, game)
        task.wait(0.1)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.K, false, game)
    end)

    local dragging, dragStart, startPos = false

    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = btn.Position
        end
    end) 

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    RunService.RenderStepped:Connect(function()
        if dragging then
            local delta = UIS:GetMouseLocation() - dragStart
            btn.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + math.floor(delta.X * 0.4),
                startPos.Y.Scale,
                startPos.Y.Offset + math.floor(delta.Y * 0.4)
            )
        end
    end)
end

CreateToggleButton()
Rayfield:LoadConfiguration()
