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
    -- Armor numbers
    nvgBeginPath();
    nvgFontSize(48)
    nvgFillColor(weapon.color);
    nvgFill();
    nvgText(0 + 0 - 60 , 0 - 10, weapon.name);
end
