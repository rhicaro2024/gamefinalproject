helpersBtn = {}
W = love.graphics.getWidth()
H = love.graphics.getHeight()

function helpersBtn.makeButton(img, x, y)
    local t = {}
    t.img = love.graphics.newImage(img)
    t.x = x
    t.y = y
    t.w = t.img:getWidth()
    t.h = t.img:getHeight()
    -- t.gameStatePointer = gameStatePointer

    function t.update(dt)
        -- gameState = t.gameState
    end

    function t.draw()
        love.graphics.setBackgroundColor(1 ,1 ,1)
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("line", t.x - t.w/2 - 5, t.y - t.h/2 - 5, t.w + 10, t.h + 10, 10, 10)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(t.img, t.x - t.w/2, t.y - t.h/2)
    end
    return t
end