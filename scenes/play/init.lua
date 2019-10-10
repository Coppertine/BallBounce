local play = {
    game = {
        mode = "grill" -- "grill" or "note"
    }
}

function play:load()
    
    

end

function play:keypressed(key) 
    if key == "w" then
        play.ball.speedY = play.ball.speedY - 0.01
    end
    if key == "a" then
        play.ball.speedX = play.ball.speedX - 0.01
    end
    if key == "s" then
        play.ball.speedY = play.ball.speedY + 0.01
    end
    if key == "d" then
        play.ball.speedX = play.ball.speedX + 0.01
    end
end

return play