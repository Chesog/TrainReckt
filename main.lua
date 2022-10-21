playerWidth = 20
playerHeight = 20
x = (love.graphics.getWidth() / 2) - (playerWidth / 2)
y = (love.graphics.getHeight() / 2) - (playerHeight / 2)
width = playerWidth
height = playerHeight



--Start function
function love.load()
  screenWidht = 1280
  screenHeight = 720
function love.resize(screenWidht,screenHeight)
end

end

--Update Function
function love.update(dt)
print ("Player Position x : ",x)
print ("Player Position y : ",y)
  playerMovement(dt)

end

-- Draw Function
function love.draw()
  love.graphics.rectangle("line",x,y,width,height)
  drawRails()
end

function playerMovement(dt)
    if love.keyboard.isDown('s')
  then  y = y + 100 * dt end

  if  love.keyboard.isDown('w')
  then y = y - 100 * dt end

  if  love.keyboard.isDown('a')
  then x = x - 100 * dt end
  
  if  love.keyboard.isDown('d')
  then x = x + 100 * dt end
end

function drawRails()
  railWidth = 150;
  railHeight = love.graphics.getHeight()
  
  -- Primer Rail
  rail1RPosX1 = (love.graphics.getWidth() / 2) + (railWidth / 2)
  rail1RPosX2 = (love.graphics.getWidth() / 2) + (railWidth / 2)
  rail1RPosY1 = 0
  rail1RPosY2 = railHeight
  
  love.graphics.line(rail1RPosX1,rail1RPosY1,rail1RPosX2,rail1RPosY2)
  
  rail1LPosX1 = (love.graphics.getWidth() / 2) - (railWidth / 2)
  rail1LPosX2 = (love.graphics.getWidth() / 2) - (railWidth / 2)
  rail1LPosY1 = 0
  rail1LPosY2 = railHeight
  
  love.graphics.line(rail1LPosX1,rail1LPosY1,rail1LPosX2,rail1LPosY2)

-- Segundo Rail
  rail2RPosX1 = (rail1LPosX1) - (railWidth / 2)
  rail2RPosX2 = (rail1LPosX1) - (railWidth / 2)
  rail2RPosY1 = 0
  rail2RPosY2 = railHeight
  
  love.graphics.line(rail2RPosX1,rail2RPosY1,rail2RPosX2,rail2RPosY2)
  
  rail2LPosX1 = (rail2RPosX1) - (railWidth)
  rail2LPosX2 = (rail2RPosX1) - (railWidth)
  rail2LPosY1 = 0
  rail2LPosY2 = railHeight
  
  love.graphics.line(rail2LPosX1,rail2LPosY1,rail2LPosX2,rail2LPosY2)
  
  -- Tercer Rail
  
  rail3LPosX1 = (rail1RPosX1) + (railWidth / 2)
  rail3LPosX2 = (rail1RPosX1) + (railWidth / 2)
  rail3LPosY1 = 0
  rail3LPosY2 = railHeight

  love.graphics.line(rail3LPosX1,rail3LPosY1,rail3LPosX2,rail3LPosY2)
 
  rail3RPosX1 = (rail3LPosX1) + (railWidth)
  rail3RPosX2 = (rail3LPosX1) + (railWidth)
  rail3RPosY1 = 0
  rail3RPosY2 = railHeight
  
  love.graphics.line(rail3RPosX1,rail3RPosY1,rail3RPosX2,rail3RPosY2)
  
  end

