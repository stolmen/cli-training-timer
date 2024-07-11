# Training timer

## Requirements

- Single button press to increment set counter
- Single button press to reset set counter
- These things must be visible:
  - Time since start of first rep
  - Time since start of last rep

## Design

There will be two processes:

1. input process
2. display process

The input process will do blocking reads from stdin and write this to a file continuously.

The idsplay process will read from this file, process the input, then write to stdout continuously.

hoping i can do something like

lua input.lua & lua display.lua

### Input progress

Run two processes

- redirect stdin to a file
- in main loop, read from file to get input
- act on input - display stuff
