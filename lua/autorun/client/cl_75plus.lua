include("75plus/config.lua")

local CFG = CFG

-- Derma Fonts (Dont touch unless you know what you are doing) --

surface.CreateFont( "Welcome1", {
	font = "Roboto",
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
} )


surface.CreateFont( "Font1", {
	font = "Roboto",
	size = 20,
	weight = 500,
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
} )

surface.CreateFont( "Number1", {
	font = "Roboto",
	size = 40,
	weight = 500,
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
} )

surface.CreateFont( "WinFont1", {
	font = "Roboto",
	size = 15,
	weight = 500,
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
} )


-- math random dont touch --

local function RandNumber()
	return math.random(1, 100)
end

-- open things --

net.Receive("open_75plus", function()

	local wallet = LocalPlayer():getDarkRPVar("money") or 0
	local walletE = wallet

	local base = vgui.Create("DFrame")
	if ScrW() > 640 then
		base:SetSize( ScrW()*0.2, ScrH()*0.3 )
	else
		base:SetSize( 640, 480 )
	end
	base:SetTitle("")
	base:SetPos(ScrW()/2-base:GetWide()/2, ScrH()/2-base:GetTall()/2)
	base:ShowCloseButton(false)
	base:SetDraggable(false)
	base:MakePopup()

-- I RECOMMEND NOT TOUCHING DRAWLINE --	
	
	function base:Paint(w, h)
		draw.RoundedBox(3, 0, 0, w, h, Color(32,32,32)) // Background Coloring
		 surface.SetDrawColor(105,105,105) 
			surface.DrawLine(0, 25, base:GetWide(), 25)
			surface.DrawLine(0, 45, base:GetWide(), 45)
			surface.DrawLine(0, 80, base:GetWide(), 80)
			surface.DrawLine(0, 125, base:GetWide(), 125)
			surface.DrawLine(0, 165, base:GetWide(), 165)
			surface.DrawLine(0, 200, base:GetWide(), 200)
			surface.DrawLine(0, 240, base:GetWide(), 240)
			surface.DrawLine(0, 270, base:GetWide(), 270)
	end
	
	local welcometitle = vgui.Create("DLabel", base)
	welcometitle:SetColor(Color(0,255,63,255))
	welcometitle:SetFont("Welcome1")
	welcometitle:SetPos(10, 10)
	welcometitle:SetSize(500, 50)
	welcometitle:SetText("Welcome to the NPC Casino")

	
	local cashtitle = vgui.Create("DLabel", base)
	cashtitle:SetColor(Color(0,255,63,255))
	cashtitle:SetFont("DermaLarge")
	cashtitle:SetPos(23, 40)
	cashtitle:SetSize(500, 50)
	cashtitle:SetText("Input Bet:")
	
	local minbet = vgui.Create("DLabel", base)
	minbet:SetColor(Color(0,250,154))
	minbet:SetFont("DermaLarge")
	minbet:SetPos(30, 160)
	minbet:SetSize(500, 50)
	minbet:SetText("Minimum bet: " .. DarkRP.formatMoney(CFG.MinBet))
	
	local maxbet = vgui.Create("DLabel", base)
	maxbet:SetColor(Color(128,0,0))
	maxbet:SetFont("DermaLarge")
	maxbet:SetPos(30, 200)
	maxbet:SetSize(500, 50)
	maxbet:SetText("Maximum bet: " .. DarkRP.formatMoney(CFG.MaxBet))
	
	local numberl = vgui.Create("DLabel", base)
	numberl:SetPos(30, 95)
	numberl:SetColor(Color(0,255,0))
	numberl:SetFont("DermaLarge")
	numberl:SetSize(200, 100)
	numberl:SetText("Your number: ")
	
	
	local version = vgui.Create("DLabel", base)
	version:SetPos(10, 250)
	version:SetColor(Color(240,248,255))
	version:SetFont("WinFont1")
	version:SetSize(250, 120)
	version:SetText("Casino NPC 2 - Workshop Edition")
	
	
	local number = vgui.Create("DLabel", base)
	number:SetPos(numberl:GetWide(), numberl:GetTall()-5)
	number:SetColor(Color(255,255,255))
	number:SetFont("Number1")
	number:SetSize(100, 100)
	number:SetText("0")
	
	local wintext = vgui.Create("DLabel", base)
	wintext:SetFont("WinFont1")
	wintext:SetText("")
	
	local walletbal = vgui.Create("DLabel", base)
	walletbal:SetTextColor(Color(255,215,0))
	walletbal:SetFont("DermaLarge")
	walletbal:SetPos(30, 80)
	walletbal:SetSize(500, 50)
	walletbal:SetText("Your wallet: " .. DarkRP.formatMoney(walletE))
	
	-- Button Work --
	
	local supportbutton = vgui.Create( "DButton")
	supportbutton:SetParent( base )	
	supportbutton:SetPos( 10, 280 )
	supportbutton:SetText( "Support Me!" )
	supportbutton:SetSize( 80, 20 )
	supportbutton.Paint = function(self, w, h) 
	draw.RoundedBox(0, 0, 0, w, h, Color(255,99,71)) end
	supportbutton.DoClick = function()
	gui.OpenURL("http://steamcommunity.com/sharedfiles/filedetails/?id=619121119")
end

	
	local coderhelperbutton = vgui.Create( "DButton")
	coderhelperbutton:SetParent( base )	
	coderhelperbutton:SetPos( 100, 280 )
	coderhelperbutton:SetText( "Code Helper" )
	coderhelperbutton:SetSize( 80, 20 )
	coderhelperbutton.Paint = function(self, w, h) 
	draw.RoundedBox(0, 0, 0, w, h, Color(255,215,0)) end
	coderhelperbutton.DoClick = function()
	gui.OpenURL("http://steamcommunity.com/id/paperlacky/")
	end
	
	local CloseButtonCustom = vgui.Create("DButton", base)
	CloseButtonCustom:SetSize(100, 20)
	CloseButtonCustom:SetPos(150, 0)
	CloseButtonCustom:SetText(":: Close ::")
	CloseButtonCustom.Paint = function(self, w, h) 
	draw.RoundedBox(0, 0, 0, w, h, Color(255,99,71))
	end
		CloseButtonCustom.DoClick = function(self)
		base:Close()
	end

	
	
	

local function NPC_Shop()
	print("used")
end
notification.AddLegacy("You have opened the Casino NPC 2!", NOTIFY_GENERIC, 5)
chat.AddText("Please check if you are running the latest version of Casino NPC")
surface.PlaySound("vo/npc/male01/hi02.wav")
usermessage.Hook( "ShopNPCUsed", NPC_Shop )

	
	local betinput = vgui.Create("DTextEntry", base)
	betinput:SetPos(140, 60)
	betinput:SetSize(200, 12)
	betinput.OnEnter = function(self)
		if isnumber(tonumber(self:GetValue())) and tonumber(self:GetValue()) <= walletE and tonumber(self:GetValue()) >= CFG.MinBet and tonumber(self:GetValue()) <= CFG.MaxBet then
			wintext:SetSize(1, 1)
			wintext:SetPos(1, 1)
			wintext:SetText("")
			betinput:SetDisabled(true)
			betinput:SetEditable(false)
			local betAmount = self:GetValue()
			walletE = walletE - tonumber(betAmount)
			walletbal:SetText("Your wallet: " .. DarkRP.formatMoney(walletE))
			betinput:SetTextColor(Color(0,0,0))
			surface.PlaySound("ambient/office/coinslot1.wav")
			base:ShowCloseButton(false)
			net.Start("75_plus_moneyin")
			net.WriteString(betAmount)
			net.WriteEntity(LocalPlayer())
			net.SendToServer()
			timer.Simple(1.75, function()
				local numerator = 0
				local numerator2 = 0
				local intervaltime = 0.1
				
				for i=1, CFG.SpinTime, 1 do
					timer.Simple(numerator + intervaltime, function()
						number:SetText(tostring(RandNumber()))
						if i == CFG.SpinTime then
							local finalnum = RandNumber()
							number:SetText(finalnum)
							if finalnum >= 75 then
								walletE = walletE + tonumber(betAmount) * tonumber(CFG.WinMultiplier)
								walletbal:SetText("Your wallet: " .. DarkRP.formatMoney(walletE))
								notification.AddLegacy("You won!", NOTIFY_HINT, 4)
								surface.PlaySound("ambient/levels/labs/coinslot1.wav")
								net.Start("75_plus_win")
								net.WriteString(tostring(betAmount))
								net.WriteEntity(LocalPlayer())
								net.SendToServer()
								wintext:SetSize(600, 300)
								wintext:SetColor(Color(0,255,0))
								wintext:SetPos(base:GetWide()/2-50, base:GetTall()-100)
								wintext:SetText("You won " .. DarkRP.formatMoney(tonumber(betAmount) * CFG.WinMultiplier) .. "!")
								base:ShowCloseButton(false)
								betinput:SetDisabled(false)
								betinput:SetEditable(true)
							else
								surface.PlaySound("ambient/alarms/klaxon1.wav")
								wintext:SetSize(600, 100)
								wintext:SetColor(Color(255,0,0))
								wintext:SetPos(base:GetWide()/2-100, base:GetTall()-100)
								notification.AddLegacy("You didnt win, bet again?", NOTIFY_ERROR, 4)
								base:ShowCloseButton(false)
								betinput:SetDisabled(false)
								betinput:SetEditable(true)
							end
						end
						surface.PlaySound("buttons/blip1.wav")
					end)
					numerator = numerator + intervaltime
				end
			end)
		else
			betinput:SetTextColor(Color(255,0,0))
			surface.PlaySound("ambient/alarms/klaxon1.wav")
			notification.AddLegacy("You can't afford that!", NOTIFY_ERROR, 4)
			
		end
	end
end)