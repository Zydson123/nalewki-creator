AddCSLuaFile("shared.lua")
AddCSLuaFile("imgui.lua")

local imgui = include("imgui.lua") 
include("shared.lua")

--AddCSLuaFile("imgui.lua")
--local imgui = include("imgui.lua") 



function ENT:Initialize()
    self:SetModel("models/props_c17/metalPot001a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
	self.InStove = false
    self:SetOwner(world)

    self:SetIsFull(0)
    self.wateramount=0
    self.sugaramount=0

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
       
        phys:Wake()
         
    end
end

function ENT:StartTouch(ent)

    if ent:GetClass() == "sugar" && self.sugaramount==0 then
        
        self.sugaramount = self.sugaramount+1
        ent:Remove()
    end
    if ent:GetClass() == "water" && self.wateramount == 0  && self.sugaramount == 1 then
        self.wateramount = self.wateramount+1
        ent:Remove()
    end

end

function ENT:Think()

if self.wateramount == 1 and self.sugaramount == 1 then
    
    self:SetIsFull(1)

end
self:SetIsFull(1)

end