#
#   Makefile
#
#   Copyright 2007, 2008 Lancer-X/ASCEAI
#
#   This file is part of Meritous.
#
#   Meritous is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   Meritous is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with Meritous.  If not, see <http://www.gnu.org/licenses/>.
#
LDFLAGS = `sdl-config --libs` -lSDL_image -lSDL_mixer -lz -lpthread
CCFLAGS = -O2 -Wall `sdl-config --cflags` -ggdb
INC     = -Isrc/submodules \
					-Isrc/submodules/websocketpp \
					-Isrc/submodules/wswrap/include \
					-Isrc/submodules/json/include \
					-Isrc/submodules/valijson/include
DEFINES = -DASIO_STANDALONE

#
OBJS = 	src/levelblit.o \
		src/mapgen.o \
		src/demon.o \
		src/gamemap.o \
		src/tiles.o \
		src/save.o \
		src/help.o \
		src/audio.o \
		src/boss.o \
		src/ending.o \
		src/gamepad.o \
		src/itemstore.o \
		src/itemhandler.o \
		src/stats.o \
		src/submodules/wswrap/src/wswrap.o \
		src/apinterface.o
#
default:	meritous

%.o:		%.c
		gcc -c -o $@ $? ${CCFLAGS}

%.o:		%.cpp
		g++ -c -o $@ $? ${INC} ${DEFINES} ${CCFLAGS}

meritous:	${OBJS}
		g++ -o $@ $+ ${LDFLAGS}

clean:		
		rm ${OBJS}

