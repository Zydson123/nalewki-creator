AddCSLuaFile("shared.lua")
AddCSLuaFile("imgui.lua")
AddCSLuaFile("cl_init.lua")

util.AddNetworkString("start")
local imgui = include("imgui.lua") 
include("shared.lua")

--AddCSLuaFile("imgui.lua")
--local imgui = include("imgui.lua") 

function ENT:Initialize()

    self:SetModel("models/props_c17/furnitureStove001a.mdl")
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType(SIMPLE_USE)

    self:SetHealth(1000)

    self.delay = 1 --this is the time the water will cook for
	self:SetCookStartTime(CurTime())
	self:SetCookCurrentTime(1)
	self.endTime = CurTime() + self.delay --delay is the amount the water will cook, needs to be changed in both places to the same value to take effect

	self:SetTrigger(true)
    self.IsCooking = false

    self.spot1 = true
    self.spot2 = true
    self.spot3 = true
    self.spot4 = true

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
       
        phys:Wake()
         
    end

end

function ENT:Think()
    
    net.Receive("start", function(len,ply)
        if self.IsCooking == false then
            self.endTime = CurTime() + self.delay
            self.IsCooking = net.ReadBool()
        end
    end)

    if IsValid(self.attachedSpot) && self.IsCooking == true && self.spot1 == false || self.spot2 == false || self.spot3 == false || self.spot4 == false then

        if CurTime() >= self.endTime then
            local p = self.attachedSpot
            PrintMessage(HUD_PRINTTALK, "Done!!!")
            print(p)
            local pos = self:GetAngles():Up()

            p:SetMoveType(MOVETYPE_NONE)   

            p:SetPos(self:GetPos() + (self:GetAngles():Up() * -10) + (self:GetAngles():Forward() * 35))

            p:SetMoveType(MOVETYPE_VPHYSICS)   

            self.AttachedSpot = nil

		    self:SetAttachedSpot(nil)
            self.IsCooking = false

        end

    end
    
    --print(self.IsCooking)

end

function ENT:StartTouch(e)
    if e:GetClass() == "pot" && e:GetIsFull() == 1 && e:GetIsCooked() == 0 && self.IsCooking == false then
        if self.spot1 == true then
            self.attachedSpot = e
		    e.attachedSpot = self

            e:SetMoveType(MOVETYPE_VPHYSICS)

            --sets the pots spot into a certain spot on the stove
            e:SetPos(self:GetPos() + (self:GetAngles():Up() * 26) + (self:GetAngles():Right() * 12) + (self:GetAngles():Forward() * 5))
            e:SetAngles(self:GetAngles())
            e:SetParent(self)
            
            self:SetAttachedSpot(e)
            e:SetAttachedSpot2(1)
            print(e)
            print(e:GetAttachedSpot2())
            self.spot1 = false
            
        elseif self.spot2 == true then
            self.attachedSpot = e
		    e.attachedSpot = self       

            e:SetMoveType(MOVETYPE_NONE)

            --sets the pots spot into a certain spot on the stove
            e:SetPos(self:GetPos() + (self:GetAngles():Up() * 26) + (self:GetAngles():Right() * -12) + (self:GetAngles():Forward() * 5))
            e:SetAngles(self:GetAngles())
            e:SetParent(self)

            self:SetAttachedSpot(e)
            self.spot2 = false

        elseif self.spot3 == true then
            self.attachedSpot = e
		    e.attachedSpot = self    

            e:SetMoveType(MOVETYPE_NONE)
            --sets the pots spot into a certain spot on the stove
            e:SetPos(self:GetPos() + (self:GetAngles():Up() * 26) + (self:GetAngles():Right() * 12) + (self:GetAngles():Forward() * -10))
            e:SetAngles(self:GetAngles())
            e:SetParent(self)

            self:SetAttachedSpot(e)
            self.spot3 = false
        elseif self.spot4 == true then
            self.attachedSpot = e
		    e.attachedSpot = self

            e:SetMoveType(MOVETYPE_NONE)

            --sets the pots spot into a certain spot on the stove
            e:SetPos(self:GetPos() + (self:GetAngles():Up() * 26) + (self:GetAngles():Right() * -12) + (self:GetAngles():Forward() * -10))
            e:SetAngles(self:GetAngles())
            e:SetParent(self)

            self:SetAttachedSpot(e)
            self.spot4 = false
        end
    end
end