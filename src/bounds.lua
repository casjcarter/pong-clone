bounds = {}

function bounds:load(world)
	self.wall_upper = {}
	self.wall_upper.body = love.physics.newBody(world, 0, 0, "static")
	self.wall_upper.shape = love.physics.newEdgeShape(0, 0, screenw, 0)
	self.wall_upper.fixture = love.physics.newFixture(self.wall_upper.body, self.wall_upper.shape, 1)

	self.wall_lower = {}
	self.wall_lower.body = love.physics.newBody(world, 0, 0, "static")
	self.wall_lower.shape = love.physics.newEdgeShape(0, screenh, screenw, screenh)
	self.wall_lower.fixture = love.physics.newFixture(self.wall_lower.body, self.wall_lower.shape, 1)

	self.goal_left = {}
	self.goal_left.body = love.physics.newBody(world, 0, 0, "static")
	self.goal_left.shape = love.physics.newEdgeShape(0, 0, 0, screenh)
	self.goal_left.fixture = love.physics.newFixture(self.goal_left.body, self.goal_left.shape, 1)

	self.goal_right = {}
	self.goal_right.body = love.physics.newBody(world, 0, 0, "static")
	self.goal_right.shape = love.physics.newEdgeShape(screenw, 0, screenw, screenh)
	self.goal_right.fixture = love.physics.newFixture(self.goal_right.body, self.goal_right.shape, 1)

end
