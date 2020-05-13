[![lua api interium](https://img.shields.io/badge/lua%20api-interium-brightgreen.svg?style=flat)](http://interium.ooo)

# lua-interium
 
    ████████▄     ▄████████    ▄████████    ▄█    █▄     ▄█     ▄████████  
    ███   ▀███   ███    ███   ███    ███   ███    ███   ███    ███    ███  
    ███    ███   ███    ███   ███    █▀    ███    ███   ███▌   ███    █▀  
    ███    ███   ███    ███   ███         ▄███▄▄▄▄███▄▄ ███▌  ▄███▄▄▄  
    ███    ███ ▀███████████ ▀███████████ ▀▀███▀▀▀▀███▀  ███▌ ▀▀███▀▀▀  
    ███    ███   ███    ███          ███   ███    ███   ███    ███    █▄  
    ███   ▄███   ███    ███    ▄█    ███   ███    ███   ███    ███    ███  
    ████████▀    ███    █▀   ▄████████▀    ███    █▀    █▀     ██████████  

----------------------------------------------------------------------

## Q/A

- ![Q](https://placehold.it/15/f03c15/000000?text=+) Q: Can you port this lua or create this lua?
  - ![A](https://placehold.it/15/c5f015/000000?text=+) A: No pls don't contact me about that i just create luas i think i would use

## Contact / Author  : dashie#0921

## Public / Released

### KillGlow

- Vingniete Glow
- Vingniete Warp
- Vingniete RGB Split
- make adjustable (TODO)

### Grenadable

Shows HP of people below 7 hp  
and tracks it underneath the player model  
Toggles:
- Show Text on Screen - (Bombside A - dashie (1hp))
- Show world to screen - (hp under player model)
Colors changable  

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
  - gives different glows

### ScoreStats

Call of Duty like score stats on a kill (+100) 

- Integrates well with Edgebug Detection for score multiplier
- Integrates well with Statebar to display global Score
- Gets Kill, Headshot and RNG
- Collateral, Tripple Collat
  - Sounds
  - Display
- Headmount Scores every +1 every tick
- Behind player scores 1+ every tick
- Grenade Impact Kills Bonus

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

- Direction Detection (DONE)
- Strafe amount (DONE)
- Sync (TODO)
- Distance (DONE)
- Maxspeed (DONE)
- Strafe breakdown (TODO)
  - Gain for each strafe
  - Sync for each strafe
  - ...

#### LongJump (DONE)

#### HighJump (DONE)

#### Bhop (DONE)

#### Multibhop (DONE)

#### Jumpbug (TODO)

### Collat

Scans if mutliple enemys stand behind each other 
scans for hp and if collat is possible 
works like a trigger 
