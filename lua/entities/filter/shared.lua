ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Coffee filter"
ENT.Spawnable = true
ENT.Category = "tincture maker script"

function ENT:SetupDataTables()

    self:NetworkVar("Bool",0,"FilterBroken")
    
    self:NetworkVar("Entity",0,"TheStation")

end