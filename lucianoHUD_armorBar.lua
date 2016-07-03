require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"
require "lucianoHUD_core"

lucianoHUD_armorBar = {}

registerWidget("lucianoHUD_armorBar")

function lucianoHUD_armorBar:draw()
    if not shouldShowHUD() then
    return end

    local player = getPlayer()
    local armor = player.armor
    local ap = player.armorProtection

    -- Armor bar properties
    local armorBar_x = -350
    local armorBar_y = -100
    local armorBar_w = 2
    local armorBar_h = 60
    local armorBar_color = GREEN

    -- Armor bar stroke properties
    local armorBarStroke_x = -350
    local armorBarStroke_y = -100
    local armorBarStroke_w = 2
    local armorBarStroke_h = 60
    local armorBarStroke_color = GREEN

    -- Change bar color based on armor
    if armor == 0 then
        armorBar_h = 0
    elseif ap == 0 then
        armorBar_color = GREEN
    elseif ap == 1 then
        armorBar_color = YELLOW
    elseif ap == 2 then
        armorBar_color = RED
    end

    -- Move hud based on player speed
    nvgTranslate(player.speed / 70, player.velocity.y / 750 * 5)

    -- Armor numbers
    nvgFontBlur(0)
    -- nvgFontFace(FONT_FACE)
    nvgFontSize(48)
    nvgText(armorBar_x - 5 + armorBar_w - 60 , armorBar_y - 10, armor)

    -- Bar 1
    nvgBeginPath()
    nvgRoundedRect(armorBar_x - armor,
                   armorBar_y,
                   armor,
                   armorBar_h, 0)
    nvgFillColor(armorBar_color)
    nvgFill()

    -- Bar 1 stroke
    nvgBeginPath()
    nvgRoundedRect(armorBarStroke_x - 200,
                   armorBarStroke_y,
                   200,
                   armorBarStroke_h, 0)
    nvgFillColor(TRANSPARENT_BLACK)
    nvgFill()
    nvgStrokeColor(TRANSPARENT_BLACK)
    nvgStrokeWidth(BAR_STROKE_WIDTH)
    nvgStroke()
end
