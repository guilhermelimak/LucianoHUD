require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"

lucianoHUD_lowAmmo = {}

registerWidget("lucianoHUD_lowAmmo")

function lucianoHUD_lowAmmo:draw()
    if not shouldShowHUD() then
    return end
    local player = getPlayer()

    local weapon_index = player.weaponIndexSelected
    local weapon = player.weapons[weapon_index]

    if weapon.ammo <= weapon.lowAmmoWarning then
        nvgBeginPath()
        nvgFontBlur(0)
        nvgFontSize(70)
        nvgFillColor(RED)
        nvgText(0,0, 'Low ammo!')
    end
end
