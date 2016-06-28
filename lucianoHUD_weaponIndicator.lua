require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"

lucianoHUD_weaponIndicator = {}

registerWidget("lucianoHUD_weaponIndicator")

function lucianoHUD_weaponIndicator:draw()
    if not shouldShowHUD() then
    return end

    local player = getPlayer()
    local wp_svgName = "internal/ui/icons/weapon" .. player.weaponIndexSelected;

    local weapon_index = player.weaponIndexSelected;
    local weapon = player.weapons[weapon_index];

    local plr_ammo = weapon.ammo;
    local max_ammo = weapon.maxAmmo;
    local weapon_aliases = {}

    weapon_aliases["Rocket Launcher"] = "RCKT";
    weapon_aliases["Ion Cannon"] = "ION";
    weapon_aliases["Plasma Rifle"] = "PLSM";
    weapon_aliases["Bolt Rifle"] = "BOLT";
    weapon_aliases["Grenade Launcher"] = "GRND";
    weapon_aliases["Burst Gun"] = "BRST";
    weapon_aliases["Melee"] = "MLEE";
    weapon_aliases["Shotgun"] = "STGN";

    -- Armor numbers
    nvgBeginPath();
    nvgFontSize(48)
    nvgFillColor(weapon.color);
    nvgFill();
    nvgText(-35, -50, weapon_aliases[weapon.name]);
end
