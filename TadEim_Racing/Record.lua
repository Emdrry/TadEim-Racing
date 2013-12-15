local Record = {}
local Record_mt = { __index = Record}

function Record.new(nam,scor,diff)
	local name = nam
	local score = scor
	local difficulty = diff


	function GetName ()
		return name
	end

	function GetScore()
		return score
	end

	function GetDifficulty()
		return difficulty
	end


end


return Record
