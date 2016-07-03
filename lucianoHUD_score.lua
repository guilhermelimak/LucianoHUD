require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"
require "lucianoHUD_core"

lucianoHUD_score = {}

registerWidget("lucianoHUD_score")

function lucianoHUD_score:draw()
    if not shouldShowHUD() then
    return end

    local player = getPlayer()

    i = 0

    for p, players in pairs(players) do
        if player.connected and player.state == PLAYER_STATE_INGAME and player.team == player.team then
            i = i + 1
            -- nvgFontSize(48)
            -- nvgFillColor(player.weapons[8].color)
            -- nvgText(i * 50,0, player.name)
        end
    end
end
