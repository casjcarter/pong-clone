ball = {}

function ball:load()
	-- sounds
	self.hit_sound = love.audio.newSource("assets/sounds/hit.wav", "static")
	self.goal_sound = love.audio.newSource("assets/sounds/goal.wav", "static")
	self.win_sound = love.audio.newSource("assets/sounds/win.wav", "static")
	-- sprite
	self.sprite = love.graphics.newImage("assets/sprites/ball.png")
	self.sprite:setFilter("nearest")
	-- reset
	self.startx = (screenw / 2) - (self.sprite:getWidth() / 2)
	self.starty = (screenh / 2) - (self.sprite:getHeight() / 2)
	self.is_reset = true
	-- physics
	self.body = love.physics.newBody(world, self.x, self.y, "dynamic")
	self.shape = love.physics.newRectangleShape(self.sprite:getWidth(), self.sprite:getHeight())
	self.fixture = love.physics.newFixture(self.body, self.shape, 1)
	self.fixture:setRestitution(1.0)
	self.fixture:setFriction(0.0)
	self.body:setFixedRotation(true)
	self.body:setMass(0.0)
	self.start_speed = 300
	self.speed = self.start_speed
	self.speed_inc = 6

	self:reset()
end

function ball:update(dt)
	self:collide()
end

function ball:draw()
	x1, y1, x2, y2, x3, y3, x4, y4 = self.fixture:getBoundingBox()
	love.graphics.draw(self.sprite, x1, y1, 0, pixel_size)
end

function ball:collide()
	if self.body:isTouching(player.body) then
		local playerx, playery = player.body:getLinearVelocity()
		self.speed = self.speed + self.speed_inc
		ball.body:setLinearVelocity(self.speed + 1, playery / 2)
		self.hit_sound:play()
	elseif self.body:isTouching(enemy.body) then
		local enemyx, enemyy = enemy.body:getLinearVelocity()
		self.speed = self.speed + self.speed_inc
		ball.body:setLinearVelocity(-self.speed, enemyy / 2)
		self.hit_sound:play()
	elseif self.body:isTouching(bounds.goal_left.body) then
		enemy.score = enemy.score + 1
		ball:reset()
	elseif self.body:isTouching(bounds.goal_right.body) then
		player.score = player.score + 1
		ball:reset()
	end

	if self.body:isTouching(bounds.wall_upper.body) or self.body:isTouching(bounds.wall_lower.body) then
		self.hit_sound:play()
	end

	if player.score > 9 or enemy.score > 9 then
		self.win_sound:play()
		player.score = 0
		enemy.score = 0
	end
end

function ball:reset()
	ball.body:setPosition(ball.startx, ball.starty)
	ball.body:setLinearVelocity(0, 0)
	self.goal_sound:play()
	ball.speed = ball.start_speed
	ball.is_reset = true
end

function ball:serve()
	if player.score > enemy.score then
		serve_velocity = ball.speed
	elseif enemy.score > player.score then
		serve_velocity = -ball.speed
	else
		if math.random(0, 1) == 0 then
			serve_velocity = ball.speed
		else
			serve_velocity = -ball.speed
		end
	end

	ball.body:setLinearVelocity(serve_velocity, 0)
	ball.is_reset = false
end

function love.keypressed(key, scancode, isrepeat)
	if key == 'space' and ball.is_reset then
		ball:serve()
	elseif key == 'r' then
		ball:reset()
	end
end
