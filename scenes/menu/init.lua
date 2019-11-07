local menu = {

}
local show_message = false

function menu:load()
    
end

function menu:entered()
end

function menu:draw()
    suit.draw()
end

function menu:update(dt)
    
    suit.layout:reset(100, 100)
    suit.layout:padding(10)

    if suit.Button("Play", {id=1}, suit.layout:row(200, 30)).hit then
        game:change_state("play")
    end
    if suit.Button("Exit", {id=2}, suit.layout:row()).hit then
        love.event.quit()
    end

    
end


return menu