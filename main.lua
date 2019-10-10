loveframes = {}
graphics = love.graphics
states = {
    menu = require("scenes/menu"),
    play = require("scenes/play")
}



function toDecimalRGB(rgb)
    local r = rgb[1] / 255
    local g = rgb[2] / 255
    local b = rgb[3] / 255
    return {r, g, b}
end

function toDecimalRGBA(rgba)
    local r = rgb[1] / 255
    local g = rgb[2] / 255
    local b = rgb[3] / 255
    return {r, g, b, a}
end
function resetColor()
    love.graphics.setColor(1,1,1,1)
end

