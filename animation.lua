W = love.graphics.getWidth()
H = love.graphics.getHeight()

function makeAnimation(fileName, x, y, num_frames)
    local tmp_anim = {}
    tmp_anim.image = love.graphics.newImage(fileName)

    local image_width = tmp_anim.image:getWidth()
    local image_height = tmp_anim.image:getHeight()
    local frame_width = image_width / num_frames
    local frame_height = image_height

    tmp_anim.quads = {}
    for i=0, num_frames do
        table.insert(tmp_anim.quads, love.graphics.newQuad(i*frame_width, 0, frame_width, frame_height, image_width, image_height))
    end
    tmp_anim.frameNum = 1
    tmp_anim.fps = 10
    tmp_anim.timeLeftForCurrentFrame = 1 / tmp_anim.fps
    tmp_anim.x = x
    tmp_anim.y = y
    tmp_anim.scale = 0.75
    tmp_anim.speed = W / 3

    function tmp_anim.update(dt)
        tmp_anim.timeLeftForCurrentFrame = tmp_anim.timeLeftForCurrentFrame - dt

        if(tmp_anim.timeLeftForCurrentFrame <= 0) then
            tmp_anim.timeLeftForCurrentFrame = 1 / tmp_anim.fps
            tmp_anim.frameNum = tmp_anim.frameNum + 1

            if(tmp_anim.frameNum > #tmp_anim.quads - 1) then
                tmp_anim.frameNum = 1
            end
        end

        --This controls the x and y of the animation
        if(love.keyboard.isDown('d')) then
            tmp_anim.x = tmp_anim.x + (tmp_anim.speed * dt)
        end
        if(love.keyboard.isDown('a')) then
            tmp_anim.x = tmp_anim.x - (tmp_anim.speed * dt)
        end
        if(love.keyboard.isDown('w')) then
            tmp_anim.y = tmp_anim.y - (tmp_anim.speed * dt)
        end
        if(love.keyboard.isDown('s')) then
            tmp_anim.y = tmp_anim.y + (tmp_anim.speed * dt)
        end
    end

    function tmp_anim.draw()
        love.graphics.draw(tmp_anim.image, 
        tmp_anim.quads[tmp_anim.frameNum], 
        tmp_anim.x, tmp_anim.y, 0, 
        tmp_anim.scale, tmp_anim.scale)
    end
    return tmp_anim
end


-------------------------------------------------------------
-- Make the animations for the slimes on the intro screen
function makeAnimationIntroScreen(fileName, x, y, num_frames)
    local anim_Intro = {}
    anim_Intro.image = love.graphics.newImage(fileName)

    local image_width = anim_Intro.image:getWidth()
    local image_height = anim_Intro.image:getHeight()
    local frame_width = image_width / num_frames
    local frame_height = image_height

    anim_Intro.quads = {}
    for i=0, num_frames do
        table.insert(anim_Intro.quads, love.graphics.newQuad(i*frame_width, 0, frame_width, frame_height, image_width, image_height))
    end
    anim_Intro.frameNum = 1
    anim_Intro.fps = 10
    anim_Intro.timeLeftForCurrentFrame = 1 / anim_Intro.fps
    anim_Intro.x = x
    anim_Intro.y = y
    anim_Intro.dx = anim_Intro.x - (anim_Intro.x + love.math.random(-25, 25))
    anim_Intro.dy = anim_Intro.y - (anim_Intro.y + love.math.random(-25, 25))
    anim_Intro.speed = W / love.math.random(-2, 2)
    anim_Intro.scale = 0.75
    anim_Intro.timer = 0
    anim_Intro.stationaryTimer = love.math.random(2)

    function anim_Intro.update(dt)
        anim_Intro.timeLeftForCurrentFrame = anim_Intro.timeLeftForCurrentFrame - dt

        if(anim_Intro.timeLeftForCurrentFrame <= 0) then
            anim_Intro.timeLeftForCurrentFrame = 1 / anim_Intro.fps
            anim_Intro.frameNum = anim_Intro.frameNum + 1

            if(anim_Intro.frameNum > #anim_Intro.quads - 1) then
                anim_Intro.frameNum = 1
            end
        end

        anim_Intro.timer = anim_Intro.timer + dt
        if anim_Intro.timer >= anim_Intro.stationaryTimer then
            anim_Intro.x = anim_Intro.x + anim_Intro.dx
            anim_Intro.y = anim_Intro.y + anim_Intro.dy
            anim_Intro.timer = 0
        end
    end

    function anim_Intro.draw()
        love.graphics.draw(anim_Intro.image, 
        anim_Intro.quads[anim_Intro.frameNum], 
        anim_Intro.x, anim_Intro.y, 0, 
        anim_Intro.scale, anim_Intro.scale)
    end
    return anim_Intro
end