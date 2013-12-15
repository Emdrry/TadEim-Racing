local Timer = {}
local Timer_mt = { __index = Timer}
local timerDisplay = display.newGroup()

function Timer.new(beginTime)
	local time = beginTime
	currentTime = display.newText(time, display.contentCenterX-10, display.contentCenterY, "Britannic Bold", 40)
	currentTime:setTextColor(255, 255, 0)
	timerDisplay:insert(currentTime)
	timerDisplay:toBack()
	function Timer.getTime()
		return time
	end
end


function Timer.timerUp()
	currentTimeUp = display.newText(time, display.contentCenterX-150, display.contentCenterY-220, "Britannic Bold", 40)
	currentTimeUp:setTextColor(255, 255, 0)
	currentTimeUp:setTextColor(255, 255, 0)
	time = 0
	currentTimeUp.text = time
	local function updateTimerUp()	
		time = time +1
		currentTimeUp.text = time
	end
  	timerUpID = timer.performWithDelay(1000,updateTimerUp,0)
end

function Timer.GetTime()
	return time
end


function Timer.stopTimerUp()
	timer.cancel(timerUpID)
	return Timer.getTime()
end


function Timer.timerDown(timeLeft)
		local countDownFinished = false
		currentTime:setTextColor(0, 0, 0)
		time = timeLeft
		currentTime.text = time
			local function updateTimerDown()	
				time = time -1
				currentTime.text = time
				if(time==0)then
					countDownFinished = true
        			Game.afterTimerEnds()
        			currentTime:setTextColor(0, 0, 0,0)
        		end
  			end
  		timer.performWithDelay(1000,updateTimerDown,time+1)

  		

end


return Timer
