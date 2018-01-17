function love.load(args)

	-- define variables
	a = 0x0
	x = 0x0
	y = 0x0
	p = 0x0
	pc = 0
	s = 0x0000
	ram = {}
	cart = {}

	-- requirements
	memory = require "func.memory"
	controller = require "func.controller"

	print("LES negitive 7 ga-ja-ba-dillion")

end

function love.update(dt)



end

function love.draw()
	love.graphics.setColor(240, 0, 250, 255)
	love.graphics.rectangle("fill", 100, 100, 100, 100)
end
