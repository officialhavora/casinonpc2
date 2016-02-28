CFG = {}

// This is the config, this is where most of your file editing will be.

// Create your own map by going into the game, typing getpos in console. (The first 3 numbers are the Vectors, and the last 3 numbers are the Angles.)
// These are the most common maps pre-defined for you.

local maps = {}

maps.rp_downtown_v4c = {Vector(-1055.000244, -594.918518, -131.968750), Angle(1.385906, -178.722000, 0.000000)}
maps.rp_downtown_v4c_v2 = {Vector(-1074.239624,-360.931763,-131.968750), Angle(8.410255,179.710587,0.000000)}

-- START OF THINGS TO NOT EDIT -- 

for k, v in pairs(maps) do
	if tostring(k) == game.GetMap() then
		CFG.NPCPos = v[1]
		CFG.NPCAng = v[2]
	end
end

-- END OF THINGS TO NOT EDIT -- 

CFG.NPCModel = "models/Humans/Group01/male_07.mdl" // Set Model for spawned NPC!

CFG.WinMultiplier = 2 // How many times their input is their winnings ? Example: 2 means their bet of $500 would result in a win of 2 * 500 which is 1000.
CFG.SpinTime = 50 // amount of spins (number changes)

CFG.MinBet = 150 // Minimum bet
CFG.MaxBet = 1000000 // Maximum bet