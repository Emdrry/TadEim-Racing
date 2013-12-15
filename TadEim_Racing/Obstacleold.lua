--Obstacle klase
--
local physics = require "physics"
local obstacle = {}
local obstacle_mt = { __index =Obstacle}

function obstacle.new(pic)
local obstacleSheet = sprite.newSpriteSheet(pic , 32, 32)
local obstacleSet = sprite.newSpriteSet(obstacleSheet, 1, 12)
sprite.add (obstacleSet, "standing", 1, 1, 40, 0)
local obstacle = sprite.newSprite(obstacleSet)

obstacle.x = math.random(0, display.actualContentWidth)
obstacle.y = math.random(-200, -32)
obstacle:prepare("standing")
obstacle:play()
physics.addBody(obstacle, {density = 1, friction = 1, bounce = 0.5} )
if obstacle.y > display.actualContentWidth then
				obstacle:removeSelf()
				obstacle = nil
end

function update()
		obstacle.y = obstacle.y + GetGlobalSpeed()
end
--
timer.performWithDelay(1, update, -1)

end

--
return obstacle