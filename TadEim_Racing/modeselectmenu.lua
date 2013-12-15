module(..., package.seeall)
local director = require("director")
local widget = require( "widget" )





new = function( params )
     --this function will be returned to the director
     local menuDisplay = display.newGroup()
     







 --BACKGROUND----------------------------------------------------------------------
local background = display.newImageRect(GetGlobalMenuBackground(),display.actualContentWidth, display.actualContentHeight, true)     
background.x = display.contentCenterX
background.y = display.contentCenterY
menuDisplay:insert(background)    
     
     


widget.setTheme( "widget_theme_ios" )
local group = display.newGroup()
local buttonx = 130
local buttony = 35
local fieldWidth = 90
local fieldHeight = 60	 



--MODE SELECT -----------------------------------------------
local function onPress( event )
    local target = event.target
    SetGlobalDifficulty(target.segmentNumber)
    
end

local modeSelect = widget.newSegmentedControl
{
    segmentWidth = 60,
    left = display.contentCenterX - 120,
    top = 100,     
    segments = { "Easy", "Normal", "Hard" , "Kaunas"},
    defaultSegment = GetGlobalDifficulty(),
    onPress = onPress,
}


--PLAY BUTTON----------------------------------------------------------------------
local playButton = widget.newButton
{    
    width = buttonx,
    height = buttony,
    left = display.contentCenterX - buttonx/2,
    top = display.contentCenterY + buttony*2,    
    id = "button_1",
    label = "START GAME",
    font = "Britannic Bold",
    fontSize = 16,
    labelColor = { default = {  0, 0, 90 }},
}
group:insert( playButton )
local function playbuttonListener( event )
    audio.fadeOut({ channel=1, time=500 } )   
    audio.dispose(backgroundMusicChannel)
    audio.dispose(inGameSound)    
    director:changeScene( "Game", "Fade" )
   
    return true
end
playButton:addEventListener("touch", playbuttonListener )


--BACK BUTTON----------------------------------------------------------------------
local backButton = widget.newButton
{
    
    width = buttonx,
    height = buttony,left = display.contentCenterX - buttonx/2,
    top = display.contentCenterY + buttony*3 + 32,
        
    id = "button_4",
    label = "BACK",
    font = "Britannic Bold",
    fontSize = 16,
    labelColor = { default = {  0, 0, 90 }},
    
}
group:insert( backButton )
local function backbuttonListener( event )
          director:changeScene( "menu", "None" )
          return true
end
backButton:addEventListener("touch", backbuttonListener )
	
	 
	
	 
	 

 --CAR SELECT ------------------------------------------------------
Border = display.newRect(  display.contentCenterX - fieldWidth/2, display.contentCenterY-fieldHeight/2, fieldWidth, fieldHeight )
          Border:setFillColor( 0, 0, 0, 0 )
          Border.strokeWidth = 2
          Border:setStrokeColor( 255, 255, 255)
          menuDisplay:insert(Border)


local carfield1 = display.newImageRect("Images/scooter.png",fieldWidth, fieldHeight)
     carfield1.x = display.contentCenterX - 100
     carfield1.y = display.contentCenterY
     menuDisplay:insert(carfield1)   

     local function carfield1buttonListener( event )
        SetGlobalSpeed(3)
        Border:removeSelf()
        Border = display.newRect(  display.contentCenterX - 100 - fieldWidth/2, display.contentCenterY-fieldHeight/2, fieldWidth, fieldHeight )
          Border:setFillColor( 0, 0, 0, 0 )
          Border.strokeWidth = 1
          Border:setStrokeColor( 255, 255, 255)    
           
          return true
     end
carfield1:addEventListener("touch", carfield1buttonListener )




local carfield2 = display.newImageRect("Images/redcaronly.png",fieldWidth, fieldHeight)
     carfield2.x = display.contentCenterX 
     carfield2.y = display.contentCenterY
     menuDisplay:insert(carfield2)  

     local function carfield2buttonListener( event )
        SetGlobalSpeed(7)
        Border:removeSelf()
        Border = display.newRect(  display.contentCenterX - fieldWidth/2, display.contentCenterY-fieldHeight/2, fieldWidth, fieldHeight )
          Border:setFillColor( 0, 0, 0, 0 )
          Border.strokeWidth = 1
          Border:setStrokeColor( 255, 255, 255)    
           
          return true
     end
carfield2:addEventListener("touch", carfield2buttonListener )
	 



local carfield3 = display.newImageRect("Images/moto.png",fieldWidth, fieldHeight)
     carfield3.x = display.contentCenterX + 100
     carfield3.y = display.contentCenterY
     menuDisplay:insert(carfield3) 

    local function carfield3buttonListener( event )
        SetGlobalSpeed(10)
        Border:removeSelf()
        Border = display.newRect(  display.contentCenterX + 100 - fieldWidth/2, display.contentCenterY-fieldHeight/2, fieldWidth, fieldHeight )
        Border:setFillColor( 0, 0, 0, 0 )
        Border.strokeWidth = 1
        Border:setStrokeColor( 255, 255, 255)
        return true
    end
carfield3:addEventListener("touch", carfield3buttonListener ) 



      
     

      
	
	
     --return the display group at the end
     return menuDisplay
end