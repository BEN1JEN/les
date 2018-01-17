memory = {}

function memory.initRam()
	for address = 0, 0x007FF do
		memory[address] = 0x0
	end
end

function memory.get(address)

	local controller1ReadTimes = 0
	local controller2ReadTimes = 0

	local byte = 0x0
	::getaddress::
	if address < 0x0800 then
		byte = ram[address]
	elseif address < 0x1000 then
		byte = ram[address - 0x0800]
	elseif address < 0x1800 then
		byte = ram[address - 0x1000]
	elseif address < 0x2000 then
		byte = ram[address - 0x1800]
	elseif address < 0x2008 then
		byte = 0x0
		print("ppu not implemented yet")
	elseif address < 0x4000 then
		address = 0x2000 + math.mod(address, 0x8)
		goto getaddress
	elseif address < 0x4018 then
		if address == 0x4016 then
			if controller1ReadTimes < 1 then
				button = "a"
			elseif controller1ReadTimes < 2 then
				button = "b"
			elseif controller1ReadTimes < 2 then
				button = "select"
			elseif controller1ReadTimes < 2 then
				button = "start"
			elseif controller1ReadTimes < 2 then
				button = "up"
			elseif controller1ReadTimes < 2 then
				button = "down"
			elseif controller1ReadTimes < 2 then
				button = "left"
			elseif controller1ReadTimes < 2 then
				button = "right"
			end

			if input[button] then
				byte = 0x1
			end
		end
	elseif address < 0x4020 then
		print("cpu is not in test mode, returning 0")
	else
		byte = cart[address - 0x4020]
	end

	return byte

end
