graphics = love.graphics
game = {
    current_state = "splash",
    states = {
        menu = require("scenes/menu"),
        play = require("scenes/play"),
        splash = require("scenes/splash")
    }
}
json = require "lib/json"


function toDecimalRGB(rgb)
    local r = rgb[1] / 255
    local g = rgb[2] / 255
    local b = rgb[3] / 255
    return {r, g, b}
end

function toDecimalRGBA(rgba)
    local r = rgba[1] / 255
    local g = rgba[2] / 255
    local b = rgba[3] / 255
    return {r, g, b, a}
end
function resetColor()
    love.graphics.setColor(1,1,1,1)
end


function game:link_event(event)
    love[event] = function(...)
        if self.states[self.current_state] ~= nil then
            if self.states[self.current_state][event] ~= nil then
                self.states[self.current_state][event](self.states[self.current_state], ...)
            end
        end
    end
end

game:link_event("draw")
game:link_event("keypressed")
game:link_event("update")

function game:change_state(state)
    if self.states[state] ~= nil then
        if self.states[self.current_state].exited ~= nil then
            self.states[self.current_state].exited(self.states[self.current_state])
        end

        self.current_state = state

        if self.states[self.current_state].entered ~= nil then
            self.states[self.current_state].entered(self.states[self.current_state])
        end
    end
end