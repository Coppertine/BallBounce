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
        },
        score = 0
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
            orb_tick = love.audio.newSource("effects/Closed-Hi-Hat-1.wav", "static"),
            song = "songs/metronome/audio.mp3"
        }
    },
    timer = 0,
    song_track,
    orb_tick 
}

function play:load()
end

function play:entered()
    
    -- loveBPM
    self.song_track = lovebpm.newTrack()
    self.song_track:load(self.assets.sounds.song)
    self.song_track:setBPM(170 / 4)
    self.song_track:setOffset(110)
    self.song_track:on("beat", function(n)
                                    self:generate_orb(self.song_track:getTime())
                               end)
    self.song_track:on("end", function (n)
        game.scoreboard:addScore(self.game.score)
        game:change_state("scoreboard")
    end)
    self.song_track:play()

    self.orb_tick = ripple.newSound(self.assets.sounds.orb_tick)
end

function play:keypressed(key)
end

function play:draw()
    play:draw_walls()
    play:draw_objects()
    love.graphics.print(self.game.score)
end

function play:update(dt)
    local window_width, window_height = love.graphics.getDimensions()
    self.timer = math.ceil(self.timer + (dt * 100))

    play:detect_objects(dt, window_width, window_height)
    play:movement(dt, window_width, window_height)
    play:generate_objects(dt, window_width, window_height)
    self.song_track:update()
    if love.keyboard.isDown("escape") then
        table.remove( self.game.orbs)
        game:change_state("menu")
        self.song_track:stop()
    end
end

function play:movement(dt, window_width, window_height)
    if love.keyboard.isDown(game.states.settings.controls.left.text) then
        self.ball.speedX = self.ball.speedX - 0.2
    end
    if love.keyboard.isDown(game.states.settings.controls.right.text) then
        self.ball.speedX = self.ball.speedX + 0.2
    end
    if love.keyboard.isDown(game.states.settings.controls.up.text) then
        self.ball.speedY = self.ball.speedY - 0.2
    end
    if love.keyboard.isDown(game.states.settings.controls.down.text) then
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
    for k, orb in ipairs(self.game.orbs) do
        local orb_distance_to_player =
            (((self.ball.x + self.ball.width / 2) - orb.x) ^ 2 + ((self.ball.y + self.ball.width / 2) - orb.y) ^ 2) ^
            0.5

        if (orb_distance_to_player - self.ball.width / 2) < 25 then
            self.orb_tick:play({volume = game.states.settings.sounds.sound_effect.value})
            self.game.score = self.game.score + 1
            table.remove(self.game.orbs,k)
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
        position.x = window_width - play.map_wall_width - 25
        position.y = love.math.random(0, window_height)
    elseif playfield_placement == "Top" then
        position.x = love.math.random(0, window_width)
        position.y = play.map_wall_width
    elseif playfield_placement == "Bottom" then
        position.x = love.math.random(0, window_width)
        position.y = window_height - play.map_wall_width - 25
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
    --play:generate_orb(self.timer)
end

return play
