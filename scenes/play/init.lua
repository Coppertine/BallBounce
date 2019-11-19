local play = {
    game = {
        mode = "grill", -- "grill" or "note"
        orbs = {},
        grill = {},
        playfield_placement = {
            "Left",
            "Right",
            "Top",
            "Bottom"
        }
    },
    ball = {
        x = 320,
        y = 240,
        speedX = 0,
        speedY = 0,
        width = 35
    },
    map_wall_width = 20,
    assets = {
        sprite = {
            orb = love.graphics.newImage("sprites/orb.png"),
            grill = love.graphics.newImage("sprites/grill.png"),
            player = love.graphics.newImage("sprites/player.png")
        },
        sounds = {
            orb_tick = "effects/hihat.ogg",
            song = "songs/metronome/audio.mp3"
        }
    },
    timer = 0
}

function play:load()
end

function play:entered()
    TESound.play(song, {"master", "song"})
end

function play:keypressed(key)
end

function play:draw()
    play:draw_walls()
    play:draw_objects()
    love.graphics.print(self.timer)
end

function play:update(dt)
    local window_width, window_height = love.graphics.getDimensions()
    self.timer = math.ceil(self.timer + (dt * 100))

    play:detect_objects(dt, window_width, window_height)
    play:movement(dt, window_width, window_height)
    play:generate_objects(dt, window_width, window_height)
    TESound.cleanup()
end

function play:movement(dt, window_width, window_height)
    if love.keyboard.isDown("a") then
        self.ball.speedX = self.ball.speedX - 0.2
    end
    if love.keyboard.isDown("d") then
        self.ball.speedX = self.ball.speedX + 0.2
    end
    if love.keyboard.isDown("w") then
        self.ball.speedY = self.ball.speedY - 0.2
    end
    if love.keyboard.isDown("s") then
        self.ball.speedY = self.ball.speedY + 0.2
    end

    self.ball.x = self.ball.x + self.ball.speedX * dt
    self.ball.y = self.ball.y + self.ball.speedY * dt

    if self.ball.speedX > 0 then
        self.ball.speedX = self.ball.speedX - 0.01
    elseif self.ball.speedX < 0 then
        self.ball.speedX = self.ball.speedX + 0.01
    end

    if self.ball.speedY > 0 then
        self.ball.speedY = self.ball.speedY - 0.01
    elseif self.ball.speedY < 0 then
        self.ball.speedY = self.ball.speedY + 0.01
    end

    if self.ball.x < self.map_wall_width or self.ball.x > window_width - self.map_wall_width - self.ball.width then
        self.ball.speedX = self.ball.speedX * -1
    end

    if self.ball.y < self.map_wall_width or self.ball.y > window_height - self.map_wall_width - self.ball.width then
        self.ball.speedY = self.ball.speedY * -1
    end
end

function play:detect_objects(dt, window_width, window_height)
    for k, orb in pairs(self.game.orbs) do
        local orb_distance_to_player =
            (((self.ball.x + self.ball.width / 2) - orb.x) ^ 2 + ((self.ball.y + self.ball.width / 2) - orb.y) ^ 2) ^
            0.5

        if (orb_distance_to_player - self.ball.width / 2) < 25 then
            self.assets.sounds.orb_tick:play()
            self.game.score = self.game.score + 1
            table.remove(orb)
        end
    end
end

function play:generate_orb(_time)
    local window_width, window_height = love.graphics.getDimensions()
    local playfield_placement = self.game.playfield_placement[math.floor(love.math.random(1, 4))]

    local position_x, position_y = play:getRandomPosition(window_width, window_height, playfield_placement)

    local orb = {
        x = position_x,
        y = position_y,
        time = _time
    }

    table.insert(play.game.orbs, orb)
end

-- Does account to wall size --
function play:getRandomPosition(window_width, window_height, playfield_placement)
    local position = {
        x = 0,
        y = 0
    }

    if playfield_placement == "Left" then
        position.x = play.map_wall_width
        position.y = love.math.random(0, window_height)
    elseif playfield_placement == "Right" then
        position.x = window_width - play.map_wall_width
        position.y = love.math.random(0, window_height)
    elseif playfield_placement == "Top" then
        position.x = love.math.random(0, window_width)
        position.y = play.map_wall_width
    elseif playfield_placement == "Bottom" then
        position.x = love.math.random(0, window_width)
        position.y = window_height - play.map_wall_width
    end

    return position.x, position.y
end

function play:draw_walls()
    local window_width, window_height = love.graphics.getDimensions()
    -- Draw Outer wall
    love.graphics.setColor(14 / 255, 50 / 255, 48 / 255)
    love.graphics.rectangle("fill", 0, 0, window_width, window_height)

    -- Draw inner area
    love.graphics.setColor(14 / 255, 36 / 255, 48 / 255)
    love.graphics.rectangle(
        "fill",
        self.map_wall_width,
        self.map_wall_width,
        window_width - self.map_wall_width * 2,
        window_height - self.map_wall_width * 2
    )
end

function play:draw_objects()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.assets.sprite.player, self.ball.x, self.ball.y, 0.35, 0.35)

    for i, orb in ipairs(self.game.orbs) do
        love.graphics.draw(self.assets.sprite.orb, orb.x, orb.y, 0.25, 0.25)
    end
end

function play:generate_objects(dt, window_width, window_height)
    if self.timer % (60000 / 170) == 0 then
        play:generate_orb(self.timer)
    end
end

return play
