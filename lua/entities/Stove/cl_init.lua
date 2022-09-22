include("shared.lua")

local imgui = include("imgui.lua") 

function ENT:Draw()
    self:DrawModel()
    self.TimeLeft = 0
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
  if imgui.Entity3D2D(self, Vector(15.5, -25, 9), Angle(0, 90, 90), 0.1) then
        draw.RoundedBox(15, 0, 0, 500, 280, color_black)
    imgui.End3D2D()
  end

  if self:GetIsCooking() == true && self:GetIsReady() == false then
    if imgui.Entity3D2D(self, Vector(18, -25, 9), Angle(0, 90, 90), 0.1) then

      --print(self:GetCookCurrentTime(), self:GetCookEndTime())
      self.EndTime = self:GetCookCurrentTime() + self:GetCookEndTime()
      surface.SetDrawColor(Color(0,255,0))
      surface.DrawRect(480, 50, (CurTime()-self.EndTime)*75, 75)
      
    imgui.End3D2D()
    end
  end

  if self:GetIsReady() == true && self:GetIsCooking() == false then
    if imgui.Entity3D2D(self, Vector(19, -25, 9), Angle(0, 90, 90), 0.1) then

      surface.SetDrawColor(Color(255,255,255))
      draw.SimpleText("Sugar Syrup is ready for use!", imgui.xFont("!Roboto@30"), 10, 0)
      draw.SimpleText("Take out the pots to cook again", imgui.xFont("!Roboto@30"), 10, 30)

    imgui.End3D2D()
    end
  end

end