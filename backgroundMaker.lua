helpersBGimg = {}
W = love.graphics.getWidth()
H = love.graphics.getHeight()

function helpersBGimg.makeBackGround(img)
    local t = {}
    t.img = love.graphics.newImage(img)
    sx = W / t.img:getWidth()
    sy = H / t.img:getHeight()
    function t.draw()
        love.graphics.draw(t.img, 0, 0, 0, sx, sy)
    end
    return t
end