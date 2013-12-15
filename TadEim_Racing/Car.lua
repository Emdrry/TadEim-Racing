--Car klase
local sprite = require ("sprite")
local physics = require ("physics")
local Track = require ("Track")
Track.new()
local Car = {}
local Car_mt = { __index = Car}
function Car.new()
	physics.start()
	--print ( " pavyko.")
	local speed = GetGlobalSpeed()
	local maxSpeed = 50
	local width = 75
	local length = 157
	local health = 100
	--local racer = ("images/carr.png")
	-- local spriteSheet = sprite.newSpriteSheet("Images/carr.png", 75, 157)
	-- local racerSet = sprite.newSpriteSet(spriteSheet, 1, 1)
	-- sprite.add(racerSet, "driving", 1, 1, 800, 0)
	 local spriteSheet = sprite.newSpriteSheet("Images/redcar.png", 66, 66)
	 local racerSet = sprite.newSpriteSet(spriteSheet, 1, 16)
	 sprite.add(racerSet, "driving", 13, 4, 800, 0)
	 sprite.add(racerSet, "left", 5, 4, 1600, 1)
	 sprite.add(racerSet, "right", 9, 4, 800, 1)
	local Car = sprite.newSprite(racerSet)
	up = true
	Car.x = display.actualContentWidth/2
	Car.y = display.actualContentHeight - 85
	Car:prepare("driving")
	Car:play()
	rectangleShape = { -16,-30, 16,-30, 16,30, -16,30}
	physics.addBody(Car, "static", {density = 1.5, friction = 1, bounce = 0.5, shape=rectangleShape } )
	
	local function Deletion()
		if Track.GetTrackState()== true then
			--Car:removeSelf()
		end
	end
	timer.performWithDelay(1000,Deletion,-1)
	
 	function touched (event) 		
 		if (Track.GetTrackState()==false) then
		if(event.phase == "began") or (event.phase == "moved") then
			if (Car.x ~= 20) and (Car.x ~= display.actualContentWidth - 20) then
				if (Car.x < event.x) then
					Car.x = Car.x + 10
				else
					Car.x = Car.x - 10
				end
			else
				if (Car.x == 20) then
					Car.x = Car.x + 10
				else
					if (Car.x == display.actualContentWidth - 20) then
					Car.x = Car.x - 10
					end
				end
			end
		end
	end
 	end


	
 	
end

return Car