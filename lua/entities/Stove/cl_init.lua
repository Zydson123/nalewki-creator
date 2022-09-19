include("shared.lua")

local imgui = include("imgui.lua") 

function ENT:Draw()
    self:DrawModel()
end

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:DrawTranslucent()
  if imgui.Entity3D2D(self, Vector(15, -25, 14), Angle(0, 90, 90), 0.1) then
    if imgui.xTextButton("Start Cooking", "!Roboto@24", 0, 0, 500, 50, 1, Color(255,255,255), Color(0,0,255), Color(255,0,0)) then
        print("Coocking starts now")
        net.Start("start")
            net.WriteBool(true)
        net.SendToServer()
    end
    imgui.End3D2D()
  end
  if imgui.Entity3D2D(self, Vector(15, -25, 8), Angle(0, 90, 90), 0.1) then
        draw.RoundedBox(15, 0, 0, 125, 280, color_black)
    imgui.End3D2D()
  end
  if imgui.Entity3D2D(self, Vector(15, -12, 8), Angle(0, 90, 90), 0.1) then
        draw.RoundedBox(15, 0, 0, 125, 280, color_black)
    imgui.End3D2D()
  end
  if imgui.Entity3D2D(self, Vector(15, 1, 8), Angle(0, 90, 90), 0.1) then
        draw.RoundedBox(15, 0, 0, 125, 280, color_black)
    imgui.End3D2D()
  end
  if imgui.Entity3D2D(self, Vector(15, 14, 8), Angle(0, 90, 90), 0.1) then
        draw.RoundedBox(15, 0, 0, 125, 280, color_black)
    imgui.End3D2D()
  end
end