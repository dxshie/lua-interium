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

local version = 2;
local author = "dashie";

-- Menu
Menu.Text("Grenadeable by " .. author .. " v" .. version);
Menu.Spacing();
Menu.Spacing();
Menu.Checkbox("Show Location Text", "bLocation", true);
Menu.Checkbox("Show World2Screen", "bWorldToScreen", true);
Menu.SliderFloat("YPos", "fSliderY", "1", Globals.ScreenHeight(), "%.0f", Globals.ScreenHeight() / 2)
Menu.SliderFloat("XPos", "fSliderX", "1", Globals.ScreenWidth(), "%.0f", 1)
Menu.Spacing();
Menu.Spacing();

-- offsets
local iHealth_Offset = Hack.GetOffset("DT_BasePlayer", "m_iHealth");
local lastPlace_Offset = Hack.GetOffset("DT_BasePlayer", "m_szLastPlaceName");
local vOrigin_Offset = Hack.GetOffset("DT_BaseEntity", "m_vecOrigin");

-- local lua vars
local GRENADEABLE_HP = 6;

local function RenderHealth()
  if (not Utils.IsLocal()) then
    return;
  end

  local YOffset = Menu.GetFloat("fSliderY");
  local XOffset = Menu.GetFloat("fSliderX");
  local FoundPlayerOffset = 20;

  for i = 1, 64 do
    if (i == IEngine.GetLocalPlayer()) then
      goto continue
    end

    local Player = IEntityList.GetPlayer(i);

    if (Player and Player:GetClassId() == 40 and Player:IsAlive() and not Player:IsDormant()) then
      local PlayerHealth = Player:GetPropInt(iHealth_Offset);
      local PlayerOrigin = Player:GetPropVector(vOrigin_Offset);
      local PlayerPlace = Player:GetPropString(lastPlace_Offset);
      local PlayerInfo = CPlayerInfo.new();
      Player:GetPlayerInfo(PlayerInfo);

      local col = Color.new(0, 255, 0, 255);
      col.g = col.g - (100 - PlayerHealth) * 2.55;
      col.r = col.r + (100 - PlayerHealth) * 2.55;

      if Menu.GetBool("bWorldToScreen") then
        local ToScreen = Vector.new(0, 0, 0);
        if (Math.WorldToScreen(PlayerOrigin, ToScreen) == true) then
          if PlayerHealth < GRENADEABLE_HP then
            Render.Text_1(tostring(PlayerHealth), ToScreen.x, ToScreen.y, 20, col, true, true);
          end
        end
      end

      if Menu.GetBool("bLocation") then
        if PlayerHealth < GRENADEABLE_HP then
          local text = string.format("%s - %s (%ihp)", PlayerPlace, PlayerInfo.szName, PlayerHealth);
          Render.Text_1(text, XOffset, YOffset - FoundPlayerOffset, 20, col, false, true);
          FoundPlayerOffset = FoundPlayerOffset + 20;
        end
      end
    end

    ::continue::
  end
end

-- callbacks
Hack.RegisterCallback("PaintTraverse", RenderHealth);
