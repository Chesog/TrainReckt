--Start function
function love.load()
  
  screenWidht = 960
  screenHeight = 540
  love.window.setMode(screenWidht,screenHeight)
    
playerWidth = (love.graphics.getWidth() / 30 )
playerHeight = ((love.graphics.getWidth() / 30) * 2)

x =  ((love.graphics.getWidth() / 10 ) * 5) - (playerWidth / 2)
y =  ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2)

width = playerWidth
height = playerHeight

  trainWidth = ((love.graphics.getWidth() / 10 ) * 1.2)
  trainHeight = ((love.graphics.getHeight() / 10 ) * 3)

  trainPosX1 = ((love.graphics.getWidth() / 10 ) * 5) - (trainWidth / 2)
  trainPosY1 = 0
end

--Update Function
function love.update(dt)
print ("Player Position x : ",x)
print ("Player Position y : ",y)
  playerMovement(dt)
  trainMovement(dt)

end

-- Draw Function
function love.draw()
  love.graphics.rectangle("line",x,y,width,height)
  drawRails()
  drawTrain()
end


function playerMovement(dt)
    if love.keyboard.isDown('s')
  then  x =  ((love.graphics.getWidth() / 10 ) * 5) - (playerWidth / 2)
        y =  ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2)
    end
    
     if love.keyboard.isDown('a')
  then  x =  ((love.graphics.getWidth() / 10 ) * 2) - (playerWidth / 2)
        y =  ((love.graphics.getHeight() / 10) * 9) - (playerHeight / 2)
    end
    
     if love.keyboard.isDown('d')
  then  x =  ((love.graphics.getWidth() / 10 ) * 8) - (playerWidth / 2)
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
  love.graphics.rectangle("fill", trainPosX1,trainPosY1, trainWidth,trainHeight)
end
function trainMovement(dt)
  trainPosY1 = trainPosY1 + 50 * dt
  end