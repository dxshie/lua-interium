#
# Makefile
# dashie, 2020-03-08 21:33
#

CHECKSUM=find -type f -name "*-Dashie.lua" -exec md5sum "{}" + | md5sum
PUBLICVC=/mnt/f/te/
RELEASEDLUA=./Grenadeable-Dashie.lua ./KillGlow-Dashie.lua

build:
	$(CHECKSUM) > hash.txt
	cp ./*-Dashie.lua /mnt/c/Users/dashie/AppData/Roaming/INTERIUM/CSGO/Lua/
	cp ./assets/* /mnt/c/Users/dashie/AppData/Roaming/INTERIUM/CSGO/
	cp ./hash.txt /mnt/c/Users/dashie/AppData/Roaming/INTERIUM/CSGO/hash.txt
	cat hash.txt

dev:
	nodemon --watch ../interium --exec "make build" -e "lua"

release:
	cp $(RELEASEDLUA) $(PUBLICVC)


# vim:ft=make
#
