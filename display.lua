require("common")

local set_counter = 0
local set_millseconds = 0

function main()
	local input = nil

	while true do
		wait_sec(0.1)
		clear()
		input = get_input_nonblocking()
		print(input)
		if input == "a" then
			set_counter = set_counter + 1
			print("incrementing")
		end
		print("num_sets")
		print("time elapsed: " .. os.time())
		print("counter: " .. set_counter)
	end
end

function wait_sec(x)
	os.execute("sleep " .. tonumber(x))
end

function clear()
	os.execute("clear")
end

function get_input_nonblocking()
	local file_handle = io.open("state", "r+")
	local state = nil
	local command = nil
	if file_handle then
		-- read it line by line
		state = file_handle:read()
		io.close(file_handle)
		print("got state from file. it is " .. tostring(state))
		if state then
			-- pop off the final char
			command = string.sub(state, string.len(state))
			local new_state = string.sub(state, 1, string.len(state) - 1)
			assert(string.len(state) == string.len(new_state) + 1)
			-- write it back
			print(new_state)

			local new_file_handle = io.open("state", "w")
			new_file_handle:write(new_state)
			io.close(new_file_handle)
		end
	end
	print("command is " .. tostring(command))
	return command
end
main()
