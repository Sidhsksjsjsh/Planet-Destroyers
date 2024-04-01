local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Capsules")
local T3 = wndw:Tab("Upgrades")
local T4 = wndw:Tab("Units")

local workspace = game:GetService("Workspace")
local user = {
  self = game:GetService("Players").LocalPlayer,
  player = game:GetService("Players")
}

local var = {
  shoot = false,
  rebirth = false,
  orb = false,
  capsule = {
    table = {},
    toggle = false,
    selected = "null"
  },
  upgrade = {
    table = {"Gems Multiplier","Coins Multiplier","Luck Multiplier","XP Multiplier","Pistol Damage","Units Equip"}, -- without spaces
    toggle = false,
    selected = "null"
  },
  online = false,
  level = false,
  spin = false,
  shoot_signal = false,
  shoot_click = false,
  shoot_act = false,
  remote = {
    class = "BindableEvent",
    target = "Workspace",
    list = "",
    remotecopied = ""
  },
  units = {
    gold = false,
    rb = false,
    table = workspace["Scripts"]["Units"][user.self.Name],
    usename = true,
    name = "null"
  }
}


local function getChild(path,funct)
  for i,v in pairs(path:GetChildren()) do
    funct(v)
  end
end

--[[
local args = {
    [1] = 1
}

game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimPlaytimeReward"]:InvokeServer(unpack(args))

]]

lib:AddTable(game:GetService("ReplicatedStorage").Assets.Capsules,var.capsule.table)

T1:Toggle("Auto shoot planet",false,function(value)
    var.shoot = value
    while wait() do
      if var.shoot == false then break end
      getChild(workspace.Scripts.Islands,function(v)
          getChild(v.Planet,function(a)
              game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["IslandService"]["RE"]["Damage"]:FireServer(a.Name)
          end)
      end)
    end
end)

--[[if user.self.Name == "Rivanda_Cheater" then
T1:Toggle("Auto shoot planet with firesignal()",false,function(value)
    var.shoot_signal = value
    while wait() do
      if var.shoot_signal == false then break end
      getChild(workspace.Scripts.Islands,function(v)
          getChild(v.Planet,function(a)
                getChild(a,function(i)
                    if i:IsA("ClickDetector") then
                      firesignal(i.MouseClick)
                    else
                      lib:notify(lib:ColorFonts("Missing ClickDetector","Red"),10)
                    end
                end)
          end)
      end)
    end
end)

T1:Toggle("Auto shoot planet with :Activated()",false,function(value)
    var.shoot_act = value
    while wait() do
      if var.shoot_act == false then break end
      getChild(workspace.Scripts.Islands,function(v)
          getChild(v.Planet,function(a)
                getChild(a,function(i)
                    if i:IsA("ClickDetector") then
                      i:Activated()
                    else
                      lib:notify(lib:ColorFonts("Missing ClickDetector","Red"),10)
                    end
                end)
          end)
      end)
    end
end)

T1:Toggle("Auto shoot planet with :MouseClick()",false,function(value)
    var.shoot_click = value
    while wait() do
      if var.shoot_click == false then break end
      getChild(workspace.Scripts.Islands,function(v)
          getChild(v.Planet,function(a)
                getChild(a,function(i)
                    if i:IsA("ClickDetector") then
                      i:MouseClick()
                    else
                      lib:notify(lib:ColorFonts("Missing ClickDetector","Red"),10)
                    end
                end)
          end)
      end)
    end
end)
end]]

T1:Toggle("Auto rebirth",false,function(value)
    var.rebirth = value
    while wait() do
      if var.rebirth == false then break end
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RebirthService"]["RF"]["Rebirth"]:InvokeServer()
    end
end)

T1:Toggle("Auto bring orbs",false,function(value)
    var.orb = value
    while wait() do
      if var.orb == false then break end
      getChild(workspace.Scripts.Islands,function(v)
          getChild(v.Debris.Orbs.Storage,function(i)
              i.Position = user.self.Character.HumanoidRootPart.Position
          end)
      end)
    end
end)

