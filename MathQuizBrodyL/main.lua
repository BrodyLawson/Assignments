-- Title:
-- Name: Brody Lawson
-- Course: ICS2O
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- det the background colour
display.setDefault("background", 255/255, 179/255, 0 )

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------------------

--CRATE THE LOCAL VARIABLES
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local temp
local userAnswer
local correctAnswer
local pointsTextObject
local numberPoints = 0
local randomOperator

local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2
local heart3

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------------------------------------------------------------------

-- Correct sound
local correctSound = audio.loadSound( "Sounds/CorrectSound.mp3" )
local correctSoundChannel

-- Incorrect sound
local wrongSound = audio.loadSound( "Sounds/IncorrectSound.wav" )
local wrongSoundChannel

local gameOverSound = audio.loadSound( "Sounds/GameOver.wav" )
local gameOverSoundChannel

local gameWonSound = audio.loadSound( "Sounds/GameWon.mp3" )
local gameWonSoundChannel

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------------------

local function UpdateLives()
	-- compare lives
	if (lives == 2) then
		heart3.isVisible = false

	elseif (lives == 1) then
		heart2.isVisible = false

	elseif (lives == 0) then
		heart1.isVisible = false
		timer.cancel(countDownTimer)
		gameOverSoundChannel = audio.play(gameOverSound)
		gameOver.isVisible = true
		pointsTextObject.isVisible = false
		numericField.isVisible = false
		questionObject.isVisible = false
	end
end

local function ScoreLimit()
	if (numberPoints == 5) then
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = false
		gameWonSoundChannel = audio.play(gameWonSound)
		gameWon.isVisible = true
		pointsTextObject.isVisible = false
		numericField.isVisible = false
		questionObject.isVisible = false
	end
end

local function UpdateTime()
	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the clock object
	clockText.text = secondsLeft ..""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds
		secondsLeft = totalSeconds
		lives = lives - 1
		UpdateLives() 
	end
end

local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0 )
end

local function AskQuestion()
	-- generate 2 random numbers between a max. and min. number and an operator
	randomOperator = math.random(1,4)

	if (randomOperator == 1) then
		-- randomly genarate 2 numbers
		randomNumber1 = math.random(1,10)
		randomNumber2 = math.random(1,10)
 	
		correctAnswer = randomNumber1 * randomNumber2
	
		--create questionin text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

	elseif (randomOperator == 2) then
		-- randomly genarate 2 numbers
		randomNumber1 = math.random(1,20)
		randomNumber2 = math.random(1,20)

	 	correctAnswer = randomNumber1 + randomNumber2

		--create questionin text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (randomOperator == 3) then
		-- randomly genarate 2 numbers
		randomNumber1 = math.random(1,20)
		randomNumber2 = math.random(1,20)

		if (randomNumber1 < randomNumber2) then
	 		temp = randomNumber1
	 		randomNumber1 = randomNumber2
	 		randomNumber2 = temp
	 		correctAnswer = randomNumber1 - randomNumber2
	 	end

		--create questionin text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
	elseif 	(randomOperator == 4) then
		-- randomly genarate 2 numbers
		randomNumber1 = math.random(1,100)
		randomNumber2 = math.random(1,100)
	 	
	 	correctAnswer = randomNumber1 / randomNumber2

		--create questionin text object
		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "

	end	
end


local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	--User beging editing "numericfeild"
	if ( event.phase == "began" ) then

		--clear text field 
		event.target.text = "" 

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input bto user's answer
		userAnswer = tonumber(event.target.text)

		--if the users answer and the correct answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true 
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(2000, HideCorrect)
			numberPoints = numberPoints + 1
			pointsTextObject.text = "Points = ".. numberPoints
			ScoreLimit()
			secondsLeft = totalSeconds

        -- create increasing points in the text object
			 

		else
			incorrectObject.isVisible = true
			wrongSoundChannel = audio.play(wrongSound)
			timer.performWithDelay(2000,HideIncorrect)
			lives = lives - 1
			UpdateLives()
			secondsLeft = totalSeconds
		end
		event.target.text = "" 

	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Object Creation
-----------------------------------------------------------------------------------------------------------------------------------------------------

heart1 = display.newImageRect ("Images/PixelHeart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect ("Images/PixelHeart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect ("Images/PixelHeart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

clockText = display.newText( "clock = ".. secondsLeft, 128, 111, nil, 50 )

gameOver = display.newImageRect("Images/GameOver.png", display.contentWidth, display.contentHeight )
gameOver.x = display.contentWidth/2
gameOver.y = display.contentHeight/2 
gameOver.isVisible = false

gameWon = display.newImageRect("Images/GameWon.png", display.contentWidth, display.contentHeight )
gameWon.x = display.contentWidth/2
gameWon.y = display.contentHeight/2 
gameWon.isVisible = false

-- create points box adn make it visible
pointsTextObject = display.newText( "Points = ".. numberPoints, 512, 192, nil, 50 )
pointsTextObject:setTextColor(31/255, 151/255, 212/255)

-- display a question and sets the color 
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 80)
questionObject:setTextColor(0/255, 0/255, 0/255)

-- create the correct  text object and make it invisible
correctObject = display.newText("Your correct!" .. "", display.contentWidth/2, 250, nil, 50)
correctObject:setTextColor( 0, 255/255, 0)
correctObject.isVisible = false

-- create the incorrect  text object and make it invisible
incorrectObject = display.newText("Your incorrect!", display.contentWidth/2, 250, nil, 50)
incorrectObject:setTextColor(255/255, 0, 0)
incorrectObject.isVisible = false

-- create numeric field 

numericField = native.newTextField(display.contentWidth/3, display.contentHeight*2/3, 350, 150)
numericField.inputType = "number"

--add the event listener fo the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

-- function calls
StartTimer()

-- call the functionto as the Question
AskQuestion()