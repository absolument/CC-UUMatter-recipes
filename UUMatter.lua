assert(turtle and turtle.craft, "Require crafty turtle")

local saveFile = "UU.lua"

local function _select(slot)
	if turtle.getSelectedSlot() ~= slot then
		turtle.select(slot)
	end
end

local function toBits(num, bits)
	-- returns a table of bits
	local t={} -- will contain the bits
	for b=bits,1,-1 do
		rest=math.floor(math.fmod(num,2))
		t[b]=rest
		num=(num-rest)/2
	end
	if num==0 then return t else return {'Not enough bits to represent this number'}end
end

local grid = {
	1,	2,	3,	--4,
	5,	6,	7,	--8,
	9,	10,	11,	--12,
--	13,	14,	15,	16,	
}

for i=1,2^9-1 do
	--iterate pattern
	local _pattern = toBits(i, 9)
	--Sum of items
	local _cost = 0
	for slot,v in ipairs(_pattern) do
		_cost = _cost + v
	end
	print(i, "Pattern:", unpack(_pattern))
	
	--Place items
	_select(1)
	turtle.suckUp(_cost)
	for pos=2, 9 do
		local slot = grid[pos]
		if _pattern[pos] == 1 then
			turtle.transferTo(slot,1)
		end
	end
	
	--test craft
	local success = turtle.craft()
	local data = turtle.getItemDetail(1)
	if success and data and data.name then
		print("Get", data.count, data.name)
		local r = {}
		data.i = i
		data.cost = _cost
		data.pattern = _pattern
		if data.damage then
			r["damage"] = data.damage
		end
		--save craft
		settings.load(saveFile)
		local tRecipes = settings.get("UURecipes",{})
		table.insert(tRecipes, data)
		settings.set("UURecipes", tRecipes)
		settings.save(saveFile)
	end
	
	--Clear grid
	for slot=1,16 do
		local data = turtle.getItemDetail(slot)
		if data and data.count > 0 then
			_select(slot)
			if data.damage and data.damage == 202 and data.name == "ic2:itemmisc" then
				turtle.dropUp()
			else
				turtle.dropDown()
			end
		end
	end
end

