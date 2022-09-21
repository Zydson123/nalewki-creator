ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Filtering station"
ENT.Spawnable = true
ENT.Category = "tincture maker script"

function ENT:SetupDataTables()

    self:NetworkVar("Entity",0,"TheFilter")

    self:NetworkVar("Bool", 0, "IsFilter") --this is the bool to tell if filter is on to show player the instrucion

    self:NetworkVar("Bool", 1, "IsReady") --this is the bool that makes you able start the finishing process

    self:NetworkVar("Bool", 2, "IsVodka") --I didn't know how to name this, this is just a bool for the ready thing in jar and its true when you pour it into the bucket
    
    self:NetworkVar("Bool", 3, "IsFinish") --this is here so the finishing process can start whenever this is set to true
    
    self:NetworkVar("Int", 0, "VodkaAmount") --This is the amount of the thing from the jar when ready in the bucket
    
    self:NetworkVar("Int", 1, "SugarSyrupAmount") --This is the amount of sugar syrup in the bucket (sugar syrup is the thing you make on the pot)
    
    self:NetworkVar("Int", 2, "TinctureAmount") --this is the amount of the finished product

	self:NetworkVar("Float", 0, "CurrentTime") --this is the current time when the finishing process started, here to help show how much time is left
    
	self:NetworkVar("Float", 1, "EndTime") --this is the time the finishing process is gonna take, again its here to display how much time is left

end