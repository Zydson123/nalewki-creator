AddCSLuaFile("shared.lua")

include("shared.lua")

--AddCSLuaFile("imgui.lua")
--local imgui = include("imgui.lua") 

function ENT:Initialize()

    self:SetModel("models/props_junk/MetalBucket01a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self.delay = 3 --delay is the amount the finishing process will take

    self:SetCurrentTime(CurTime())
	self:SetEndTime(self.delay)

    self.endTime = CurTime() + self.delay

    self:SetTheFilter(nil)

    self:SetIsFilter(false)

    self:SetIsVodka(false) --I didn't know how to name this, this is just a bool for the ready thing in jar

    self:SetVodkaAmount(0)

    self:SetIsReady(false)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
       
        phys:Wake()
         
    end
end

function ENT:Touch(e) 

    --sets up the filter
    if e:GetClass() == "filter" then
        if e:GetFilterBroken() == false then
            print(e) 
            e:SetPos(self:GetPos() + (self:GetAngles():Up() * 8.5) + (self:GetAngles():Right() * 12) + (self:GetAngles():Forward() * 5))
            e:SetAngles(self:GetAngles())
            e:SetParent(self)
            self:SetIsFilter(true)
            self.TheFilter = e
        end
    end

    --filters the mint pieces out of the jar
    if e:GetClass() == "jar" && self:GetIsFilter() == true then
        
        if e.ready == true then

            self:SetIsVodka(true)
            self:SetVodkaAmount(1500)
            local Filter = self.TheFilter
            print("pies", Filter, self:GetVodkaAmount(), self:GetIsVodka())
            Filter:SetFilterBroken(true)
            Filter:SetTheStation(self)
            e.ready = false
            
        end

    end

    --add sugar syrup
    if e:GetClass() == "pot" && self:GetIsFilter() == false && self:GetIsVodka() == true && self:GetSugarSyrupAmount() == 0 then
        if e:GetIsCooked() == true then
            self:SetSugarSyrupAmount(1000)
            print(self:GetSugarSyrupAmount())
            self:SetIsReady(true)
            e:SetIsCooked(false)            
        end

    end

end

function ENT:Use(c,a)
    --finishes the process when everything is added
    if self:GetIsReady() == true && self:GetIsFinish() == false then
        self.endTime = CurTime() + self.delay --updates the time the finishing will take
        self:SetCurrentTime(CurTime())
	    self:SetEndTime(self.delay)
        print("the finishing process is starting!")
        self:SetIsFinish(true)
    end
end

function ENT:Think()

    if self:GetIsFinish() == true then
        if CurTime() >= self.endTime then
            print("Tincture is ready!")
            self:SetTinctureAmount(2500) -- sets the amount of the ready product ready to get poured into the ready bottles
            self:SetIsFinish(false)
            self:SetIsReady(false)
        end
    end

end