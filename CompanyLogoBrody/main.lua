-- Title: Company Logo Animation
-- Name: Brody Lawson
-- Course: ICS2O

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

--global variables
scrollSpeed = 3

-- background image with and height
local backgroundImage = display.newImageRect("Images/", 2048, 1536)

-- character image with width and height
local  = display.newImageRect("Images/", 250, 250)

-- set the image to be transparent
.alpha = 0

-- set the initial x and y position of the 
.x = 0
.y = display.contentHeight/3

-- Function: MoveShip
-- Input: this function accepts
-- Output: none
-- Description: This function adds speed to the x-value of the ship
local function MoveLogo(event)
	-- add the scroll speed to the x-value of the ship
	.x = .x + scrollSpeed
	--change the transparency of the ship every time it moves so that it fades in
	.alpha = .alpha + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip) 