AddCSLuaFile("shared.lua")
AddCSLuaFile("imgui.lua")

local imgui = include("imgui.lua") 
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_c17/metalPot001a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
	self.InStove = false

    self:SetIsFull(false)

    self:SetIsCooked(false)

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

function ENT:Use(a,c)
    

    if self:GetIsCooked() == true then
        local stove = self:GetStove()
        print(self)
        print(self:GetAttachedSpot2())
        self:SetParent()
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetPos(stove:GetPos() + (stove:GetAngles():Up() * -10) + (stove:GetAngles():Forward() * 35))

        if self:GetAttachedSpot2() == 1 then
            stove.spot1 = true
            stove:SetSpotOne(nil)
        end
        if self:GetAttachedSpot2() == 2 then
            stove.spot2 = true
            stove:SetSpotTwo(nil)
        end
        if self:GetAttachedSpot2() == 3 then
            stove.spot3 = true
            stove:SetSpotThree(nil)
        end
        if self:GetAttachedSpot2() == 4 then
            stove.spot4 = true
            stove:SetSpotFour(nil)
        end

    end

end
function ENT:Think()

if self.wateramount == 1 and self.sugaramount == 1 and self:GetIsFull() == false then
    

    self:SetIsFull(true)

end

self:SetIsFull(true)

end