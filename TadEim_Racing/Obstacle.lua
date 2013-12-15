--Obstacle klase
local  sprite = require ("sprite")
local physics = require ("physics")


local Obstacle = {}
local Obstacle_mt = { __index =Obstacle}
function Obstacle.new(pic)
	local	obstacleSheet = sprite.newSpriteSheet(pic , 32, 32)
	local	obstacleSet = sprite.newSpriteSet(obstacleSheet, 1, 12)
	sprite.add (obstacleSet, "standing", 1, 1, 40, 0)
	local	Obstacle = sprite.newSprite(obstacleSet)
	Obstacle.x = math.random(0, display.actualContentWidth)
	Obstacle.y = math.random(-200, -32)
	Obstacle:prepare("standing")
	Obstacle:play()
	physics.addBody(Obstacle, {density = 1, friction = 1, bounce = 0.5} )
	

	function update()
		if (Obstacle.y ~= nil) then 
			Obstacle.y = Obstacle.y + GetGlobalSpeed()
			if Obstacle.y > display.actualContentHeight then
				Obstacle:removeSelf()							
			end
		end
	end
	timerObID = timer.performWithDelay(1, update, -1)
end

function Obstacle.stopObstacles()
	timer.cancel(timerObID) 
end

--
return Obstacle