# Training timer

Run ./start.sh to start.

## TODO

- [ ] Render nicer output
- [ ] make graceful exit on q or ctrl-c

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
