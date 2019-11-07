function love.conf(game)
    game.window.title = "BallBounce - Prototype"
    game.window.highdpi = true
    game.console = false
    game.accelerometerjoystick = true
    game.window.borderless = false
    game.window.vsync = false
    game.window.width = 1920 / 2
    game.window.height = 1080 / 2

    -- Modules not needed
    game.modules.video = false
end