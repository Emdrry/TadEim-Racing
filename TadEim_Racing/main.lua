-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------




display.setStatusBar(display.HiddenStatusBar)

local director = require("director")
local physics = require( "physics" )

local mainGroup = display.newGroup()

local main = function()
	physics.start()
	physics.setGravity( 0, 0 )	
	GlobalVariables = require ( "GlobalVariables" )
	Variables = GlobalVariables.new()		
    mainGroup:insert(director.directorView)
    director:changeScene("menu")
    
end

main()







	
