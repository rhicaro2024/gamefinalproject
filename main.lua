function love.load()
    W = love.graphics.getWidth()
    H = love.graphics.getHeight()
    gameState = 0
    require("introScreen")
    require("arena")    
    if gameState == 0 then
        intro.load()
    else
        arena.load()
    end
end

function love.update(dt)
    if gameState == 0 then
        intro.update(dt)
    else
        arena.update(dt)
    end
end

function love.mousepressed(mouse_x, mouse_y, numClicked, isTouched, pressed)

end

function love.draw()
    if gameState == 0 then
        intro.draw()
    else
        arena.draw()
    end
end