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
function play:keypressed(key)
    
end

function play:draw()
    love.graphics.circle("fill",self.ball.x,self.ball.y,50,50)
    play:draw_walls()
    play:draw_objects()
end

function play:update(dt)
    play:movement(dt, window_width, window_height)
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

    if self.ball.x <= self.map_wall_width or self.ball.x >  window_width - self.map_wall_width - self.ball.width then
        self.ball.speedX = self.ball.speedX * -1
    end

    if self.ball.y <= self.map_wall_width or self.ball.y > window_height - self.map_wall_width - self.ball.width then
        self.ball.speedY = self.ball.speedY * -1
    end
end
end

return play