local score = {}

function score:entered()

end

function score:update(dt)
    suit.Label("Current Score: " .. game.scoreboard.score, 200, 200, 400, 30)

    if love.keyboard.isDown("escape") then
        game:change_state("menu")
    end
end

function score:draw(dt)
    suit.draw()
end



return score