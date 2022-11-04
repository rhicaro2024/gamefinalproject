helperPlayer = {}
require("animation")

function helperPlayer.makePlayer(img, x, y)
    local p = {}
    p.img = img
    p.x = x
    p.y = y
    p.speed = W / 3
    p.player_animation = makeAnimation(p.img, p.x, p.y, 10)

    function p.update(dt)
        p.player_animation.update(dt)
    end

    function p.draw()
        p.player_animation.draw()
    end
    return p
end