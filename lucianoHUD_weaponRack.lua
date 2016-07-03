require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"
require "lucianoHUD_core"

lucianoHUD_weaponRack = {}

registerWidget("lucianoHUD_weaponRack")

function lucianoHUD_weaponRack:draw()
    if not shouldShowHUD() then
    return end

    local player = getPlayer()
    local hp = player.health
    local weapons = player.weapons

    nvgBeginPath()
    nvgRoundedRect(-34,
                   12,
                   140,
                   430, 0)
    nvgFillColor(TRANSPARENT_BLACK)
    nvgFill()

    local last = 0
    for i=1,8 do
        local wp_svgName = "internal/ui/icons/weapon" .. i
        nvgBeginPath()
        nvgFontBlur(0)
        -- nvgFontFace(FONT_FACE)
        if weapons[i].pickedup then
            if weapons[i].ammo == 0 then
                weapons[i].color.a = 80
            elseif weapons[i].ammo > 0 then
                weapons[i].color.a = 255
            end

            nvgFillColor(weapons[i].color)
            nvgFontSize(48)
            nvgSvg(wp_svgName, 0, i * 50, 20)
            if i == player.weaponIndexSelected then
                nvgFillColor(WHITE)
            else
                nvgBeginPath()
                nvgFillColor(BLACK)
                nvgFill()
                nvgRect(0, i*50, 100, 100)
                nvgFillColor(weapons[i].color)
            end
            nvgText(40, i * 50 + 15, weapons[i].ammo)
            last = i
        end
    end
end
