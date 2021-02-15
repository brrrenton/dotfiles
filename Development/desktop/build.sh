#!/bin/bash
cd dmenu
make clean && make
cd ../dwm
make clean && make
cd ../tabbed
make clean && make

