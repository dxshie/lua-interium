-- lua converted from aimware to interium by dashie#0921
local hShotOffset = Hack.GetOffset('DT_CSPlayer', 'm_flHealthShotBoostExpirationTime')

function Effect( Event )
  if ( Event:GetName() == 'player_death' ) then

      local ME_INDEX = IEngine.GetLocalPlayer();
      local ME_OBJ = IEntityList.GetPlayer(ME_INDEX);

      local INT_UID = Event:GetInt( 'userid' );

      local INT_ATTACKER = Event:GetInt( 'attacker' );

      local INDEX_Victim = IEngine.GetPlayerForUserID(INT_UID)

      local INDEX_Attacker = IEngine.GetPlayerForUserID(INT_ATTACKER)

      if ( INDEX_Attacker == ME_INDEX and INDEX_Victim ~= ME_INDEX ) then
        ME_OBJ:SetPropFloat(hShotOffset, IGlobalVars.curtime + 1);
      end

  end

end

IGameEventListener.AddEvent('player_death', false);

Hack.RegisterCallback("FireEventClientSideThink", Effect);

