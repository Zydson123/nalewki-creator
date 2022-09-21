AddCSLuaFile("shared.lua")

include("shared.lua")

--AddCSLuaFile("imgui.lua")
--local imgui = include("imgui.lua") 

function ENT:Initialize()

    self:SetModel("models/props_lab/jar01a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetColor(color_white)
    --self:SetMaterial("models/debug/debugwhite")

    --CurTime() - ile serwer jest już działający (w sekundach)

    self.timer = CurTime()--self.timer przechowa czas wtedy kiedy entity powstało

    self.process = false
    self.ready = false
    self.vodkaamount = 0
    self.mintamount = 0
    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
       
        phys:Wake()
         
    end
end


function ENT:StartTouch(ent)

    if ent:GetClass() == "vodka" || ent:GetClass() == "mint_pieces" then
        if self.vodkaamount == 3 && self.mintamount == 5 then

        end
    end

    if ent:GetClass() == "vodka" && self.process == false && self.ready == false then
        if self.vodkaamount == 3 then

        else
            self.vodkaamount = self.vodkaamount + 1
            ent:Remove()
        end
    else if ent:GetClass() == "mint_pieces" && self.process == false && self.ready == false then
        if self.mintamount == 5 then

        else
            self.mintamount = self.mintamount + 1
            ent:Remove()
        end
    end
end
end

function ENT:Think()
        if self.vodkaamount == 3 && self.mintamount == 5 && self.ready == false && self.process == false then
            self.process = true
            self:SetColor(color_red)
        end

        if self.process == true then
        timer.Simple( 5, function ()
                self.ready = true
            end)
        end

        if self.ready == true && self.process == true then
            self:SetColor(color_green)
            self.vodkaamount = 0
            self.mintamount = 0
            self.process = false
        end

        if self.ready == false then
            
            self:SetColor(Color(0,255,255,255))

        end

        self.ready = true
        self.process = true
end