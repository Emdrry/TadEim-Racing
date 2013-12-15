local globalVariables ={}
local globalVariables_mt = { __index = GlobalVariables}
local Record = require ("Record")
function globalVariables.new()
	local GlobalSpeed = 5
	local GlobalDifficulty = 2
	local GlobalMusicSound = 0.5
	local GlobalMute = true
	local GlobalMenuBackground = "Images/menubackground.jpg"
	local GlobalEndMenuBackground = "Images/endbackground.jpg"
	local GlobalHighScores ={}
	local GlobalSecondGame = false


	function GetGame()
		return GlobalSecondGame
	end

	function SetGame(i)
		GlobalSecondGame = i
	end
		
	
	

	local function compare( a, b )
    	return a.GetScore() < b.GetScore()
	end 

	function SetHighScore (nam,scor,diff)
		table.insert(GlobalHighScores,1,Record.new(nam,scor,diff))
		table.sort(GlobalHighScores, compare)
	end
		



	function GetGlobalEndMenuBackground()
		return GlobalEndMenuBackground
	end
	function GetGlobalMenuBackground()
		return GlobalMenuBackground
	end

	function GetGlobalMute()
		return GlobalMute
	end
	function SetGlobalMute(Mute)
		GlobalMute = Mute
	end


	function GetGlobalMusicSound()
		return GlobalMusicSound
	end
	function SetGlobalMusicSound(Sound)
		GlobalMusicSound = Sound
	end

	function GetGlobalDifficulty()
		return GlobalDifficulty
	end
	function SetGlobalDifficulty(Difficulty)
		GlobalDifficulty = Difficulty
	end

	function GetGlobalSpeed()
		return GlobalSpeed
	end

	function SetGlobalSpeed(Speed)
		GlobalSpeed=Speed
	end
end
	return globalVariables