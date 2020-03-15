#! /usr/bin/env lua
--
-- KillGlow-Dashie.lua
-- Copyright (C) 2020 dashie <dashie@revision.pub>
--
-- ████████▄     ▄████████    ▄████████    ▄█    █▄     ▄█     ▄████████
-- ███   ▀███   ███    ███   ███    ███   ███    ███   ███    ███    ███
-- ███    ███   ███    ███   ███    █▀    ███    ███   ███▌   ███    █▀
-- ███    ███   ███    ███   ███         ▄███▄▄▄▄███▄▄ ███▌  ▄███▄▄▄
-- ███    ███ ▀███████████ ▀███████████ ▀▀███▀▀▀▀███▀  ███▌ ▀▀███▀▀▀
-- ███    ███   ███    ███          ███   ███    ███   ███    ███    █▄
-- ███   ▄███   ███    ███    ▄█    ███   ███    ███   ███    ███    ███
-- ████████▀    ███    █▀   ▄████████▀    ███    █▀    █▀     ██████████
-- ---------------------------------------------------------------------
-- LUA API : Interium
-- Author  : dashie#0921
-- Note    : Converted from Aimware Lua (by can't find thread contact me) to Interium LUA

local author = "dashie";
local verison = 1;

-- Menu
Menu.Text("KillGlow by " .. author .. " v" .. version);
Menu.Spacing();
Menu.Spacing();
Menu.Checkbox("Sound on Frag?", "bSound", false);
Menu.Spacing();
Menu.Spacing();

-- offsets
local hShotOffset = Hack.GetOffset('DT_CSPlayer', 'm_flHealthShotBoostExpirationTime');

-- local lua vars
local duration = 1;
local volume = ".5";

-- Callback Funcs
function Effect( Event )
  if (Event:GetName() == 'player_death') then
    -- local player
    local ME_INDEX = IEngine.GetLocalPlayer();
    local ME_OBJ = IEntityList.GetPlayer(ME_INDEX);

    -- event
    local INT_UID = Event:GetInt( 'userid' );
    local INT_ATTACKER = Event:GetInt( 'attacker' );

    -- index
    local INDEX_Victim = IEngine.GetPlayerForUserID(INT_UID);
    local INDEX_Attacker = IEngine.GetPlayerForUserID(INT_ATTACKER);

    -- check if current player is attacker and also not victim
    if ( INDEX_Attacker == ME_INDEX and INDEX_Victim ~= ME_INDEX ) then
      ME_OBJ:SetPropFloat(hShotOffset, IGlobalVars.curtime + duration);
      if Menu.GetBool("bSound") then
        IEngine.ExecuteClientCmd("playvol physics\\glass\\glass_pottery_break2 " .. volume);
      end
    end
  end
end

-- Events
IGameEventListener.AddEvent('player_death', false);
-- callbacks
Hack.RegisterCallback("FireEventClientSideThink", Effect);
