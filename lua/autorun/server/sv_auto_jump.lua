if SERVER then
	
CreateConVar("sv_autojump",1,FCVAR_ARCHIVE,FCVAR_REPLICATED)

local band = bit.band
local bor = bit.bor
local bnot = bit.bnot

hook.Add("SetupMove", "AutoJump", function(ply, uc)

local n=GetConVarNumber("sv_autojump")

	if n==1 then 
		if ply:Alive() and ply:GetMoveType() == MOVETYPE_WALK and not ply:InVehicle() and ply:WaterLevel() <= 1 and band(uc:GetButtons(), IN_JUMP) == IN_JUMP then 
			if ply:IsOnGround() then
				uc:SetButtons( bor( uc:GetButtons(), IN_JUMP) )
			else
				uc:SetButtons( band( uc:GetButtons(), bnot(IN_JUMP)) )
			end
		end
		
	elseif n==0 then end
	
end)

end