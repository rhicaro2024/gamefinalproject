helperSlime = {}
require("animation")

function helperSlime.makeSlime(img, x, y)
    local slimeList = {}
    slimeList.img = img
    slimeList.x = x
    slimeList.y = y
    slimeList.speed = W / 5
    slimeList.slime_animation = makeAnimationIntroScreen(slimeList.img, slimeList.x, slimeList.y, 10)

    function slimeList.update(dt)
        slimeList.slime_animation.update(dt)
    end

    function slimeList.draw()
        slimeList.slime_animation.draw()
    end
    return slimeList
end