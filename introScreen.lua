intro = {}
W = love.graphics.getWidth()
H = love.graphics.getHeight()

function intro.load()
    imgIntro = love.graphics.newImage("images/Slime-Survivor.png")
    backgroundimg = love.graphics.newImage("images/introBackground.png")
    imgIntroW = imgIntro:getWidth()
    imgIntroH = imgIntro:getHeight()

    require("buttonMaker")
    require("backgroundMaker")
    require("introScreenSlimes")
    
    slimes = {}
    for i = 1, 10 do
        table.insert(slimes, helperSlime.makeSlime("images/slimeEnemy1.png", love.math.random(0, W), love.math.random(0, H)))
        table.insert(slimes, helperSlime.makeSlime("images/slimeEnemy2.png", love.math.random(0, W), love.math.random(0, H)))
    end

    startBtn = helpersBtn.makeButton("images/startbtn.png", W/2, H/2 + 100)
    background_img = helpersBGimg.makeBackGround("images/introBackground.png")

    world = love.physics.newWorld(0, 0, true)
end

function intro.update(dt)
    for i = 1,#slimes do
        slimes[i].update(dt)
    end
    startBtn.update(dt)
end

function intro.draw()
    love.graphics.setBackgroundColor(0,0,0)
    background_img.draw()
    for i = 1,#slimes do
        slimes[i].draw()
    end
    startBtn.draw()
    love.graphics.draw(imgIntro, W/2 - (imgIntroW/2), H/2 - (imgIntroH/2))
end