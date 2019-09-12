local play = {
    game = {
        ball = {
            speedX = 0
            speedY = 0
            position = {
                x = 0,
                y = 0
            }
        }
    }
}

function play:load()
    loveframes.SetState("play")
    
end

function play:keypressed(key) 
    if key == "w"
        ball.speedY -= 0.01
    end
    if key == "a" then
        ball.speedX -= 0.01
    end
    if key == "s" then
        ball.speedY += 0.01
    end
    if key == "d" then
        ball.speedX += 0.01
    end
    
end