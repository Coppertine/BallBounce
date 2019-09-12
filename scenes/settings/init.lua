local splash = {
    assets = {
        
    }
}


function splash:entered()

end

function menu:draw()
    local window_width, window_height = love.graphics.getDimensions()
    local window_width_center, window_height_center = window_width / 2, window_height / 2
    local menu_width, menu_height = 400, 300
    local menu_width_center, menu_height_center = menu_width / 2, menu_height / 2
    local menu_x = window_width_center - menu_width_center
    local menu_y = window_height_center - menu_height_center

    love.graphics.setBackgroundColor(14 / 255, 36 / 255, 48 / 255)

    love.graphics.setColor(232 / 255, 213 / 255, 183 / 255)
    love.graphics.rectangle("fill", menu_x, menu_y, menu_width, menu_height)

    love.graphics.setFont(self.assets.title)
    love.graphics.print({{252 / 255, 58 / 255, 81 / 255, 1}, "Doge Ball"}, menu_x + 40, menu_y + 20)
    love.graphics.setFont(self.assets.default)
    

    love.graphics.print({{252 / 255, 58 / 255, 81 / 255, 1},
    "Movement: [".. settings.controls.key.player.up .."] [".. settings.controls.key.player.left .."] [".. settings.controls.key.player.down .."] [".. settings.controls.key.player.right .."] Select: [".. settings.controls.key.confirmplay .."]"}, menu_x + 40, menu_y + menu_height - 30)

    love.graphics.setFont(self.assets.menu_text)
    for i, item in ipairs(self.items) do
        local item_x, item_y = menu_x + 40, menu_y + 50 + 30 * i

        if i == self.selected_item then
            love.graphics.print({{14 / 255, 36 / 255, 48 / 255, 1}, item}, item_x, item_y)
        else
            love.graphics.print({{252 / 255, 58 / 255, 81 / 255, 1}, item}, item_x, item_y)
        end
    end
    love.graphics.setFont(self.assets.default)
end 

function menu:keypressed(key)
    
end

return splash