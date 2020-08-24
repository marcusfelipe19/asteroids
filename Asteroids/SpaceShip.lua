SpaceShip = Class{}

function SpaceShip:init()
    self.image = love.graphics.newImage('ship.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = Virtual_Width / 2 - (self.width / 2)
    self.y = Virtual_Height / 2 - (self.height / 2)

    self.dx = 0
    self.dy = 0
    self.rotationspeed = 1
    self.orientation = 0
end

function SpaceShip:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

    self.orientation = self.orientation + self.rotationspeed * dt
end

function SpaceShip:render()
    love.graphics.draw(self.image, self.x, self.y, self.orientation)
end