function love.load()
  love.window.setTitle("DVD Screensaver")

  logo = {}
  logo.image =love.graphics.newImage("assets/DVD_logo.png")
  logo.width = 206
  logo.height = 107
  logo.x = love.graphics.getWidth()/2
  logo.y = love.graphics.getHeight()/2

  initSpeed = {}
  initSpeed.x = 4
  initSpeed.y = initSpeed.x

  speed = {}
  speed.x = initSpeed.x
  speed.y = initSpeed.y

  screenWidth = love.graphics.getWidth() --largeur de la fenêtre
  screenHeight = love.graphics.getHeight() --hauteur de la fenêtre

  fontPressStart2P = love.graphics.newFont("assets/fonts/PressStart2P.ttf", 20)
end


function love.update(dt)
  -- déplacement de l'objet
  logo.x = logo.x + speed.x
  logo.y = logo.y + speed.y

-- collisions à droite et gauche
  --gauche
  if logo.x <= 0 then
    speed.x = initSpeed.x
  end
  -- doite
  if logo.x >= screenWidth - logo.width then
    speed.x = -speed.x
  end
--collisions en bas et en haut
  --bas
  if logo.y >= screenHeight - logo.height then
    speed.y = -speed.y
  end
  --haut
  if logo.y <= 0 then
    speed.y = initSpeed.y
  end

  -- gestion de la vitesse
  if love.keyboard.isDown("up") then
    initSpeed.x = initSpeed.x + 1
    initSpeed.y = initSpeed.y + 1
  end
  if love.keyboard.isDown("down") then
    initSpeed.x = 4
    initSpeed.y = 4
  end

end


function love.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(logo.image, logo.x, logo.y)

  love.graphics.setFont(fontPressStart2P)
  love.graphics.print(initSpeed.x, 10, 10)
  love.graphics.print(initSpeed.y, 10, 40)
end

function love.keypressed(key)
	if key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen, fstype)
	end
end
