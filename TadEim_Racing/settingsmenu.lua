module(..., package.seeall)
local director = require("director")
local widget = require( "widget" )


new = function( params )
     --this function will be returned to the director
     
local menuDisplay = display.newGroup()
local group = display.newGroup()     
widget.setTheme( "widget_theme_ios" )
local buttonx = 130
local buttony = 35
local effectsValue = 0.5

--BACKGROUND----------------------------------------------------------------------
local background = display.newImageRect(GetGlobalMenuBackground(),display.actualContentWidth, display.actualContentHeight, true)     
background.x = display.contentCenterX
background.y = display.contentCenterY
menuDisplay:insert(background)    

--MUSIC LABEL------------------------------------------------------------------------
local musicLabel = widget.newButton 
{
    textOnly = true,
    isEnabled = false,

    width = buttonx,
    height = buttony,
    left = display.contentCenterX - 150,
    top = display.contentCenterY-190,    
    id = "button_0",
    label = "MUSIC VOLUME",
    font = "Britannic Bold",
    fontSize = 16,
    labelColor = { default = {  0, 0, 256 }},
    
}
group:insert( musicLabel )




--MUSIC SOUND SLIDER----------------------------------------------------------------------
local function sliderListener( event )
    local slider = event.target
    local value = event.value
    SetGlobalMusicSound(value/100)
    audio.setVolume( GetGlobalMusicSound(), { channel=1 } )
    SetGlobalMute = true

end

local slider = widget.newSlider
{   
    left = display.contentCenterX - 50,
    top = display.contentCenterY-150,
    width = 170,
    height = 15,
    orientation = horizontal,
    listener = sliderListener
}

-- MUSIC MUTE --------------------------------------------------------------
function musicOnSwitchPress( event )
    local switch = event.target
    if (switch.isOn == true) then
        audio.setVolume( GetGlobalMusicSound(), { channel=1 } )
        audio.setVolume( GetGlobalMusicSound(), { channel=2 } )
        --SetGlobalMute(true)
    end
    if (switch.isOn == false) then 
        audio.setVolume( 0, { channel=1 } )
        audio.setVolume( 0, { channel=2 } )
        --SetGlobalMute(false)
    end
    
    
end

local musicOnOffSwitch = widget.newSwitch
{
    left = display.contentCenterX - 150,
    top = display.contentCenterY-150,
    initialSwitchState = GetGlobalMute(),
    onPress = musicOnSwitchPress,
    
}





--EFFECTS LABEL------------------------------------------------------------------------
local effectsLabel = widget.newButton 
{
    textOnly = true,
    isEnabled = false,

    width = buttonx,
    height = buttony,
    left = display.contentCenterX - 150,
    top = display.contentCenterY-90,    
    label = "EFFECTS VOLUME",
    font = "Britannic Bold",
    fontSize = 16,
    labelColor = { default = {  0, 0, 256 }},
    
}
group:insert( effectsLabel )




--EFFECTS SOUND SLIDER----------------------------------------------------------------------
local function effectSliderListener( event )
    local slider = event.target
    local value = event.value
    audio.setVolume( value/100, { channel=3 } )
    effectsValue = value/100
    
end

local effectsSlider = widget.newSlider
{   
    left = display.contentCenterX - 50,
    top = display.contentCenterY-50,
    width = 170,
    height = 15,
    orientation = horizontal,
    listener = effectSliderListener
}

-- EFFECTS MUTE --------------------------------------------------------------
local function effectsOnSwitchPress( event )
    local switch = event.target
    if (switch.isOn == true) then
        audio.setVolume( effectsValue, { channel=3 } )
    end
    if (switch.isOn == false) then 
        audio.setVolume( 0, { channel=3 } )
    end
    
    
end

local effectsOnOffSwitch = widget.newSwitch
{
    left = display.contentCenterX - 150,
    top = display.contentCenterY-50,
    initialSwitchState = true,
    onPress = efectsOnSwitchPress,
    onRelease = effectsOnSwitchPress,
}







--BACK BUTTON----------------------------------------------------------------------
local backButton = widget.newButton
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
group:insert( backButton )
local function backbuttonListener( event )
          director:changeScene( "menu", "None" )
          return true
end
backButton:addEventListener("touch", backbuttonListener )




     return menuDisplay
end     