#! /usr/bin/env lua
--
-- Grenadeable-Dashie.lua
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
-- Note    : Interium Health Example by NiceL with if check for HP

-- offsets
local iHealth_Offset = Hack.GetOffset("DT_BasePlayer", "m_iHealth");
local vOrigin_Offset = Hack.GetOffset("DT_BaseEntity", "m_vecOrigin");

-- local lua vars
local GRENADEABLE_HP = 6;

local function RenderHealth()
  if (not Utils.IsLocal()) then
    return;
  end


  for i = 1, 64 do
    if (i == IEngine.GetLocalPlayer()) then
      goto continue
    end

    local Player = IEntityList.GetPlayer(i);

    if (Player and Player:GetClassId() == 40 and Player:IsAlive() and not Player:IsDormant()) then
      local PlayerHealth = Player:GetPropInt(iHealth_Offset);
      local PlayerOrigin = Player:GetPropVector(vOrigin_Offset);

      local col = Color.new(0, 255, 0, 255);
      col.g = col.g - (100 - PlayerHealth) * 2.55;
      col.r = col.r + (100 - PlayerHealth) * 2.55;

      local ToScreen = Vector.new(0, 0, 0);
      if (Math.WorldToScreen(PlayerOrigin, ToScreen) == true) then
        if PlayerHealth < GRENADEABLE_HP then
          Render.Text_1(tostring(PlayerHealth), ToScreen.x, ToScreen.y, 20, col, true, true);
        end
      end
    end

    ::continue::
  end
end

-- callbacks
Hack.RegisterCallback("PaintTraverse", RenderHealth);
