#!/bin/bash

set -ex
yosys blinky.ys
nextpnr-ice40 --freq 50 --json blinky.json --pcf blinky.pcf --asc blinky.asc --hx8k --package tq144:4k
icepack blinky.asc blinky.bin
