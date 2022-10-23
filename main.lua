--Start function
function love.load()
  
  screenWidht = 960
  screenHeight = 540
  love.window.setMode(screenWidht,screenHeight)
  gameInPause = false;
    
playerWidth = (love.graphics.getWidth() / 30 )
playerHeight = ((love.graphics.getWidth() / 30) * 2)
playerPositionValue = 2;

x =  ((love.graphics.getWidth() / 10 ) * 5) - (playerWidth / 2)
y =  ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2)

width = playerWidth
height = playerHeight
  
  trainWidth = ((love.graphics.getWidth() / 10 ) * 1.2)
  trainHeight = ((love.graphics.getHeight() / 10 ) * 3)

  train1 = {}
  train1.x = 0
  train1.y = 0
  train1.x =  ((love.graphics.getWidth() / 10 ) * 2) - trainWidth/2
  
  train2 = {}
  train2.x = 0
  train2.y = 0 - trainHeight * 2
  
  train3 = {}
  train3.x = 0
  train3.y = 0- trainHeight * 4
  
  train4 = {}
  train4.x = 0
  train4.y = 0- trainHeight * 6
end

--Update Function
function love.update(dt)
--print ("Player Position x : ",x)
--print ("Player Position y : ",y)
  playerInput(dt)
  trainMovement(dt)
  OBtrain()
  RandTrain()
end

-- Draw Function
function love.draw()
  love.graphics.rectangle("line",x,y,width,height)
  drawRails()
  drawTrain()
  drawPlayer(playerPositionValue)
end

function playerInput(dt)
    
     if love.keyboard.isDown('a','left')
     then if playerPositionValue == 3
          then playerPositionValue = 2
            return
        else 
          playerPositionValue = 1
          end
      end
     
     if love.keyboard.isDown('d','right')
     then if playerPositionValue == 1
          then playerPositionValue = 2
             return
        else 
          playerPositionValue = 3
          end
      end
     
     if love.keyboard.isDown('p')
     then if gameInPause == false
            then gameInPause = true
          else gameInPause = false
          end
    print("player Position Value : ",playerPositionValue)
    if gameInPause == true
    then print("Game in Pause true")
    else print ("Game in pause False")
      end
  end
end

  function drawPlayer(playerPositionValue)
    
    if  playerPositionValue == 1
      then  x =  ((love.graphics.getWidth() / 10 ) * 2) - (playerWidth / 2)
            y =  ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2)
    elseif  playerPositionValue == 2
      then x =  ((love.graphics.getWidth() / 10 ) * 5) - (playerWidth / 2)
            y =  ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2)
    else
            x =  ((love.graphics.getWidth() / 10 ) * 8) - (playerWidth / 2)
            y =  ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2)
      end
      
   end 
function drawRails()
  railWidth = ((love.graphics.getWidth() / 10 ) * 2)
  railHeight = love.graphics.getHeight()
  
  -- Primer Rail (Centro 1)
  rail1RPosX1 = ((love.graphics.getWidth() / 10 ) * 5) + (railWidth / 2)
  rail1RPosX2 = ((love.graphics.getWidth() / 10 ) * 5) + (railWidth / 2)
  rail1RPosY1 = 0
  rail1RPosY2 = railHeight
  
  love.graphics.line(rail1RPosX1,rail1RPosY1,rail1RPosX2,rail1RPosY2)
  
  rail1LPosX1 = ((love.graphics.getWidth() / 10 ) * 5) - (railWidth / 2)
  rail1LPosX2 = ((love.graphics.getWidth() / 10 ) * 5) - (railWidth / 2)
  rail1LPosY1 = 0
  rail1LPosY2 = railHeight
  
  love.graphics.line(rail1LPosX1,rail1LPosY1,rail1LPosX2,rail1LPosY2)

