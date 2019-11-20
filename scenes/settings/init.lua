local settings = {
    sounds = {
        master = {
            value = 100,
            min = 0,
            max = 100,
            step = 1
        },
        sound_effect = {
            value = 100,
            min = 0,
            max = 100,
            step = 1
        }
    },
    controls = {
        up = {text="w"},
        down = {text="s"},
        left = {text="a"},
        right = {text="d"}
    }
}

function settings:load()
    
end

function settings:entered()
end

function settings:draw(dt)
    suit.draw()
end
function settings:update(dt)
    suit.layout:reset(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
    suit.layout:padding(10,10)

    -- suit.Slider(self.sounds.master, suit.layout:row(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2), 500, 100)

    -- suit.Slider(self.sounds.sound_effect, suit.layout:row(), 500, 100)
    
    suit.Input(self.controls.up,suit.layout:row(10,10),30,30)
    suit.Label("Up", {align="left"},suit.layout:row(), 300, 30)
    
    if love.keyboard.isDown("escape") then
        game:change_state("menu")
    end
end

function settings:textinput(t)
    suit.textinput(t)
end

function settings:keypressed(key)
    suit.keypressed(key)
end

return settings
