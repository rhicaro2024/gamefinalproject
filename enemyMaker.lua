helperEnemy = {}
require("animation")

function helperEnemy.makeEnemy(img, x, y)
    local e = {}
    e.img = img
    e.x = x
    e.y = y
    e.speed = W / 5
    e.player_animation = makeAnimation(e.img, e.x, e.y, 10)

    function e.update(dt)
        e.player_animation.update(dt)
    end

    function e.draw()
        e.player_animation.draw()
    end
    return p
end