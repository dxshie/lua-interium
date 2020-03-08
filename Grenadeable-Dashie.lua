-- will show hp of players that are below 6hp by dashie#0921
-- global variable
local iHealth_Offset = Hack.GetOffset("DT_BasePlayer", "m_iHealth");
local vOrigin_Offset = Hack.GetOffset("DT_BaseEntity", "m_vecOrigin");

local function RenderHealth()
    if (not Utils.IsLocal()) then 
        return
    end

    for i = 1, 64 do
        if (i == IEngine.GetLocalPlayer()) then
            goto continue;
        end

        local Player = IEntityList.GetPlayer(i) ;

        if (Player and Player:GetClassId() == 40 and Player:IsAlive() and not Player:IsDormant()) then 
            local PlayerHealth = Player:GetPropInt(iHealth_Offset);
            local PlayerOrigin = Player:GetPropVector(vOrigin_Offset);

            local col = Color.new(0, 255, 0, 255);
            col.g = col.g - (100 - PlayerHealth) * 2.55;
            col.r = col.r + (100 - PlayerHealth) * 2.55;

            local ToScreen = Vector.new(0, 0, 0);
            if (Math.WorldToScreen(PlayerOrigin, ToScreen) == true) then
                if PlayerHealth < 6 then
                    Render.Text_1(tostring(PlayerHealth), ToScreen.x, ToScreen.y, 20, col, true, true);
                end
            end
        end

        ::continue::
    end
end

Hack.RegisterCallback("PaintTraverse", RenderHealth);
