numpvp = 0
numbuild = 0

hook.Add("PlayerSwitchMode", "cm", function(ply)
  if (ply.BuildMode) then
    numbuild = numbuild + 1
    numpvp = numpvp - 1
  else
    numpvp = numpvp + 1
    numbuild = numbuild - 1
  end
end )

hook.Add("PlayerDisconnected", "dc", function(ply)
  if (ply.BuildMode) then
    numbuild = numbuild - 1
  else
    numpvp = numpvp - 1
  end
end )

function getNum( forBuild )
  num = 0
  if forBuild == true then
    for k, v in pairs( player.GetAll() ) do
	    if (v.BuildMode) then
	      num = num + 1
	    end
    end
  else if forBuild == false then
    for k, v in pairs( player.GetAll() ) do
	    if (!v.BuildMode) then
	      num = num + 1
	    end
    end
  end
  return num
end

function ulx.getnum( calling_ply, mode )
  if mode == 1 then
    print(getNum( true ))
  else if mode == 2 then
    print(getNum( false ))
  else
    print("Unknown number for ULX GetNum: ", mode)
  end
end
local getnum = ulx.command( "RCN Custom", "ulx getnum", ulx.getnum, "!getnum" )
getnum:addParam{ type=ULib.cmds.NumArg, min=0, max=1, default=0, hint="mode", ULib.cmds.optional, ULib.cmds.round }
getnum:defaultAccess( ULib.ACCESS_SUPERADMIN )
getnum:help( "For testing purposes (DO NOT USE!!!)" )

function ulx.getnumboth( calling_ply )
    print("Build Mode: ", getNum( true ))
    print("PVP Mode: ", getNum( false ))
end
local getnumboth = ulx.command( "RCN Custom", "ulx getnumboth", ulx.getnumboth, "!getnumboth" )
getnumboth:defaultAccess( ULib.ACCESS_SUPERADMIN )
getnumboth:help( "For testing purposes (DO NOT USE!!!)" )
