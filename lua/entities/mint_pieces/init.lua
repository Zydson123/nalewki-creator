AddCSLuaFile("shared.lua")

include("shared.lua")

--AddCSLuaFile("imgui.lua")
--local imgui = include("imgui.lua") 

function ENT:Initialize()

    self:SetModel("models/props_junk/watermelon01.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    --self:SetColor(color_black)
    --self:SetMaterial("models/debug/debugwhite")

    --CurTime() - ile serwer jest już działający (w sekundach)

    --self.timer = CurTime() --self.timer przechowa czas wtedy kiedy entity powstało

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
       
        phys:Wake()
         
    end
end