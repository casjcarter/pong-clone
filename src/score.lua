score = {}

function score:load()
	self.img_0 = love.graphics.newImage("assets/sprites/nums_0.png")
	self.img_0:setFilter("nearest")
	self.img_1 = love.graphics.newImage("assets/sprites/nums_1.png")
	self.img_1:setFilter("nearest")
	self.img_2 = love.graphics.newImage("assets/sprites/nums_2.png")
	self.img_2:setFilter("nearest")
	self.img_3 = love.graphics.newImage("assets/sprites/nums_3.png")
	self.img_3:setFilter("nearest")
	self.img_4 = love.graphics.newImage("assets/sprites/nums_4.png")
	self.img_4:setFilter("nearest")
	self.img_5 = love.graphics.newImage("assets/sprites/nums_5.png")
	self.img_5:setFilter("nearest")
	self.img_6 = love.graphics.newImage("assets/sprites/nums_6.png")
	self.img_6:setFilter("nearest")
	self.img_7 = love.graphics.newImage("assets/sprites/nums_7.png")
	self.img_7:setFilter("nearest")
	self.img_8 = love.graphics.newImage("assets/sprites/nums_8.png")
	self.img_8:setFilter("nearest")
	self.img_9 = love.graphics.newImage("assets/sprites/nums_9.png")
	self.img_9:setFilter("nearest")
	self.img_hyphen = love.graphics.newImage("assets/sprites/nums_hyphen.png")
	self.img_hyphen:setFilter("nearest")
end

function score:update()
	if player.score == 0 then self.player_score_img = self.img_0
	elseif player.score == 1 then self.player_score_img = self.img_1
	elseif player.score == 2 then self.player_score_img = self.img_2
	elseif player.score == 3 then self.player_score_img = self.img_3
	elseif player.score == 4 then self.player_score_img = self.img_4
	elseif player.score == 5 then self.player_score_img = self.img_5
	elseif player.score == 6 then self.player_score_img = self.img_6
	elseif player.score == 7 then self.player_score_img = self.img_7
	elseif player.score == 8 then self.player_score_img = self.img_8
	elseif player.score == 9 then self.player_score_img = self.img_9
	else self.player_score_img = self.img_hypen
	end

	if enemy.score == 0 then self.enemy_score_img = self.img_0
	elseif enemy.score == 1 then self.enemy_score_img = self.img_1
	elseif enemy.score == 2 then self.enemy_score_img = self.img_2
	elseif enemy.score == 3 then self.enemy_score_img = self.img_3
	elseif enemy.score == 4 then self.enemy_score_img = self.img_4
	elseif enemy.score == 5 then self.enemy_score_img = self.img_5
	elseif enemy.score == 6 then self.enemy_score_img = self.img_6
	elseif enemy.score == 7 then self.enemy_score_img = self.img_7
	elseif enemy.score == 8 then self.enemy_score_img = self.img_8
	elseif enemy.score == 9 then self.enemy_score_img = self.img_9
	else self.enemy_score_img = self.img_hypen
	end
end

function score:draw()
	love.graphics.draw(self.player_score_img, (screenw/2) - (self.img_hyphen:getPixelWidth()*pixel_size*1.5), 0, 0, pixel_size)
	love.graphics.draw(self.img_hyphen, (screenw/2) - (self.img_hyphen:getPixelWidth()*pixel_size/2), 0, 0, pixel_size)
	love.graphics.draw(self.enemy_score_img, (screenw/2) + (self.img_hyphen:getPixelWidth()*pixel_size/2), 0, 0, pixel_size)
end
