--Start function
function love.load()

  screenWidht = 960
  screenHeight = 540
  love.window.setMode(screenWidht,screenHeight)
  gameInPause = true
  startgame = true
  playerTop = false
  
  trainR = love.graphics.newImage("res/Train_Model_R.png")
  trainG = love.graphics.newImage("res/Train_Model_G.png")
  trainB = love.graphics.newImage("res/Train_Model_B.png")
  trainY = love.graphics.newImage("res/Train_Model_Y.png")
  
  grass = love.graphics.newImage("res/Grass.png")
  rail = love.graphics.newImage("res/Rails.png")
  
  playB = love.graphics.newImage("res/Play_Button.png")
  resetB = love.graphics.newImage("res/Resset_Button.png")
  exitB = love.graphics.newImage("res/Exit_Button.png")
  
  playerModel = love.graphics.newImage("res/player.png")
  
  hitSound = love.audio.newSource("res/hitSound.wav", "static")
  PlayMusic = love.audio.newSource("res/PlayMusic.wav", "stream")
  
  playerWidth = (love.graphics.getWidth() / 30 )
  playerHeight = ((love.graphics.getWidth() / 30) * 2)
  playerPositionValue = 2

  playerLives = 3
  PlayerScore = 0

x = ((love.graphics.getWidth() / 10 ) * 5) - (playerWidth / 2)
y = ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2)

width = playerWidth
height = playerHeight
  
  trainWidth = ((love.graphics.getWidth() / 10 ) * 1.2)
  trainHeight = ((love.graphics.getHeight() / 10 ) * 3)

  train1 = {}
  train1.x = 0
  train1.y = 0 - trainHeight
  train1.x =  ((love.graphics.getWidth() / 10 ) * 2) - trainWidth/2
  
  train2 = {}
  train2.x = 0
  train2.y = 0 - trainHeight * 3
  
  train3 = {}
  train3.x = 0
  train3.y = 0- trainHeight * 5
  
  train4 = {}
  train4.x = 0
  train4.y = 0- trainHeight * 7
  
  resetTimerValue = 3
  gameplayTimer = resetTimerValue
  love.audio.setVolume( 0.5 )
end

--Update Function
function love.update(dt)
gameplayUpdate(dt)
end

-- Draw Function
function love.draw()
gameplayDraw()
end
--

function playerInput(dt)
    love.keypressed(key)
end

function love.keypressed(key)
  
  if key == 's'
  then
    startgame = false
    gameInPause = false
  end
  
  if  gameInPause == false
  then
      if  key == 'a' or key == 'left'
  then if playerPositionValue == 3
        then playerPositionValue = 2
        else
           playerPositionValue = 1
        end
      end
      
  if  key == 'd' or key == 'right'
      then if playerPositionValue == 1
      then playerPositionValue = 2
        else
           playerPositionValue = 3
        end      
  end
end

if gameInPause == true
then
  if key == 'r'
  then
    resetGame()
    gameInPause = false
  end
  
    if key == 'e'
  then
    love.event.quit()
  end
  
end

if playerLives > 0
then
  if key == 'c'
  then if gameInPause == false
     then gameInPause = true
      else
    gameInPause = false
      end
  end
  end
  

end

function drawPlayer(playerPositionValue)

    if  playerPositionValue == 1
    then  x =  ((love.graphics.getWidth() / 10 ) * 2) - (playerWidth / 2)
    elseif  playerPositionValue == 2
    then x =  ((love.graphics.getWidth() / 10 ) * 5) - (playerWidth / 2)
    else
        x =  ((love.graphics.getWidth() / 10 ) * 8) - (playerWidth / 2)
    end
    
    if  y ==  ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2) +10
    then playerTop = true
    end
    
    if  y == ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2)
    then playerTop = false
  end
  
  if playerTop == false
  then
    y = y+1
  elseif playerTop == true
  then
    y = y-1
    end

      playerOfsetX = 15
      playerOfsetY = 0
      playerScaleX = 1
      playerScaleY = 1
      playerRotation = 0
      love.graphics.draw(playerModel,x,y,playerRotation,playerScaleY,playerScaleY,playerOfsetX,playerOfsetY)
   end 
