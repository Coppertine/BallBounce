local splash = {
    assets = {

    }
}

function splash:entered()

end

function splash:load()
    require("lib.loveframes")
end

function splash:draw()
    local window_width, window_height = love.graphics.getDimensions()
    local window_width_center, window_height_center = window_width / 2, window_height / 2
    local menu_width, menu_height = 400, 300
    local menu_width_center, menu_height_center = menu_width / 2, menu_height / 2
    local menu_x = window_width_center - menu_width_center
    local menu_y = window_height_center - menu_height_center

    graphics.setBackgroundColor(toDecimalRGB({0,0,0}))
    
    graphics.print({toDecimalRGBA({0,0,0,1}), "Doge Ball"}, menu_x + 40, menu_y + 20)
    

end

return splash