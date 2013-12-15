module(..., package.seeall)
local director = require("director")

local sprite = require ( "sprite" )	
local Track = require ( "Track" )
local Car = require ( "Car" )
local Obstacle = require ( "Obstacle" )
local Timer = require ("Timer")


new = function( params )
    game2Display = display.newGroup()	
	
    --physics.setDrawMode( "hybrid" )
    
	local inEvent = 03
	local eventRun = 0
	local isTrue = false
--SOUNDS-------------------------------------------------------------------------------
	local inGameSound = audio.loadStream("Sounds/InGame.mp3")
	local inGameMusicChannel=audio.play(inGameSound,{channel=2,loops=-1,fadein=2000})
	audio.fade({ channel=2, time=2000 , volume=GetGlobalMusicSound()  }  )


	--OBJECT CREATION--------------------------------------------------------------------------
	local Car2 = Car.new()	
	local Track2 = Track.new()
	local Timer2 = Timer.new(0)	
	Timer.timerDown(3)



	function afterTimerEnds2()
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
	return game2Display
end

	