-- Segundo Rail (izquierda 2)
  rail2RPosX1 = ((love.graphics.getWidth() / 10 ) * 2) + (railWidth / 2)
  rail2RPosX2 = ((love.graphics.getWidth() / 10 ) * 2) + (railWidth / 2)
  rail2RPosY1 = 0
  rail2RPosY2 = railHeight
  
  love.graphics.line(rail2RPosX1,rail2RPosY1,rail2RPosX2,rail2RPosY2)
  
  rail2LPosX1 = ((love.graphics.getWidth() / 10 ) * 2) - (railWidth / 2)
  rail2LPosX2 = ((love.graphics.getWidth() / 10 ) * 2) - (railWidth / 2)
  rail2LPosY1 = 0
  rail2LPosY2 = railHeight
  
  love.graphics.line(rail2LPosX1,rail2LPosY1,rail2LPosX2,rail2LPosY2)
  
  -- Tercer Rail (Derecha 3)
  
  rail3RPosX1 = ((love.graphics.getWidth() / 10 ) * 8) + (railWidth / 2)
  rail3RPosX2 = ((love.graphics.getWidth() / 10 ) * 8) + (railWidth / 2)
  rail3RPosY1 = 0
  rail3RPosY2 = railHeight
  
  love.graphics.line(rail3RPosX1,rail3RPosY1,rail3RPosX2,rail3RPosY2)
  
  rail3LPosX1 = ((love.graphics.getWidth() / 10 ) * 8) - (railWidth / 2)
  rail3LPosX2 = ((love.graphics.getWidth() / 10 ) * 8) - (railWidth / 2)
  rail3LPosY1 = 0
  rail3LPosY2 = railHeight

  love.graphics.line(rail3LPosX1,rail3LPosY1,rail3LPosX2,rail3LPosY2)
 

  
end

function drawTrain()  

  love.graphics.rectangle("fill", train1.x,train1.y, trainWidth, trainHeight)
  love.graphics.rectangle("fill", train2.x,train2.y, trainWidth, trainHeight)
  love.graphics.rectangle("fill", train3.x,train3.y, trainWidth, trainHeight)
  love.graphics.rectangle("fill", train4.x,train4.y, trainWidth, trainHeight)

end

function trainMovement(dt)
  speed = 100
  
  train1.y = train1.y + speed * dt  
  train2.y = train2.y + speed * dt  
  train3.y = train3.y + speed * dt  
  train4.y = train4.y + speed * dt  
  
end

function OBtrain()
    
  if train1.y > love.graphics.getHeight()then
    train1.y = (0 - trainHeight)
  end 
  
  if train2.y > love.graphics.getHeight()then
    train2.y = (0 - trainHeight)
  end 
  
  if train3.y > love.graphics.getHeight()then
    train3.y = (0 - trainHeight)
  end 

  if train4.y > love.graphics.getHeight()then
    train4.y = (0 - trainHeight)
  end 
  

end

function RandTrain()
  rand = 0
  --
if  train1.y < 0 - trainHeight + 1 then
  rand = love.math.random(1,3)
  print(rand)
  
  if  rand == 1 then
  train1.x = ((love.graphics.getWidth() / 10 ) * 2) - trainWidth/2
  elseif rand == 2 then
  train1.x = ((love.graphics.getWidth() / 10 ) * 5) - trainWidth/2
  else 
  train1.x =  ((love.graphics.getWidth() / 10 ) * 8) - trainWidth/2
  end 
end
--
if  train2.y < 0 - trainHeight + 1 then
  rand = love.math.random(1,3)
  print(rand)
  
  if  rand == 1 then
  train2.x = ((love.graphics.getWidth() / 10 ) * 2) - trainWidth/2
  elseif rand == 2 then
  train2.x = ((love.graphics.getWidth() / 10 ) * 5) - trainWidth/2
  else 
  train2.x = ((love.graphics.getWidth() / 10 ) * 8) - trainWidth/2
  end

end
--
if  train3.y < 0 - trainHeight + 1 then
  rand = love.math.random(1,3)
  print(rand)
  
  if  rand == 1 then
  train3.x = ((love.graphics.getWidth() / 10 ) * 2) - trainWidth/2
  elseif rand == 2 then
  train3.x = ((love.graphics.getWidth() / 10 ) * 5) - trainWidth/2
  else 
  train3.x = ((love.graphics.getWidth() / 10 ) * 8) - trainWidth/2
  end
end
--
if  train4.y < 0 - trainHeight + 1 then
  rand = love.math.random(1,3)
  print(rand)
  
  if  rand == 1 then
  train4.x = ((love.graphics.getWidth() / 10 ) * 2) - trainWidth/2
  elseif rand == 2 then
  train4.x = ((love.graphics.getWidth() / 10 ) * 5) - trainWidth/2
  else 
  train4.x = ((love.graphics.getWidth() / 10 ) * 8) - trainWidth/2
  end
 end
 end