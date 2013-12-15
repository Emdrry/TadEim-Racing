module(..., package.seeall)


local director = require("director")
local widget = require( "widget" )


new = function( params )
    local endMenuDisplay = display.newGroup()
    local group = display.newGroup()
    --SOUNDS--------------------------------------------------------------------------
	local endMeniuSound = audio.loadStream("Sounds/crowdapplause.wav")
	local endMenuBackgroundMusicChannel = audio.play( endMeniuSound, { channel=3, loops=-1, fadein=1 }  )
	--BACKGROUND----------------------------------------------------------------------
    local background = display.newImageRect(GetGlobalEndMenuBackground(),display.actualContentWidth, display.actualContentHeight, true)	 
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    endMenuDisplay:insert(background)   

     
    widget.setTheme( "widget_theme_ios" )
    local buttonx = 130
    local buttony = 35

    --BACK BUTTON----------------------------------------------------------------------
    local backButton = widget.newButton
    {    
        width = buttonx,
        height = buttony,
        left = display.contentCenterX - buttonx/2,
        top = display.contentCenterY + buttony*3 + 32, 
        id = "button_4",   
        label = "MAIN MENIU",
        font = "Britannic Bold",
        fontSize = 16,
        labelColor = { default = {  0, 0, 90 }},    
    }
    group:insert( backButton )
    local function backbuttonListener( event )
        audio.fadeOut({ channel=3, time=50 } )
        audio.dispose(endMenuBackgroundMusicChannel)
        audio.dispose(endMenuGameSound)
        SetGame(true)
        director:changeScene( "menu", "None" )
        
        return true
    end
    backButton:addEventListener("touch", backbuttonListener )

    --LABEL------------------------------------------------------------------------
    local Label = widget.newButton 
    {
    textOnly = true,
    isEnabled = false,

    width = buttonx,
    height = buttony,
    left = display.contentCenterX - buttonx/2,
    top = display.contentCenterY -50, 
    id = "button_0",
    label = "YOU WON",
    font = "Britannic Bold",
    fontSize = 16,
    labelColor = { default = {  0, 0, 256 }},
    
    }
    group:insert( Label )

	return endMenuDisplay    
end