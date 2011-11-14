# Hey Emacs, this is a -*- makefile -*-
#
#   Copyright (C) 2009 Antoine Drouin
#
# This file is part of paparazzi.
#
# paparazzi is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# paparazzi is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with paparazzi; see the file COPYING.  If not, write to
# the Free Software Foundation, 59 Temple Place - Suite 330,
# Boston, MA 02111-1307, USA.
#

#
# makefile to build an arm cross-toolchain package
#

PREFIX=/opt/paparazzi/arm-multilib

CURDIR := $(shell pwd)
BUILDSYSROOT = $(CURDIR)/build-sysroot


all:
	@LANG=C ./summon-arm-toolchain LIBSTM32_EN=1 PREFIX=$(PREFIX) DESTDIR=$(BUILDSYSROOT)

init-dirs:
	mkdir -p stamps build sources
	touch -t 9001010000 stamps build sources

fetch_sources:
	@LANG=C ./summon-arm-toolchain LIBSTM32_EN=1 PREFIX=/opt/paparazzi/arm-multilib FETCH_ONLY=1

install:
	mkdir -p $(DESTDIR)$(PREFIX)
	tar cf - -C $(BUILDSYSROOT)$(PREFIX) . | tar xf - -C $(DESTDIR)$(PREFIX)

clean:
	rm -rf *~ build binutils* gcc* gdb* libcmsis* libstm32* newlib* openocd*
# comment the next line out if you don't want to rebuild everything, but make sure the stamps are ok
	rm -rf stamps sources
