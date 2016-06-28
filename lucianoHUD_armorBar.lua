require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"
require "lucianoHUD_core"

lucianoHUD_armorBar = {}

registerWidget("lucianoHUD_armorBar")

function lucianoHUD_armorBar:draw()
    if not shouldShowHUD() then
    return end

    local player = getPlayer()
    local ap = player.armor

    -- Armor bar properties
    local armorBar_x = -350;
    local armorBar_y = -100;
    local armorBar_w = 2;
    local armorBar_h = 60;
    local armorBar_color = green;

    -- Armor bar stroke properties
    local armorBarStroke_x = -350;
    local armorBarStroke_y = -100;
    local armorBarStroke_w = 2;
    local armorBarStroke_h = 60;
    local armorBarStroke_color = green;

    -- Change bar color based on armor
    if ap == 0 then
        armorBar_h = 0;
    elseif ap <= 50 then
        armorBar_color = green;
    elseif ap <= 150 then
        armorBar_color = yellow;
    elseif ap > 150 then
        armorBar_color = red;
    end

    nvgTranslate(player.speed / 70, player.velocity.y / 750 * 5);

    -- Armor numbers
    nvgFontSize(48)
    nvgText(armorBar_x + armorBar_w - 60 , armorBar_y - 10, ap);

    -- Bar 1
    nvgBeginPath();
    nvgRoundedRect(armorBar_x - ap,
                   armorBar_y,
                   ap,
                   armorBar_h, 0);
    nvgFillColor(armorBar_color);
    nvgFill();

    -- Bar 1 stroke
    nvgBeginPath();
    nvgRoundedRect(armorBarStroke_x - 200,
                   armorBarStroke_y,
                   200,
                   armorBarStroke_h, 0);
    nvgStrokeWidth(2)
    nvgStroke();
end