function drawRails()
  railWidth = ((love.graphics.getWidth() / 10 ) * 2)
  railHeight = love.graphics.getHeight()
  
  railOfsetX = 0
  railOfsetY = 0
  railScaleX = 0.1
  railScaleY = 0.1
  railRotation = 0
  
  grassOfsetX = 0
  grassOfsetY = 0
  grassScaleX = 5
  grassScaleY = 5
  grassRotation = 0
  love.graphics.draw(grass,0,0,grassRotation,grassScaleY,grassScaleY,grassOfsetX,grassOfsetY)
  
separacion = 115
      
  --Primer Rail (Centro 1)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 5) - (trainWidth / 2), 0, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 5) - (trainWidth / 2), separacion*1, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 5) - (trainWidth / 2), separacion*2, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 5) - (trainWidth / 2), separacion*3, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 5) - (trainWidth / 2), separacion*4, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)

  --Segundo Rail (izquierda 2)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 2) - (trainWidth / 2), 0, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 2) - (trainWidth / 2), separacion*1, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 2) - (trainWidth / 2), separacion*2, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 2) - (trainWidth / 2), separacion*3, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 2) - (trainWidth / 2), separacion*4, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  
  -- ercer Rail (Derecha 3)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 8) - (trainWidth / 2), 0, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 8) - (trainWidth / 2), separacion*1, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 8) - (trainWidth / 2), separacion*2, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 8) - (trainWidth / 2), separacion*3, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  love.graphics.draw(rail, ((love.graphics.getWidth() / 10 ) * 8) - (trainWidth / 2), separacion*4, railRotation, railScaleY, railScaleY, railOfsetX, railOfsetY)
  
end

function drawTrain()  
trainOfsetX = 35
trainOfsetY = 10
trainScaleX = 1
trainScaleY = 1
trainRotation = 0

 -- love.graphics.rectangle("fill", train1.x,train1.y, trainWidth, trainHeight)
  love.graphics.draw(trainR,train1.x,train1.y,trainRotation,trainScaleX,trainScaleX,trainOfsetX,trainOfsetY)
 -- love.graphics.rectangle("fill", train2.x,train2.y, trainWidth, trainHeight)
  love.graphics.draw(trainG,train2.x,train2.y,trainRotation,trainScaleX,trainScaleX,trainOfsetX,trainOfsetY)
 -- love.graphics.rectangle("fill", train3.x,train3.y, trainWidth, trainHeight)
  love.graphics.draw(trainB,train3.x,train3.y,trainRotation,trainScaleX,trainScaleX,trainOfsetX,trainOfsetY)
 -- love.graphics.rectangle("fill", train4.x,train4.y, trainWidth, trainHeight)
  love.graphics.draw(trainY,train4.x,train4.y,trainRotation,trainScaleX,trainScaleY,trainOfsetX,trainOfsetY)

end

function trainMovement(dt)
    speed = 400
  
  train1.y = train1.y + speed * dt  
  train2.y = train2.y + speed * dt  
  train3.y = train3.y + speed * dt  
  train4.y = train4.y + speed * dt  
end

function OBtrain()
    
  if train1.y > love.graphics.getHeight()then
    train1.y = 0- trainHeight * 5
  end 
  
  if train2.y > love.graphics.getHeight()then
    train2.y = 0- trainHeight * 5
  end 
  
  if train3.y > love.graphics.getHeight()then
    train3.y = 0- trainHeight * 5
  end 

  if train4.y > love.graphics.getHeight()then
    train4.y = 0- trainHeight * 5
  end 

end

function RandTrain()
  rand = 0
  --
if  train1.y <= 0 - (trainHeight +50) then
  rand = love.math.random(1,3)
  
  if  rand == 1 then
  train1.x = ((love.graphics.getWidth() / 10 ) * 2) - trainWidth/2
  elseif rand == 2 then
  train1.x = ((love.graphics.getWidth() / 10 ) * 5) - trainWidth/2
  else 
  train1.x =  ((love.graphics.getWidth() / 10 ) * 8) - trainWidth/2
  end 
end
--
if  train2.y <= 0 - (trainHeight + 50)then
  rand = love.math.random(1,3)
  
  if  rand == 1 then
  train2.x = ((love.graphics.getWidth() / 10 ) * 2) - trainWidth/2
  elseif rand == 2 then
  train2.x = ((love.graphics.getWidth() / 10 ) * 5) - trainWidth/2
  else 
  train2.x = ((love.graphics.getWidth() / 10 ) * 8) - trainWidth/2
  end

