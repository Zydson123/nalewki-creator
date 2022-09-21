ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Cooking stove"
ENT.Spawnable = true
ENT.Category = "tincture maker script"

function ENT:SetupDataTables()
	self:NetworkVar("Float", 0, "CookCurrentTime")
	self:NetworkVar("Float", 1, "CookStartTime")
	--all the spots
	self:NetworkVar("Entity", 0, "SpotOne")
	self:NetworkVar("Entity", 1, "SpotTwo")
	self:NetworkVar("Entity", 2, "SpotThree")
	self:NetworkVar("Entity", 3, "SpotFour")
end