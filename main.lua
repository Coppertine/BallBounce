graphics = love.graphics
states = {
    menu = require("scenes/menu")
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

function love:load()
    loveframes = require("lib/LoveFrames")
    
    states.menu:load()
end

function love.update(dt)
             
    -- your code
    
    loveframes.update(dt)
 
end
                 
function love.draw()
 
    
 
    loveframes.draw()
 
end
 
function love.mousepressed(x, y, button)
 
    -- your code
 
    loveframes.mousepressed(x, y, button)
 
end
 
function love.mousereleased(x, y, button)
 
    -- your code
 
    loveframes.mousereleased(x, y, button)
 
end
 
function love.keypressed(key, unicode)
 
    -- your code
 
    loveframes.keypressed(key, unicode)
 
end
 
function love.keyreleased(key)
 
    -- your code
 
    loveframes.keyreleased(key)
 
end