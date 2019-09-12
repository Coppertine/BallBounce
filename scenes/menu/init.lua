local menu = {

}

local loremipsum =
[[http://nikolairesokav.com/
 ---------------------------------------------------
 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean laoreet massa mattis tortor faucibus non congue mauris mattis. Aliquam ultricies scelerisque mi, sit amet tempor metus pharetra vel. Etiam eu arcu a dolor porttitor condimentum in malesuada urna. Mauris vel nulla mi, quis aliquet neque. In aliquet turpis eget purus malesuada tincidunt. Donec rutrum purus vel diam suscipit vehicula. Cras sem nibh, tempus at dictum non, consequat non justo. In sed tellus nec orci scelerisque scelerisque id vitae leo. Maecenas pharetra, nibh eget commodo gravida, augue nisl blandit dui, ut malesuada augue dui nec erat. Phasellus nec mauris pharetra metus iaculis viverra sit amet ut tortor. Duis et viverra magna. Nunc orci dolor, placerat a iaculis non, mattis sed nibh.
 Nulla ut arcu felis, a laoreet tellus. Vivamus ligula nibh, bibendum ut ultrices sed, ullamcorper et est. Pellentesque nisi diam, sollicitudin lacinia fermentum quis, aliquam fermentum elit. Donec egestas vestibulum mollis. Vivamus sollicitudin nisl vestibulum nisi fermentum scelerisque. Nunc enim magna, posuere ornare faucibus a, bibendum vestibulum felis. Etiam laoreet molestie elit, vitae ultrices sem faucibus in. Fusce rutrum convallis lacus, vitae scelerisque eros tincidunt sed. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
]]

function menu:load()
    loveframes.SetState("menu")

    love.graphics.setBackgroundColor(1, 1, 1)

    local fonts = {}
    for i=10, 30 do
        fonts[i] = love.graphics.newFont(i)
    end

    local list = loveframes.Create("list")
    list:SetPos(5, 30)
    list:SetSize(243, 265)
    list:SetPadding(5)
    list:SetSpacing(5)
    list:SetState("menu")

    local text1 = loveframes.Create("text")
    text1:SetText(loremipsum)
    text1:SetShadowColor(0.8, 0.8, 0.8, 1)
    list:AddItem(text1)

    local colortext = {}
    for i=1, 49 do
        local r = math.random()
        local g = math.random()
        local b = math.random()
        table.insert(colortext, {color = {r, g, b, 1}, font = fonts[math.random(1, 30)]})
        table.insert(colortext, math.random(1, 1000) .. " ")
    end

    local text2 = loveframes.Create("text")
    text2:SetPos(255, 30)
    text2:SetMaxWidth(243)
    text2:SetText(colortext)
    text2:SetState("menu")

    local shadowbutton = loveframes.Create("button")
    shadowbutton:SetSize(490, 20)
    shadowbutton:SetPos(5, 5)
    shadowbutton:SetText("Toggle Text Shadow")
    shadowbutton.OnClick = function()
        text1:SetShadow(not text1:GetShadow())
        text2:SetShadow(not text2:GetShadow())
    end
    shadowbutton:SetState("menu")
    
end

return menu