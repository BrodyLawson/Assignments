-- Title: Displaying Shapes
-- Name: Brody Lawson
-- Course: ICS2O
-- This Program displays three diffrent shapes

-- Create the local variables for my shapes

local myPolygon
local vertices = { 0,85, 35,190, 85,32, 55,-65, 85,-205 }
myPolygon = display.newPolygon ( 256, 192, vertices )
myPolygon.fill = { 1, 1, 0 }
myPolygon.strokeWidth = 10
myPolygon:setStrokeColor( 1, 1, 1 )
