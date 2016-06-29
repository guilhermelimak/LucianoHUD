require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"
require "lucianoHUD_core"

lucianoHUD_weaponIndicator = {}

registerWidget("lucianoHUD_weaponIndicator")

function lucianoHUD_weaponIndicator:draw()
    if not shouldShowHUD() then
    return end

    -- Get player object
    local player = getPlayer()

    -- Get current weapon
    local weapon_index = player.weaponIndexSelected;
    local weapon = player.weapons[weapon_index];

    -- Get player ammo
    local plr_ammo = weapon.ammo;
    local max_ammo = weapon.maxAmmo;
    local weapon_aliases = {}

    -- Set aliases
    weapon_aliases["Rocket Launcher"] = "RCKT";
    weapon_aliases["Ion Cannon"] = "ION";
    weapon_aliases["Plasma Rifle"] = "PLSM";
    weapon_aliases["Bolt Rifle"] = "BOLT";
    weapon_aliases["Grenade Launcher"] = "GRND";
    weapon_aliases["Burst Gun"] = "BRST";
    weapon_aliases["Melee"] = "MLEE";
    weapon_aliases["Shotgun"] = "STGN";

    -- Print weapon name and ammo
    nvgFontFace(FONT_FACE)
    nvgBeginPath();
    nvgFontSize(48)
    nvgStrokeWidth(30);
    nvgStroke();
    nvgFillColor(weapon.color);
    nvgFill();
    nvgText(0, -50, weapon_aliases[weapon.name]);
    nvgText(-57, -100, plr_ammo);
end
    -- local wp_svgName = "internal/ui/icons/weapon" .. player.weaponIndexSelected;
