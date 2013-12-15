module(..., package.seeall)


local director = require("director")
local widget = require( "widget" )


new = function( params )


  local scoreDisplay = display.newGroup()
  
  local group = display.newGroup()

  widget.setTheme( "widget_theme_ios" )
  local buttonx = 130
  local buttony = 35

  --BACKGROUND----------------------------------------------------------------------
    local background = display.newImageRect(GetGlobalEndMenuBackground(),display.actualContentWidth, display.actualContentHeight, true)  
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    scoreDisplay:insert(background)
    

       --LABELS------------------------------------------------------------------------
       
  local HighScore1 = widget.newButton 
  {
      textOnly = true,
      isEnabled = false,

     width = buttonx,
     height = buttony,
     left = display.contentCenterX - 150,
     top = display.contentCenterY-190,    
     label = GlobalHighScores[1].GetScore(),
     font = "Britannic Bold",
     fontSize = 16,
     labelColor = { default = {  0, 0, 256 }},
    
  }
  group:insert( HighScore1 )
    
  

  --BACK BUTTON----------------------------------------------------------------------
local highscoreBackButton = widget.newButton
{    
    width = buttonx,
    height = buttony,
    left = display.contentCenterX - buttonx/2,
    top = display.contentCenterY + buttony*3 + 32,    
    id = "button_4",
    label = "BACK",
    font = "Britannic Bold",
    fontSize = 16,
    labelColor = { default = {  0, 0, 90 }},    
}
group:insert( highscoreBackButton )
local function backbuttonListener( event )
          director:changeScene( "menu", "None" )
          return true
end
highscoreBackButton:addEventListener("touch", backbuttonListener )  

return scoreDisplay

end