
return function(loveframes)
    ---------- module start ----------
    
    -- form object
    local newobject = loveframes.NewObject("ball", "loveframes_object_form", true)

    function newobject:initialize()
        self.color = {0,0,0,0}
    end

    function newobject:draw()
        local state = loveframes.state
        local selfstate = self.state
    
        if state ~= selfstate then
            return
        end
    
        local visible = self.visible
    
        if not visible then
            return
        end
    
        local x = self.x
        local y = self.y
        local width = self.width
        local height = self.height
        local color = self.color
    
        -- set the object's draw order
        self:SetDrawOrder()
    
        if draw then
            draw(self)
        else
            love.graphics.setColor(color)
            love.graphics.circle("fill", x, y, width, height)
            love.graphics.setColor(0,0,0,0)            
        end
    
        -- loop through the object's children and draw them
        if children ~= nil then
            for k, v in ipairs(children) do
                v:draw()
            end
        end
    end

    function newobject:setColor(rgb)
        self.color = rgb
        return self
    end

    function newobject:getColor()
        return self.color
    end
end