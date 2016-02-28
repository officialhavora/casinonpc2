include("shared.lua");
ENT.RenderGroup = RENDERGROUP_BOTH;

surface.CreateFont("CasinoFont", {
	font = "Arial",
	size = 48,
	weight = 600,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
});

function ENT:Draw()
    self:DrawModel();
   
    local ang = self:GetAngles();
   
    ang:RotateAroundAxis(ang:Forward(), 90);
    ang:RotateAroundAxis(ang:Right(), -90);
   
    cam.Start3D2D(self:GetPos()+self:GetUp()*80, Angle(0, LocalPlayer():EyeAngles().y-90, 90), 0.175);
        draw.SimpleTextOutlined("Casino NPC 2", "DermaLarge", 0, 0, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_LEFT, 1, Color(25, 25, 25, 100));
    cam.End3D2D()
end;

function ENT:DrawTranslucent()
	self:Draw();
end;

function ENT:BuildBonePositions(NumBones, NumPhysBones)

end;
 
function ENT:SetRagdollBones(bIn)
	self.m_bRagdollSetup = bIn
end;

function ENT:DoRagdollBone(PhysBoneNum, BoneNum)

end;

