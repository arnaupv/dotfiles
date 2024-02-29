#!/bin/bash

# You need a real device connected to your laptop via USB
# Origin: https://android.stackexchange.com/questions/7686/is-there-a-way-to-see-the-devices-screen-live-on-pc-through-adb
adb exec-out screenrecord --output-format=h264 --bit-rate 1000000 - | ffplay -framerate 60 -probesize 32 -sync video -
