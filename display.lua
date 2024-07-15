require("common")

local set_counter = 0
local set_millseconds = 0

function main()
	local input = nil
	local counter = 0
	local time_since_start = nil
	local time_of_last_inc = nil
	local time_since_last_inc = nil

	local start_time = os.time()

	while true do
		wait_sec(0.01)
		clear()
		input = get_input_nonblocking()
		if input == "a" then
			time_of_last_inc = os.time()
			counter = counter + 1
		end

		time_since_start = os.time() - start_time
		if time_of_last_inc then
			time_since_last_inc = os.time() - time_of_last_inc
		end
		render_stuff(time_since_start, time_since_last_inc, counter)
		if input == "q" then
			print("exiting. press ctrl-c")
			break
		end
	end
end

function render_stuff(time_since_start, time_since_last_inc, counter)
	print(string.format("Total training time (s)\t%s", time_since_start))
	print(string.format("Time since end of last set (s)\t%s", time_since_last_inc))
	print(string.format("Set count\t%s", counter))
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
		if state then
			-- pop off the final char
			command = string.sub(state, string.len(state))
			local new_state = string.sub(state, 1, string.len(state) - 1)
			assert(string.len(state) == string.len(new_state) + 1)
			-- write it back

			local new_file_handle = io.open("state", "w")
			new_file_handle:write(new_state)
			io.close(new_file_handle)
		end
	end
	return command
end
main()
