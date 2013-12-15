

module(..., package.seeall)


local director = require("director")
local widget = require( "widget" )


new = function( params )
     --this function will be returned to the director
     local menuDisplay = display.newGroup()
     
     
--SOUNDS--------------------------------------------------------------------------
local meniuSound = audio.loadStream("Sounds/Menu.mp3")
local backgroundMusicChannel = audio.play( meniuSound, { channel=1, loops=-1, fadein=2000 }  )
audio.fade({ channel=1, time=2000 , volume=GetGlobalMusicSound()  }  )
--BACKGROUND----------------------------------------------------------------------
     local background = display.newImageRect(GetGlobalMenuBackground(),display.actualContentWidth, display.actualContentHeight, true)	 
     background.x = display.contentCenterX
     background.y = display.contentCenterY
     menuDisplay:insert(background)    
     
     
--TITTLE----------------------------------------------------------------------
local title = display.newImageRect("Images/Title.png",300, 400)
     title.x = display.contentCenterX
     title.y = display.contentCenterY- 100
     menuDisplay:insert(title)





widget.setTheme( "widget_theme_ios" )
local group = display.newGroup()
local buttonx = 130
local buttony = 35



--PLAY BUTTON----------------------------------------------------------------------
local playButton = widget.newButton
{
    
    width = buttonx,
    height = buttony,
    left = display.contentCenterX - buttonx/2,
    top = display.contentCenterY - buttony/2,    
    id = "button_1",
    label = "NEW GAME",
    font = "Britannic Bold",
    fontSize = 16,
    labelColor = { default = {  0, 0, 90 }},
}
group:insert( playButton )

local function playbuttonListener( event )
          director:changeScene( "modeselectmenu", "None" )
          return true
end
playButton:addEventListener("touch", playbuttonListener )






-- --SCORE BUTTON----------------------------------------------------------------------
-- local scoreButton = widget.newButton
-- {
    
--     width = buttonx,
--     height = buttony,
--     left = display.contentCenterX - buttonx/2,
--     top = display.contentCenterY - buttony/2 + 40,    
--     id = "button_2",
--     label = "HIGHSCORES",
--     font = "Britannic Bold",
--     fontSize = 16,
--     labelColor = { default = {  0, 0, 90 }},
-- }
-- group:insert( scoreButton )
-- local function highscoreButtonListener( event )
--           director:changeScene( "scores", "None" )
--           return true
-- end
-- scoreButton:addEventListener("touch", highscoreButtonListener )




--Settings BUTTON----------------------------------------------------------------------
local settingsButton = widget.newButton
{
    
    width = buttonx,
    height = buttony,
    left = display.contentCenterX - buttonx/2,
    top = display.contentCenterY - buttony/2 + 80,    
    id = "button_3",
    label = "SETTINGS",
    font = "Britannic Bold",
    fontSize = 16,
    labelColor = { default = {  0, 0, 90 }},
}
group:insert( settingsButton )
local function settingsButtonListener( event )
          director:changeScene( "settingsmenu", "None" )
          return true
end
settingsButton:addEventListener("touch", settingsButtonListener )



--EXIT BUTTON----------------------------------------------------------------------
local exitButton = widget.newButton
{
    
    width = buttonx,
    height = buttony,
    left = display.contentCenterX - buttonx/2,
    top = display.contentCenterY - buttony/2 + 120,    
    id = "button_4",
    label = "EXIT",
    font = "Britannic Bold",
    fontSize = 16,
    labelColor = { default = {  0, 0, 90 }},
    
}
group:insert( exitButton )
local function exitbuttonListener( event )
          os.exit()
          return true
end
exitButton:addEventListener("touch", exitbuttonListener )

     



--return the display group at the end
     return menuDisplay
end