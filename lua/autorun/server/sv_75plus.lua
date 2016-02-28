AddCSLuaFile("75plus/config.lua")

include("75plus/config.lua")

local CFG = CFG

util.AddNetworkString("75_plus_win")
util.AddNetworkString("75_plus_moneyin")
util.AddNetworkString("open_75plus")

net.Receive("75_plus_moneyin", function()

	local betamount = tonumber(net.ReadString())
	local better = net.ReadEntity()
	
	better:addMoney(-betamount)

end)

net.Receive("75_plus_win", function()

	local moneybet = tonumber(net.ReadString())
	local winner = net.ReadEntity()
	
	winner:addMoney(moneybet * CFG.WinMultiplier)
end)

hook.Add("InitPostEntity", "SpawnDealer", function()

	dealer = ents.Create("dealer")
	if !IsValid(dealer) then return end
	dealer:SetPos(CFG.NPCPos)
	dealer:SetAngles(CFG.NPCAng)
	dealer:Spawn()

end)
