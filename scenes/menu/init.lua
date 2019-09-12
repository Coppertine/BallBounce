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