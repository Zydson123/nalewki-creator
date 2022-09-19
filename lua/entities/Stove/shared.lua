ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Cooking stove"
ENT.Spawnable = true
ENT.Category = "tincture maker script"

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "AttachedSpot")
	self:NetworkVar("Float", 0, "CookCurrentTime")
	self:NetworkVar("Float", 1, "CookStartTime")
end