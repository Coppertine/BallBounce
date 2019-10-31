local load = {      
}
-- Check if stages folder is found. if not, create it and set it up
function load:stages_check()
    local file_path = love.filesystem.getSavesDirectory()
    if love.filesystem.getInfo("stages") ~= nil then
        stages_create()
        --download_stages()
    end
end

function load:stages_create()
    love.filesystem.createDirectory("stages")
end

return load