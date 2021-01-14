enemy = {}

function enemy:load(world)
	-- sounds
	self.thunk_sound = love.audio.newSource("assets/sounds/thunk.wav", "static")
	self.thunk_one_shot = true
	-- sprite
	self.sprite = love.graphics.newImage("assets/sprites/paddle.png")
	self.sprite:setFilter("nearest")
	-- physics
	self.body = love.physics.newBody(world, 0, 0, "dynamic")
	self.shape = love.physics.newRectangleShape(self.sprite:getWidth()*pixel_size, self.sprite:getHeight()*pixel_size)
	self.fixture = love.physics.newFixture(self.body, self.shape, 1)
	self.body:setFixedRotation(true)
	self.body:setFixedRotation(true)
	self.body:setMass(600)
	-- location
	self.body:setPosition(screenw - self.sprite:getWidth() * pixel_size, (screenh / 2) - (self.sprite:getHeight() * pixel_size / 2))
	-- movement
	self.speed = 280
	-- score
	self.score = 0
end

function enemy:update(dt)
	if love.keyboard.isDown("k") then
		self.body:setLinearVelocity(0, self.speed * -1)
	elseif love.keyboard.isDown("j") then
		self.body:setLinearVelocity(0, self.speed)
	end

	if self.body:isTouching(bounds.wall_upper.body) or self.body:isTouching(bounds.wall_lower.body) then
		if self.thunk_one_shot then
			self.thunk_sound:play()
			self.thunk_one_shot = false
		end
	else
		self.thunk_one_shot = true
	end
end

function enemy:draw()
	x1, y1, x2, y2, x3, y3, x4, y4 = self.fixture:getBoundingBox()
	love.graphics.draw(self.sprite, x1, y1, 0, pixel_size)
end

