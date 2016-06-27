require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"

lucianoHUD_healthBar = {}

registerWidget("lucianoHUD_healthBar")

function lucianoHUD_healthBar:draw()
    if not shouldShowHUD() then
    return end
    local player = getPlayer()
    local hp = player.health

    -- Vars
    local x_offset = 350;
    local stroke_width = 2;

    -- BAR 1
    local healthBar1_hp = hp;
    local healthBar1_x = x_offset;
    local healthBar1_y = -100;
    local healthBar1_w = 2;
    local healthBar1_h = 60;
    local healthBar1_color = green;

    -- BAR 1 Stroke
    local healthBar1Stroke_x = x_offset;
    local healthBar1Stroke_y = -100;
    local healthBar1Stroke_w = 2;
    local healthBar1Stroke_h = 60;
    local healthBar1Stroke_color = green;

    -- BAR 2
    local healthBar2_hp = 0;
    local healthBar2_x = x_offset;
    local healthBar2_y = -30;
    local healthBar2_w = 2;
    local healthBar2_h = 20;
    local healthBar2_color = megaBlue

    -- BAR 2 Stroke
    local healthBar2Stroke_x = x_offset;
    local healthBar2Stroke_y = -30;
    local healthBar2Stroke_w = 2;
    local healthBar2Stroke_h = 20;
    local healthBar2Stroke_color = megaBlue;

    -- change bar colors according to the player hp
    if hp > 100 then
        healthBar1_hp = 100;
        healthBar2_hp = hp - 100;
        healthBar1_color = megaBlue;
    elseif hp < 75 then
        healthBar1_color = yellow;
        healthBar1_hp = hp;
        healthBar2_hp = 0;
    elseif hp < 30 then
        consolePrint(hp)
        healthBar1_color = red;
        healthBar1_hp = hp;
        healthBar2_hp = 0;
    end

    if healthBar2_hp == 0 then
        healthBar2_h = 0
    end

    -- Movement
    nvgTranslate(- player.speed / 40, player.speed / 25);

    -- Health number
    nvgFontSize(48)
    nvgText(healthBar1_x + 10, healthBar1_y - 40, hp);

    -- Bar 1
    nvgBeginPath();
    nvgRect(healthBar1_x + 10,
            healthBar1_y,
            healthBar1_w * healthBar1_hp,
            healthBar1_h);
    nvgFillColor(healthBar1_color);
    nvgFill();

    -- Bar 1 Stroke
    nvgBeginPath();
    nvgRect(healthBar1Stroke_x + 10,
            healthBar1Stroke_y,
            healthBar1Stroke_w * 100,
            healthBar1Stroke_h);
    nvgStrokeWidth(2);
    nvgStroke();

    -- Bar 2 (Mega health)
    nvgBeginPath();
    nvgRect(healthBar2_x + 10,
            healthBar2_y - 100,
            healthBar2_w * healthBar2_hp,
            healthBar2_h);
    nvgFillColor(healthBar2_color)
    nvgFill();

    -- Bar 2 (Mega health) Stroke
    nvgBeginPath();
    nvgRect(healthBar2Stroke_x + 10,
            healthBar2Stroke_y - 100,
            healthBar2Stroke_w * 100,
            healthBar2Stroke_h);
    nvgStrokeWidth(2);
    nvgStroke();
end
