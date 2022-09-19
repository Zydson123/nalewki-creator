ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Mixing pot"
ENT.Spawnable = true
ENT.Category = "tincture maker script"

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "IsFull")
	self:NetworkVar("Int", 1, "IsCooked")
	self:NetworkVar("Int", 0, "AttachedSpot2")
end