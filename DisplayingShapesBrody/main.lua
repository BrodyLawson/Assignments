-- Title: Displaying Shapes
-- Name: Brody Lawson
-- Course: ICS2O
-- This Program displays three diffrent shapes

-- Create the local variables for my shapes

local myTriangle
local vertices = { 100,200, 150,100, 200,200 }
myTriangle = display.newPolygon ( 256, 192, vertices)
myTriangle.fill = { 1, 1, 0 }
myTriangle.strokeWidth = 10
myTriangle:setStrokeColor( 1, 1, 1 )

local myQuadrilateral
local vertices = { 50,150, 150,50, 100,200, 100,150, }
myQuadrilateral= display.newPolygon ( 512, 192, vertices )
myQuadrilateral.fill = { 1, 0, 1 }
myQuadrilateral.strokeWidth = 10
myQuadrilateral:setStrokeColor( 0, 1, 0 )

local myPolygon
local vertices = { 0,-100, 50,0, 35,100, -35,100, -50,0 }
myPolygon = display.newPolygon ( 750, 300, vertices )
myPolygon.fill = { 1, 0, 0 }
myPolygon.strokeWidth = 10
myPolygon:setStrokeColor( 0, 0, 1 )

-- make the text for the shapes
local textObjectTriangle
 textObjectTriangle = display.newText( "Triangle", 256, 300, nil, 50 )

local textObjectQuadrilateral
textObjectTriangle = display.newText( "Quadrilateral", 512, 300, nil, 50 )

local textObjectPolygon
textObjectPolygon = display.newText( "Polygon", 750, 400, nil, 50 )

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 0.5, 0, 1)