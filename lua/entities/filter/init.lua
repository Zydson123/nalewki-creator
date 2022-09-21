AddCSLuaFile("shared.lua")

include("shared.lua")

--AddCSLuaFile("imgui.lua")
--local imgui = include("imgui.lua") 

function ENT:Initialize()

    self:SetModel("models/props_junk/garbage_carboard002a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self:SetFilterBroken(false)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
       
        phys:Wake()
         
    end
end

function ENT:Use(a,c)
    local s = self:GetTheStation() --the station but in a var
    if self:GetFilterBroken(true) && s:GetIsFilter() == true then
        
        local s = self:GetTheStation() --the station but in a var
        self:SetParent()
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetPos(s:GetPos() + (s:GetAngles():Up() * -5) + (self:GetAngles():Forward() * -25))
        s:SetIsFilter(false)
        --self:SetMoveType(MOVETYPE_VPHYSICS)

    end

end

function ENT:Think()

    if self:GetFilterBroken() == true then
        self:SetColor(Color(0,255,0))
    else
        self:SetColor(Color(255,0,0))
    end

end