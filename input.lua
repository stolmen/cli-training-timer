require("common")

local function write_line_to_file(filename, input_char)
	local f_handle = io.open(filename, "a")
	if f_handle == nil then
		assert(false)
	else
		f_handle:write(input_char)
		io.close(f_handle)
	end
end

local function input_loop()
	local input_char = nil
	while true do
		os.execute("stty -icanon -echo") -- put TTY in raw mode and no echo mode
		input_char = io.read(1)
		os.execute("stty icanon echo") -- at end of program, put TTY back to normal mode

		-- write the input char into the file.
		local filename = INPUTS_FILENAME
		if input_char then
			write_line_to_file(filename, input_char)
		end
	end
end

input_loop()