T1:Toggle("Auto claim online rewards",false,function(value)
    var.online = value
    while wait() do
      if var.online == false then break end
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimPlaytimeReward"]:InvokeServer(1)
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimPlaytimeReward"]:InvokeServer(2)
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimPlaytimeReward"]:InvokeServer(3)
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimPlaytimeReward"]:InvokeServer(4)
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimPlaytimeReward"]:InvokeServer(5)
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimPlaytimeReward"]:InvokeServer(6)
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimPlaytimeReward"]:InvokeServer(7)
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimPlaytimeReward"]:InvokeServer(8)
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimPlaytimeReward"]:InvokeServer(9)
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimPlaytimeReward"]:InvokeServer(10)
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimPlaytimeReward"]:InvokeServer(11)
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimPlaytimeReward"]:InvokeServer(12)
    end
end)

T1:Toggle("Auto next level",false,function(value)
    var.level = value
    while wait() do
      if var.level == false then break end
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["IslandService"]["RF"]["nextLevel"]:InvokeServer()
    end
end)

T1:Toggle("Auto spin",false,function(value)
    var.spin = value
    while wait() do
      if var.spin == false then break end
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["spin"]:InvokeServer()
    end
end)

T2:Dropdown("Select capsule",var.capsule.table,function(value)
    var.capsule.selected = value
end)

T2:Toggle("Open capsule",false,function(value)
    var.capsule.toggle = value
    while wait() do
      if var.capsule.toggle == false then break end
      if var.capsule.selected ~= "null" then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["CapsuleService"]["RF"]["OpenCapsule"]:InvokeServer(var.capsule.selected,"single")
      else
        lib:notify(lib:ColorFonts("Hope u choose the right capsule","Red"),10)
        var.capsule.toggle = false
      end
    end
end)

T3:Dropdown("Select upgrade",var.upgrade.table,function(value)
    var.upgrade.selected = value
end)

T3:Toggle("Auto upgrade",false,function(value)
    var.upgrade.toggle = value
    while wait() do
      if var.upgrade.toggle == false then break end
      if var.upgrade.selected ~= "null" then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["UpgradeService"]["RF"]["Upgrade"]:InvokeServer(var.upgrade.selected:gsub(" ",""))
      else
        lib:notify(lib:ColorFonts("BRO THE DROPDOWN IS NIL, PLS CHOOSE ONE 💀😭","Red"),10)
        var.upgrade.toggle = false
      end
    end
end)

T4:Textbox("Insert units ID",true,function(value)
    var.units.name = value
end)

T4:Toggle("Equipped units",true,function(value)
    var.units.usename = value
end)

