require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"
require "lucianoHUD_core"

lucianoHUD_boltAccuracy = {}

registerWidget("lucianoHUD_boltAccuracy")

function lucianoHUD_boltAccuracy:draw()
    if not shouldShowHUD() then
    return end

    local player = getPlayer()
    local bolt_shots_fired = player.weaponStats[8].shotsFired
    local bolt_shots_hit = player.weaponStats[8].shotsHit

    local percent = bolt_shots_hit / bolt_shots_fired * 100

    nvgBeginPath()
    nvgFontSize(48)
    nvgFontBlur(0)
    nvgFillColor(player.weapons[8].color)
    nvgText(0,0, tostring(math.floor(percent))..'%')
    nvgBeginPath()
    nvgRect(-10,-38,106,50)
    nvgFillColor(TRANSPARENT_BLACK)
    nvgFill()
end
