AddCSLuaFile("shared.lua")

include("shared.lua")

--AddCSLuaFile("imgui.lua")
--local imgui = include("imgui.lua") 

function ENT:Initialize()

    self:SetModel("models/props/de_inferno/potted_plant1.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    --self:SetColor(color_black)
    --self:SetMaterial("models/debug/debugwhite")

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
       
        phys:Wake()
         
    end
end

function ENT:Use(a,c)

    print("klik")
    local mintpieces = ents.Create("mint_pieces")
    mintpieces:SetPos(self:GetPos() + Vector(0,50,10))
    mintpieces:Spawn()

    local mintpieces = ents.Create("mint_pieces")
    mintpieces:SetPos(self:GetPos() + Vector(0,30,10))
    mintpieces:Spawn()

    local mintpieces = ents.Create("mint_pieces")
    mintpieces:SetPos(self:GetPos() + Vector(0,10,10))
    mintpieces:Spawn()
    self:Remove()

end