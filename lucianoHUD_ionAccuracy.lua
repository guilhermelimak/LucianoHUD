require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"
require "lucianoHUD_core"

lucianoHUD_ionAccuracy = {}

registerWidget("lucianoHUD_ionAccuracy")

function lucianoHUD_ionAccuracy:draw()
    if not shouldShowHUD() then
    return end

    function isnan(x) return x ~= x end

    local player = getPlayer()
    local bolt_shots_fired = player.weaponStats[7].shotsFired
    local bolt_shots_hit = player.weaponStats[7].shotsHit

    local percent = bolt_shots_hit / bolt_shots_fired * 100

    nvgFontSize(48)
    nvgFontBlur(0)
    nvgFillColor(player.weapons[7].color)
    nvgText(0,0, tostring(math.floor(percent))..'%')
    nvgBeginPath()
    nvgRect(-10,-38,106,50)
    nvgFillColor(TRANSPARENT_BLACK)
    nvgFill()
end
