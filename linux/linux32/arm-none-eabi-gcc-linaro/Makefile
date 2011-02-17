# Hey Emacs, this is a -*- makefile -*-
#
#   $Id$
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
# Crappy makefile to build a loosy stm32 toolchain package
#

all:
	./summon-arm-toolchain LIBSTM32_EN=1


install:
	mkdir -p $(DESTDIR)/opt/paparazzi
	cp -a /opt/paparazzi/stm32 $(DESTDIR)/opt/paparazzi

clean:
	rm -rf *~ sources build .binutils* .gcc* .gdb* .libcmsis* .libstm32* .newlib* .openocd* build-arch-stamp build-indep-stamp configure-stamp
