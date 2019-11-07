local play = {
    game = {
        mode = "grill" -- "grill" or "note"
    },
    ball = {
        x = 320,
        y = 240,
        speedX = 0,
        speedY = 0
    }
}

function play:load()
    

end

function play:keypressed(key) 
    
end

function play:draw()
    love.graphics.circle("fill",self.ball.x,self.ball.y,50,100)
end

function play:update(dt)
    if love.keyboard.isDown("a") then
        self.ball.x = self.ball.x - self.ball.speedX * dt
    end
    if love.keyboard.isDown("d") then
        self.ball.x = self.ball.x + self.ball.speedX * dt
    end
    if love.keyboard.isDown("w") then
        self.ball.y = self.ball.y - self.ball.speedY * dt
    end
    if love.keyboard.isDown("s") then
        self.ball.y = self.ball.y + self.ball.speedY * dt
    end
end

return play