end
--
if  train3.y <= 0 - (trainHeight +50) then
  rand = love.math.random(1,3)
  
  if  rand == 1 then
  train3.x = ((love.graphics.getWidth() / 10 ) * 2) - trainWidth/2
  elseif rand == 2 then
  train3.x = ((love.graphics.getWidth() / 10 ) * 5) - trainWidth/2
  else 
  train3.x = ((love.graphics.getWidth() / 10 ) * 8) - trainWidth/2
  end
end
--
if  train4.y <= 0 - (trainHeight +50) then
  rand = love.math.random(1,3)
  
  if  rand == 1 then
  train4.x = ((love.graphics.getWidth() / 10 ) * 2) - trainWidth/2
  elseif rand == 2 then
  train4.x = ((love.graphics.getWidth() / 10 ) * 5) - trainWidth/2
  else 
  train4.x = ((love.graphics.getWidth() / 10 ) * 8) - trainWidth/2
  end
 end
end

function CheckColisionPlayerTrain()
    if (train1.x + trainWidth/2) - playerWidth/2 == x 
  then
    -- print("tren 1 igual al jugador")
    if train1.y + trainHeight > y
    then
  playerLives = playerLives - 1
  x = ((love.graphics.getWidth() / 10 ) * 5) - (playerWidth / 2)
  y = ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2) 
  train1.y = 0 - trainHeight

  train2.y = 0 - trainHeight * 3
  
  train3.y = 0- trainHeight * 5
  
  train4.y = 0- trainHeight * 7
  love.audio.play( hitSound )
      end
  end
  
    if (train2.x + trainWidth/2) - playerWidth/2 == x 
  then
    --print("tren 2 igual al jugador")
        if train2.y + trainHeight > y
    then
  playerLives = playerLives - 1
  x = ((love.graphics.getWidth() / 10 ) * 5) - (playerWidth / 2)
  y = ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2)
  train1.y = 0 - trainHeight

  train2.y = 0 - trainHeight * 3
  
  train3.y = 0- trainHeight * 5
  
  train4.y = 0- trainHeight * 7
  love.audio.play( hitSound )
      end
  end
  
    if (train3.x + trainWidth/2) - playerWidth/2 == x 
  then
    -- print("tren 3 igual al jugador")
        if train3.y + trainHeight > y
    then
  playerLives = playerLives - 1
  x = ((love.graphics.getWidth() / 10 ) * 5) - (playerWidth / 2)
  y = ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2)
  train1.y = 0 - trainHeight

  train2.y = 0 - trainHeight * 3
  
  train3.y = 0- trainHeight * 5
  
  train4.y = 0- trainHeight * 7
  love.audio.play( hitSound )
      end
  end
  
    if (train4.x + trainWidth/2) - playerWidth/2 == x 
  then
     --print("tren 4 igual al jugador")
        if train4.y + trainHeight > y
    then
  playerLives = playerLives - 1
  x = ((love.graphics.getWidth() / 10 ) * 5) - (playerWidth / 2)
  y = ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2)
  train1.y = 0 - trainHeight

  train2.y = 0 - trainHeight * 3
  
  train3.y = 0- trainHeight * 5
  
  train4.y = 0- trainHeight * 7
  love.audio.play( hitSound )
      end
    end
    --print(playerLives)
end

function CheckColisions()
  CheckColisionPlayerTrain()
end

function CheckTimer(dt)
  if gameInPause == false
  then
  gameplayTimer = gameplayTimer - 1 * dt
  if  gameplayTimer <= 0
  then PlayerScore = PlayerScore + 1
    gameplayTimer = resetTimerValue
  end
  end
