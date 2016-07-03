require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"
require "lucianoHUD_core"
require "base/internal/ui/Kered13/Utils/Utils"

lucianoHUD_spectate = {}

registerWidget("lucianoHUD_spectate")

function lucianoHUD_spectate:draw()
    if not shouldShowHUD() then
    return end

    local player = getPlayer()

    -- nvgFontSize(48)
    -- nvgFillColor(player.weapons[8].color)
    -- nvgText(i * 50,0, player.name)
end
