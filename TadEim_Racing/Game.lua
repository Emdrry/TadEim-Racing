module(..., package.seeall)
local director = require("director")

local sprite = require ( "sprite" )	
local Track = require ( "Track" )
local Car = require ( "Car" )
local Obstacle = require ( "Obstacle" )
local Timer = require ("Timer")


new = function( params )
    gameDisplay = display.newGroup()	
	
    --physics.setDrawMode( "hybrid" )
    
	local inEvent = 03
	local eventRun = 0
	local isTrue = false

	
	
	--OBJECT CREATION--------------------------------------------------------------------------
	local Car1 = Car.new()	
	local Track1 = Track.new()
	local Timer1 = Timer.new(0)	
	Timer.timerDown(3)

	--SOUNDS-------------------------------------------------------------------------------
	local inGameSound = audio.loadStream("Sounds/InGame.mp3")
	local inGameMusicChannel=audio.play(inGameSound,{channel=2,loops=-1,fadein=2000})
	function afterTimerEnds()
		--INIATILIZATION--------------------------------------------------------------------------
	if Track.GetTrackState() == false then
		Track.moveTrack()
		Timer.timerUp()		   		
   	end
		Runtime:addEventListener("touch", touched, -1)
					
    	local function checkEvent()		 		
 		if(eventRun > 0) then     
			eventRun = eventRun - 1
          	if(eventRun == 0) then
          		inEvent = 0
          	end
     	end     
     	if(inEvent > 0 and eventRun > 0) then          
     	else         
          	check = math.random(100) 
          	if(check > 80 and check < 99) then             
              	inEvent = math.random(10)
               	eventRun = 1
         	end		  
		  	if(check > 98) then
				inEvent = 11
				eventRun = 2
			end
    	end    
     	if(inEvent > 0) then
          	runEvent()
    	end    	
		end	
	
		
	end


	local function SlowSpeed()
		local initialSpeed = GetGlobalSpeed()
		if GetGlobalSpeed()>=5 then
			SetGlobalSpeed(GetGlobalSpeed()-5)
		end
		local function RestoreSpeed()
			if (GetGlobalSpeed()<initialSpeed) then
				SetGlobalSpeed(GetGlobalSpeed()+2)
			end
		end
		timer.performWithDelay(1000, RestoreSpeed, -1)
	end


	

	Runtime:addEventListener ( "collision", SlowSpeed)
	return gameDisplay
end

	

