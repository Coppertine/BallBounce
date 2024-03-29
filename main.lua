suit = require "lib/suit"

game = {
    current_state = "menu",
    states = {
        menu = require("scenes/menu"),
        play = require("scenes/play"),
        settings = require("scenes/settings"),
        scoreboard = require("scenes/score")
    },
    scoreboard = require "scoreboard"
}

lovebpm = require("lib/lovebpm")
ripple = require "lib.ripple"


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
game:link_event("mousepressed")
game:link_event("mousereleased")
game:link_event("update")
game:link_event("textinput")

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