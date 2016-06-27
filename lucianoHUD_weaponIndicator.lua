require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"

lucianoHUD_weaponIndicator = {}

registerWidget("lucianoHUD_weaponIndicator")

function lucianoHUD_weaponIndicator:draw()
    if not shouldShowHUD() then
    return end
    local player = getPlayer()

    local wp_svgName = "internal/ui/icons/weapon" .. player.weaponIndexSelected
end
