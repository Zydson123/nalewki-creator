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
	self:SetCookCurrentTime(self.delay)
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
        if self.IsCooking == false && self.spot1 == false then
            self.endTime = CurTime() + self.delay

            	self:SetCookStartTime(CurTime())
	            self:SetCookCurrentTime(self.delay)
            self.IsCooking = net.ReadBool()
        end
    end)

    if self.IsCooking == true then

        if CurTime() >= self.endTime then

            local p1 = self:GetSpotOne()
            local p2 = self:GetSpotTwo()
            local p3 = self:GetSpotThree()
            local p4 = self:GetSpotFour()

            print(p1, "- pot 1 ", p2, "- pot 2 ", p3, "- pot 3 ", p4, "- pot 4")

            if IsValid(p1) then
                p1:SetIsCooked(true)
                p1:SetAttachedSpot2(1)
                p1:SetStove(self)
            end
            if IsValid(p2) then
                p2:SetIsCooked(true)
                p2:SetAttachedSpot2(2)
                p2:SetStove(self)
            end
            if IsValid(p3) then
                p3:SetIsCooked(true)
                p3:SetAttachedSpot2(3)
                p3:SetStove(self)
            end
            if IsValid(p4) then
                p4:SetIsCooked(true)
                p4:SetAttachedSpot2(4)
                p4:SetStove(self)
            end

            
            if self.spot3 == false then
                p3:SetAttachedSpot2(3)
            end
            if self.spot4 == false then
                p4:SetAttachedSpot2(4)
            end

            PrintMessage(HUD_PRINTTALK, "Done!!!")

            self.IsCooking = false

        end

    end
    
    --print(self.IsCooking)

end

function ENT:EjectPot() 
        print("--------------------Ejecting starts now----------------------")
            local p1 = self:GetSpotOne()
            print("Ejected pot 1: ")
            print(p1:GetAttachedSpot2())
            print(p1)
            p1:SetParent()
            p1:SetMoveType(MOVETYPE_VPHYSICS)  
            p1:SetPos(self:GetPos() + (self:GetAngles():Up() * -10) + (self:GetAngles():Forward() * 35))
            self.spot1 = true
            p1:SetAttachedSpot2(0)
            self:SetSpotOne(nil)
end

function ENT:StartTouch(e)
    
    if e:GetClass() == "pot" && e:GetIsFull() == true && e:GetIsCooked() == false && self.IsCooking == false then
        
        if self.spot1 == true then
            print("uno")
            self:SetSpotOne(e)
            e.InStove = true

            e:SetMoveType(MOVETYPE_VPHYSICS)

            --sets the pots spot into a certain spot on the stove
            e:SetPos(self:GetPos() + (self:GetAngles():Up() * 26) + (self:GetAngles():Right() * 12) + (self:GetAngles():Forward() * 5))
            e:SetAngles(self:GetAngles())
            e:SetParent(self)
            
            e:SetAttachedSpot2(1)
            print(e)
            print(self:GetSpotOne(), "- pot 1 ", self:GetSpotTwo(), "- pot 2 ", self:GetSpotThree(), "- pot 3 ", self:GetSpotFour(), "- pot 4")
            
            self.spot1 = false        
        elseif self.spot2 == true then
            print("dos")
            self:SetSpotTwo(e)
            local p2 = self:GetSpotTwo()
            p2.InStove = true  

            p2:SetMoveType(MOVETYPE_VPHYSICS)

            --sets the pots spot into a certain spot on the stove
            p2:SetPos(self:GetPos() + (self:GetAngles():Up() * 26) + (self:GetAngles():Right() * -12) + (self:GetAngles():Forward() * 5))
            p2:SetAngles(self:GetAngles())
            p2:SetParent(self)

            print(p2)

            p2:SetAttachedSpot2(2)
            print(self:GetSpotOne(), "- pot 1 ", self:GetSpotTwo(), "- pot 2 ", self:GetSpotThree(), "- pot 3 ", self:GetSpotFour(), "- pot 4")

            self.spot2 = false
        elseif self.spot3 == true then
            print("tres")
            self:SetSpotThree(e)
            local p3 = self:GetSpotThree()
            p3.InStove = true 

            p3:SetMoveType(MOVETYPE_VPHYSICS)

            --sets the pots spot into a certain spot on the stove
            p3:SetPos(self:GetPos() + (self:GetAngles():Up() * 26) + (self:GetAngles():Right() * 12) + (self:GetAngles():Forward() * -10))
            --p3:SetAngles(self:GetAngles())
            p3:SetParent(self)

            p3:SetAttachedSpot2(3)
            print(p3)
            print(self:GetSpotOne(), "- pot 1 ", self:GetSpotTwo(), "- pot 2 ", self:GetSpotThree(), "- pot 3 ", self:GetSpotFour(), "- pot 4")

            self.spot3 = false        
        elseif self.spot4 == true then
            print("Cuatro")
            self:SetSpotFour(e)
            local p4 = self:GetSpotFour()
            p4.InStove = true

            p4:SetMoveType(MOVETYPE_VPHYSICS)

            --sets the pots spot into a certain spot on the stove
            p4:SetPos(self:GetPos() + (self:GetAngles():Up() * 26) + (self:GetAngles():Right() * -12) + (self:GetAngles():Forward() * -10))
            --p4:SetAngles(self:GetAngles())
            p4:SetParent(self)


            p4:SetAttachedSpot2(4)
            print(p4)
            print(self:GetSpotOne(), "- pot 1 ", self:GetSpotTwo(), "- pot 2 ", self:GetSpotThree(), "- pot 3 ", self:GetSpotFour(), "- pot 4")

            self.spot4 = false
        end 
    end
end