end
function HUB()
      text1posX = (love.graphics.getWidth() / 30 )
      text1posY = (love.graphics.getHeight() / 30 )
      love.graphics.print("Traveled KM : ",text1posX,text1posY,0 ,2 ,2)

      text2posX = text1posX * 6.5
      text2posY = text1posY
      love.graphics.print(PlayerScore,text2posX,text2posY, 0, 2 ,2)
      
      lives1X = love.graphics.getWidth() - (love.graphics.getWidth() / 20)
      lives2X = lives1X - (love.graphics.getWidth() / 20)
      lives3X = lives2X - (love.graphics.getWidth() / 20)
      livesY = (love.graphics.getHeight() / 30 )
      livesOfsetX = 15
      livesOfsetY = 0
      livesScaleX = 1
      livesScaleY = 1
      livesRotation = 0
      
      if playerLives == 3
      then
      love.graphics.draw(playerModel,lives1X,livesY,livesRotation,livesScaleX,livesScaleY,livesOfsetX,livesOfsetY)
      love.graphics.draw(playerModel,lives2X,livesY,livesRotation,livesScaleX,livesScaleY,livesOfsetX,livesOfsetY)
      love.graphics.draw(playerModel,lives3X,livesY,livesRotation,livesScaleX,livesScaleY,livesOfsetX,livesOfsetY)
    elseif playerLives == 2
      then
      love.graphics.draw(playerModel,lives1X,livesY,livesRotation,livesScaleX,livesScaleY,livesOfsetX,livesOfsetY)
      love.graphics.draw(playerModel,lives2X,livesY,livesRotation,livesScaleX,livesScaleY,livesOfsetX,livesOfsetY)
    elseif playerLives == 1
    then
      love.graphics.draw(playerModel,lives1X,livesY,livesRotation,livesScaleX,livesScaleY,livesOfsetX,livesOfsetY)
    else
    end
  end
  
function resetGame()
    playerWidth = (love.graphics.getWidth() / 30 )
playerHeight = ((love.graphics.getWidth() / 30) * 2)
playerPositionValue = 2

playerLives = 3
PlayerScore = 0

x = ((love.graphics.getWidth() / 10 ) * 5) - (playerWidth / 2)
y = ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2)

width = playerWidth
height = playerHeight
  
  trainWidth = ((love.graphics.getWidth() / 10 ) * 1.2)
  trainHeight = ((love.graphics.getHeight() / 10 ) * 3)

  train1 = {}
  train1.x = 0
  train1.y = 0 - trainHeight
  train1.x =  ((love.graphics.getWidth() / 10 ) * 2) - trainWidth/2
  
  train2 = {}
  train2.x = 0
  train2.y = 0 - trainHeight * 3
  
  train3 = {}
  train3.x = 0
  train3.y = 0- trainHeight * 5
  
  train4 = {}
  train4.x = 0
  train4.y = 0- trainHeight * 7
  
  resetTimerValue = 3
  gameplayTimer = resetTimerValue
  love.audio.setVolume( 0.5 )
end
  
function gameplayUpdate(dt)
   playerInput(dt)  
   
    if gameInPause == false 
    then  
    if not PlayMusic:isPlaying() 
    then
		love.audio.play( PlayMusic )
    end
  
    trainMovement(dt)
    OBtrain()
    RandTrain()
    CheckColisions()
    end

  if playerLives == 0 then
  gameInPause = true
  end

CheckTimer(dt)
end
  
function gameplayDraw()
  if startgame == false
  then
  drawRails()
  drawTrain()
  drawPlayer(playerPositionValue)
  if  gameInPause == true
  then
    pauseWidht = 500
    pauseHeight = 300
    pauseX = (love.graphics.getWidth() / 2) - (pauseWidht / 2)
    pauseY = (love.graphics.getHeight() / 2) - (pauseHeight / 2)

love.graphics.setColor(0,0,0)
love.graphics.rectangle("fill", pauseX, pauseY, pauseWidht, pauseHeight)
love.graphics.setColor(1,1,1)
if playerLives > 0
then
love.graphics.print("C = Continue",(love.graphics.getWidth() / 2) - 100, (love.graphics.getHeight() / 2) - (pauseHeight / 3),0 ,2 ,2)
end
love.graphics.print("R = Reset",(love.graphics.getWidth() / 2) - 100, (love.graphics.getHeight() / 2),0 ,2 ,2)
love.graphics.print("E = Exit",(love.graphics.getWidth() / 2) - 100, (love.graphics.getHeight() / 2) + (pauseHeight / 3),0 ,2 ,2)

  
  end
  HUB()
else
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
  love.graphics.setColor(1,1,1)
  love.graphics.print("press S to start",(love.graphics.getWidth() / 2) - 150, (love.graphics.getHeight() / 2) -100,0 ,2 ,2)
  love.graphics.print("press C to pause",(love.graphics.getWidth() / 2) - 150, (love.graphics.getHeight() / 2) -50,0 ,2 ,2)
  love.graphics.print("press D and A to move",(love.graphics.getWidth() / 2) - 150, (love.graphics.getHeight() / 2),0 ,2 ,2)
  end
end