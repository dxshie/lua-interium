#! /usr/bin/env lua
--
-- Debug-Dashie.lua
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

-- so debug will not get reset
if ISDEBUG then
  ISDEBUG = ISDEBUG;
else
  ISDEBUG = false;
end

-- so load cfg gets not triggered twice
if TEMPHASH ~= nil then
  TEMPHASH = TEMPHASH;
else
  TEMPHASH = nil;
end

local DETACH_KEY = 74; -- J
local ATTACH_KEY = 75; -- K
local BLANK_KEY = 76; -- L
local HASHFILE = string.format("%s\\INTERIUM\\CSGO\\hash.txt", GetAppData());
local CFGNAME = 'testing.ini'

local function Debug()
  local CURRENTHASH = FileSys.GetTextFromFile(HASHFILE);

  -- Reload LUAS if hash changed in file
  if CURRENTHASH ~= TEMPHASH then
    if ISDEBUG then
      Utils.ConsolePrint(string.format("Change Detected Hotreload \n"));
    end

    if TEMPHASH ~= nil then
      Hack.LoadCfg(CFGNAME);
    end
    TEMPHASH = CURRENTHASH;
  end

  -- Attach Console
  if InputSys.IsKeyDown(ATTACH_KEY) then
    Utils.AttachConsole();
    ISDEBUG = true;
  end

  -- Detach Console
  if InputSys.IsKeyDown(DETACH_KEY) then
    Utils.DetachConsole();
    ISDEBUG = false;
  end

  -- Blank Lines in Console
  if InputSys.IsKeyDown(BLANK_KEY) then
    if ISDEBUG then
      Utils.ConsolePrint(string.format("\n"));
    end
  end
end

Hack.RegisterCallback("CreateMove", Debug);
