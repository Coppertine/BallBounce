function love.conf(game)
    game.identity = "ballbounce"
    game.window.title = "BallBounce - Prototype"
    game.window.highdpi = true
    game.console = false
    game.accelerometerjoystick = true
    game.window.borderless = true
    game.window.vsync = true

    -- Modules not needed
    game.modules.video = false
end