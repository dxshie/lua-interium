# lua-interium
 
      ████████▄     ▄████████    ▄████████    ▄█    █▄     ▄█     ▄████████  
      ███   ▀███   ███    ███   ███    ███   ███    ███   ███    ███    ███  
      ███    ███   ███    ███   ███    █▀    ███    ███   ███▌   ███    █▀  
      ███    ███   ███    ███   ███         ▄███▄▄▄▄███▄▄ ███▌  ▄███▄▄▄  
      ███    ███ ▀███████████ ▀███████████ ▀▀███▀▀▀▀███▀  ███▌ ▀▀███▀▀▀  
      ███    ███   ███    ███          ███   ███    ███   ███    ███    █▄  
      ███   ▄███   ███    ███    ▄█    ███   ███    ███   ███    ███    ███  
      ████████▀    ███    █▀   ▄████████▀    ███    █▀    █▀     ██████████  

---------------------------------------------------------------------

# Q/A
## Q: How to get PRIVATE access?
### A: gamesense.pub invite (i want to port somes luas for skeet)
## Q: When EBDetection release?
### A: When i got a invite i wanna release it for all major providers

## LUA API : Interium
## Author  : dashie#0921

## Public

### KillGlow

- Vingniete Glow
- Vingniete Warp
- Vingniete RGB Split
- make adjustable (TODO)

### Grenadable

Shows HP of people below 7 hp 
and tracks it underneath the player model

## Private (For now) Roadmap and finished

### Edgebug Detection

- Edgebug Glow
  - Adjustable
    - KillGlow
    - ColorBurn Glow
- Sounds (quake sounds but you can add any)
  - Adjustable
  - Secret weeb version
- Edgebug Succession
  - gives different sounds
  - gives different glows (TODO)

### ScoreStats

Call of Duty like score stats on a kill (+100) 

- Integrates well with Edgebug Detection for score multiplier
- Integrates well with Statebar to display global Score
- Gets Kill, Headshot and RNG
- Collateral, Tripple Collat
  - Sounds
  - Display
- Headmount Scores every 100ms +1 (TODO)
- Head Bhop Score (TODO)

### StateBar

Point of this lua is to be able to play without 
a csgo hud cl_draw_only_deathnotices 1 

- Shows Kills / Deaths
- Shows Edgebugs
- Shows Edgebug Succesion
- Shows HP and Money
- Shows ScoreStats (if lua loaded)

### LongJumpStats (TODO)

Counter-Strike 1.6 like stats 
still very buggy at some points

- Direction Detection
- Strafe amount
- Sync
- Distance
- Maxspeed
- Strafe breakdown (TODO)
  - Gain for each strafe
  - Sync for each strafe
  - ...

#### LongJump

#### HighJump

#### Bhop

#### Multibhop

#### DropLongJump

#### Jumpbug (TODO)

### BloodyScreen

BloodyScreen Animation if low hp
looks still ugly (TODO)

### Collat (TODO)

Scans if mutliple enemys stand behind each other 
scans for hp and if collat is possible 
works like a trigger 

### MusicDisplay

Displays current song on Screen

- Spotify
- iTunes Music (TODO)
- YouTube (needs chrome extension)

### TwitchIntegration

Lets viewers controll settings (TODO)

### Velocity Lua modified (orginial by NiceL) to work with eb detection

### Jumptrail Lua modified (original by NiceL) to work with eb detection 
