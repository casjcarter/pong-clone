require("src/ball")
require("src/bounds")
require("src/enemy")
require("src/player")
require("src/score")
require("src/util")


function love.load()
	love.physics.setMeter(64)
	world = love.physics.newWorld(0, 0, true)

	player:load(world)
	enemy:load(world)
	bounds:load(world)
	ball:load(world)
	score:load()
end

function love.update(dt)
	world:update(dt)
	player:update(dt)
	enemy:update(dt)
	ball:update(dt)
	score:update(dt)
end

function love.draw()
	score:draw()
	player:draw()
	enemy:draw()
	ball:draw()
end

