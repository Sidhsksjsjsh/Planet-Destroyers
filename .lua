local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Capsules")
local T3 = wndw:Tab("Upgrades")

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
  }
}


local function getChild(path,funct)
  for i,v in pairs(path:GetChildren()) do
    funct(v)
  end
end

getChild(workspace.Scripts.Islands,function(i)
    getChild(i.Capsules,function(v)
        getChild(v,function(array)
            if array.Name ~= "StandInfo" then
              table.insert(var.capsule.table,array.Name)
            end
        end)
    end)
end)

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
