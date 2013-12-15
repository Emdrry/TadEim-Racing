local Obstacle = require ( "Obstacle" )
local Timer = require ( "Timer" )
local director = require("director")
local Record = require ("Record")
local Track ={}
local Obstacles = {}
local Track_mt = { __index = Track}
local trackDisplay = display.newGroup()
function Track.new()	
	
	local backgroundTiles = {}
	local trackLength = GetGlobalDifficulty()*5000
	local currentLength = 0
	local timerID = timer.performWithDelay(1, updateBackgrounds, -1)
	local arSukurta = false
	local State = false
	function drawBackground ()
		backgroundTiles[1] = display.newImageRect("Images/Track.jpg", display.actualContentWidth, display.actualContentHeight,true)
		backgroundTiles[1].x = display.contentCenterX
		backgroundTiles[1].y = display.contentCenterY 
		trackDisplay:insert(backgroundTiles[1])
		backgroundTiles[2] = display.newImageRect ("Images/Track.jpg", display.actualContentWidth, display.actualContentHeight,true)
		backgroundTiles[2].x = display.contentCenterX
		backgroundTiles[2].y = 10 - backgroundTiles[1].y
		trackDisplay:insert(backgroundTiles[2])
	end

	drawBackground()

	function Track.moveTrack()	
		local function renew()
     		for amount = 1, GetGlobalDifficulty()*1.5,1 do
     			table.insert(Obstacles, amount, Obstacle.new("Images/barrel12.png"))        
        	end
      	end
      	timerrenewID = timer.performWithDelay(4000/GetGlobalDifficulty(), renew, -1)



		function updateBackgrounds()
			
      		
			if (currentLength + display.actualContentHeight < trackLength) then	
				for i=1,table.maxn(backgroundTiles),1 do
					backgroundTiles[i].y=backgroundTiles[i].y +GetGlobalSpeed()
				end
				currentLength = currentLength + GetGlobalSpeed()
				if backgroundTiles[1].y >=  backgroundTiles[1].contentHeight + display.contentCenterY  - 10 then
					backgroundTiles[1].y = - display.contentCenterY +10
					table.insert(backgroundTiles,backgroundTiles[1])
					table.remove(backgroundTiles,1)
				end
			else				
				if (arSukurta ==false) then
					table.insert(backgroundTiles,display.newImageRect("Images/finish.jpg",display.actualContentWidth,70,true))
					backgroundTiles[table.maxn(backgroundTiles)].x = display.contentCenterX
					backgroundTiles[table.maxn(backgroundTiles)].y = -35 
					trackDisplay:insert(backgroundTiles[table.maxn(backgroundTiles)])
					arSukurta=true
				end
				if currentLength <= trackLength then
					for i=1,table.maxn(backgroundTiles),1 do
						backgroundTiles[i].y=backgroundTiles[i].y +GetGlobalSpeed()
					end
					if backgroundTiles[1].y >=  backgroundTiles[1].contentHeight + display.contentCenterY  - 10 then
							backgroundTiles[1].y = - display.contentCenterY +10
							table.insert(backgroundTiles,backgroundTiles[1])
							table.remove(backgroundTiles,1)
					end
				currentLength = currentLength + GetGlobalSpeed()
				--END OF TRACK----------------------------------------------------------
				if currentLength >= trackLength then 
					timer.cancel(timerID) 
					timer.cancel(timerrenewID)
					Timer.stopTimerUp()
					audio.fadeOut({ channel=2, time=500 } )
    				audio.dispose(inGameMusicChannel)
    				audio.dispose(inGameSound)
    				State = true
    				for  k=1, table.maxn(backgroundTiles),1 do
    					table.remove(backgroundTiles,1)
    				end    				
					director:changeScene( "endmenu", "Fade" )
				end	
				end	
			end
		end
	
	timerID = timer.performWithDelay(1, updateBackgrounds, -1)
	end	
	function Track.GetTrackState()
		return State
	end
trackDisplay:toFront()
end
	

return Track