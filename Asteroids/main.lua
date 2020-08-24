push = require 'push'

Class = require 'class'

require 'SpaceShip'

Window_Width = 1280
Window_Height = 720

Virtual_Width = 432
Virtual_Height = 243

Player = SpaceShip()


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Asteroids')

    math.randomseed(os.time())

    smallFont = love.graphics.newFont('font.ttf', 8)
    scoreFont = love.graphics.newFont('font.ttf', 16)

    love.graphics.setFont(smallFont)

    --Colocar os sons aqui!

    push:setupScreen(Virtual_Width, Virtual_Height, Window_Width, Window_Height, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    score = 0

    gameState = 'start'

end

function love.resize(w,h)
    push:resize(w, h)
end

function love.update(dt)


    if love.keyboard.isDown('right') then
        Player.orientation = Player.orientation + Player.rotationspeed * dt
    elseif love.keyboard.isDown('left') then
        Player.orientation = Player.orientation - Player.rotationspeed * dt
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()

    elseif key == 'enter' or 'return' then
        if gameState == 'start' then
            gameState = 'play'
        elseif gameState == 'defeated' then
            score = 0
            gameState = 'play'
        end
    end
end

function love.draw()
    
    push:apply('start')

    love.graphics.setFont(smallFont)

    displayScore()

    if gameState == 'start' then
        love.graphics.setFont(smallFont)
        love.graphics.printf('Welcome to Asteroids!', 0, 10, Virtual_Width, 'center')
        love.graphics.printf('Press Enter to begin!', 0, 20, Virtual_Width, 'center')
    elseif gameState == 'play' then

    elseif gameState == 'defeated' then
        love.graphics.setFont(smallFont)
        love.graphics.printf('You died', 0, 10, Virtual_Width, 'center')
        love.graphics.printf('Press Enter to restart!', 0, 20, Virtual_Width, 'center')
    end

    Player:render()

    displayFPS()

    push:apply('end')
end

function displayFPS()
    love.graphics.setFont(smallFont)
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), Virtual_Width - 40, 10)
end

function displayScore()
    love.graphics.setFont(scoreFont)
    love.graphics.print("Points = ", 10, 10)
    love.graphics.print(tostring(score), 20, 10)
end