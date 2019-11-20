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
    suit.layout:reset(100, 100)
    suit.layout:padding(10)

    suit.Slider(self.sounds.master, suit.layout:row(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2), 500, 100)

    suit.Slider(self.sounds.song, suit.layout:row(), 500, 100)
    
end

return settings