local gt = T4:Toggle("Auto gold units",false,function(value) -- var.units.table[math.random(1,#var.units.table)]
    var.units.gold = value
    while wait() do
      if var.units.gold == false then break end
      if var.units.usename == true then
        if var.units.name ~= "null" then
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["UnitService"]["RF"]["Craft"]:InvokeServer({[var.units.name] = true,[var.units.name] = true,[var.units.name] = true,[var.units.name] = true,[var.units.name] = true},1)
        else
          lib:notify(lib:ColorFonts("PET ID IS NIL!! PLS INSERT IT!!","Red"),10)
        end
      else
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["UnitService"]["RF"]["Craft"]:InvokeServer({[var.units.table[math.random(1,#var.units.table)]] = true,[var.units.table[math.random(1,#var.units.table)]] = true,[var.units.table[math.random(1,#var.units.table)]] = true,[var.units.table[math.random(1,#var.units.table)]] = true,[var.units.table[math.random(1,#var.units.table)]] = true},1)
      end
    end
end)

local rbt = T4:Toggle("Auto rainbow units",false,function(value)
    var.units.rb = value
    while wait() do
      if var.units.rb == false then break end
      if var.units.usename == true then
        if var.units.name ~= "null" then
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["UnitService"]["RF"]["Craft"]:InvokeServer({[var.units.name] = true,[var.units.name] = true,[var.units.name] = true,[var.units.name] = true,[var.units.name] = true},2)
        else
          lib:notify(lib:ColorFonts("PET ID IS NIL!! PLS INSERT IT!!","Red"),10)
        end
      else
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["UnitService"]["RF"]["Craft"]:InvokeServer({[var.units.table[math.random(1,#var.units.table)]] = true,[var.units.table[math.random(1,#var.units.table)]] = true,[var.units.table[math.random(1,#var.units.table)]] = true,[var.units.table[math.random(1,#var.units.table)]] = true,[var.units.table[math.random(1,#var.units.table)]] = true},2)
      end
    end
end)

if user.self.Name == "Rivanda_Cheater" then
local T99 = wndw:Tab("Detections")
local lab = T99:Label(var.remote.list)
  
T99:Dropdown("Target detection",{"Workspace","ReplicatedStorage","Players"},function(value)
      var.remote.target = value
end)

T99:Dropdown("Remote type",{"BindableEvent","BindableFunction","RemoteEvent","RemoteFunction"},function(value)
      var.remote.class = value
end)

T99:Textbox("Remote name to copy",true,function(value)
      lib:notify(lib:ColorFonts("Copied to the clipboard","Green"),10)
      for i,v in pairs(game:GetService(var.remote.target):GetDescendants()) do
        if v:IsA(var.remote.class) and (string.sub(string.lower(v.Name),1,string.len(value))) == string.lower(value) then
          if var.remote.class == "BindableEvent" then
            setclipboard("game." .. v:GetFullName() .. ":Fire()")
          elseif var.remote.class == "BindableFunction" then
            setclipboard("game." .. v:GetFullName() .. ":Invoke()")
          elseif var.remote.class == "RemoteEvent" then
            setclipboard("game." .. v:GetFullName() .. ":FireServer()")
          elseif var.remote.class == "RemoteFunction" then
            setclipboard("game." .. v:GetFullName() .. ":InvokeServer()")
          end
        end
      end
end)
  
T99:Button("Start detect",function()
      lib:notify(lib:ColorFonts("Looking for the remote you're aiming for","Green"),10)
      var.remote.list = ""
      wait(1.5)
      for i,v in pairs(game:GetService(var.remote.target):GetDescendants()) do
        if v:IsA(var.remote.class) then
          if var.remote.class == "BindableEvent" then
            var.remote.list = var.remote.list .. "\n" .. lib:ColorFonts(v.Name,"Red") .. ":" .. lib:ColorFonts("Fire()","Yellow")
          elseif var.remote.class == "BindableFunction" then
            var.remote.list = var.remote.list .. "\n" .. lib:ColorFonts(v.Name,"Red") .. ":" .. lib:ColorFonts("Invoke()","Blue")
          elseif var.remote.class == "RemoteEvent" then
            var.remote.list = var.remote.list .. "\n" .. lib:ColorFonts(v.Name,"Red") .. ":" .. lib:ColorFonts("FireServer()","Yellow")
          elseif var.remote.class == "RemoteFunction" then
            var.remote.list = var.remote.list .. "\n" .. lib:ColorFonts(v.Name,"Red") .. ":" .. lib:ColorFonts("InvokeServer()","Blue")
          end
        end
      end
      lab:EditLabel(var.remote.list)
end)

T99:Button("Fire remote",function()
      lib:notify(lib:ColorFonts("Firing remote..","Green"),10)
      wait(1.5)
      for i,v in pairs(game:GetService(var.remote.target):GetDescendants()) do
        if v:IsA(var.remote.class) then
          if var.remote.class == "BindableEvent" then
            v:Fire()
          elseif var.remote.class == "BindableFunction" then
            v:Invoke()
          elseif var.remote.class == "RemoteEvent" then
            v:FireServer()
          elseif var.remote.class == "RemoteFunction" then
            v:InvokeServer()
          end
        end
      end
end)

T99:Toggle("Open 2nd exploit",false,function(value)
      lib:synapse(value)
end)

local T100 = wndw:Tab("Function Log")
local flog = T100:Label("")
local slog = false
  
T100:Button("Start logging",function()
      if slog == false then
        slog = true
        lib:SpyFunction(function(log)
            flog:EditLabel(log)
        end)
      end
end)
  
end --lib:synapse(bool) lib:SpyFunction(function(log)

lib:runtime(function()
    var.units.table = workspace["Scripts"]["Units"][user.self.Name]
    if var.units.usename == true then
      gt:EditText("Auto gold units [ EQUIPPED UNITS ]")
      rbt:EditText("Auto rainbow units [ EQUIPPED UNITS ]")
    else
      gt:EditText("Auto gold units [ SELECTED ID ]")
      rbt:EditText("Auto rainbow units [ SELECTED ID ]")
    end
end)
