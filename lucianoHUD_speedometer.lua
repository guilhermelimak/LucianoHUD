require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"
require "lucianoHUD_core"

lucianoHUD_speedometer = {}

registerWidget("lucianoHUD_speedometer")

function lucianoHUD_speedometer:draw()
    if not shouldShowHUD() then
    return end

    local NVG_CCW = 1
    local NVG_CW = 2

    barTop = math.rad(-90)
    barRight = math.rad(0)
    barBottom = math.rad(90)
    barLeft = math.rad(-180)

    -- Options
    local barRadius = 50
    local barStrokeWidth = 10
    local barStart = barTop
    local barFillDrection = NVG_CW
    local framePadding = 5
    local fontSize = 40

    -- Colors
    local barInnerColor = Color(255,0,0,255)
    local barOuterColor = Color(0,255,0,255) -- nvgStrokeRadialGradient is bugged so this is ignored for now
    local frameColor = TRANSPARENT_BLACK

    -- Find player
    local player = getPlayer()

    local weapon_index = player.weaponIndexSelected
    local weapon = player.weapons[weapon_index]

    local barEnd
    local frameRadius = barRadius + (barStrokeWidth / 2) + framePadding

    -- Draw frame
    nvgBeginPath()
    nvgCircle(0, 0, frameRadius)
    nvgFillColor(frameColor)
    nvgFill()

    -- Draw 0-100 bar
    if barFillDrection == NVG_CCW
    then barEnd = barStart - math.rad((player.speed / 1000) * 360)
    else barEnd = barStart + math.rad((player.speed / 1000) * 360)
    end

    nvgBeginPath()
    nvgArc(0, 0, barRadius, barStart, barEnd, barFillDrection)
    nvgStrokeWidth(barStrokeWidth + 20)
    nvgStrokeColor(BLACK)
    nvgStroke()

    nvgBeginPath()
    nvgArc(0, 0, barRadius, barStart, barEnd, barFillDrection)
    nvgStrokeWidth(barStrokeWidth)
    nvgStrokeColor(WHITE)
    nvgStroke()

    -- Draw numbers
    nvgBeginPath()
    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE)

    nvgFontBlur(0)
    nvgFillColor(Color(255,255,255,255))
    -- nvgFontFace(FONT_FACE)
    nvgFontSize(50)
    nvgText(0, 0, math.floor(player.speed))
end
