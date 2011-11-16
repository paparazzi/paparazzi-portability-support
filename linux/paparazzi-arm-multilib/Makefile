# Makefile that builds a multilib cross compiler for a bare metal ARM system.
#
# Tested on Ubuntu Natty.  It should work on any recent Linux
# distribution.
#
# Copyright (c) 2011 Linaro
# Contributors:
#   Michael Hope - initial implementation
#   Felix Ruess - adapted for Paparazzi: multilib support, libstm32 and libopenstm32
#

# Basics:

# Target machine triplet
TARGET ?= arm-none-eabi

# Where to install resulting tarball.  Doesn't need to be writable
# during build.
PREFIX ?= /opt/paparazzi/arm-multilib

# What languages to build
LANGUAGES ?= c,c++

# Configure flags to pass to GCC.  Sets the default system that GCC
# builds for.  Defaults to something good for the Cortex-M3.
#GCCFLAGS ?= --with-mode=thumb --with-arch=armv7-m --with-float=soft
GCCFLAGS ?=


# Sources:

# The binutils version to build
BINUTILSURL = http://sourceware.mirrors.tds.net/pub/sourceware.org/binutils/snapshots/binutils-2.21.53.tar.bz2

# The version of Newlib to use as a C library
NEWLIBURL = http://sourceware.mirrors.tds.net/pub/sourceware.org/newlib/newlib-1.19.0.tar.gz

# The Linaro GCC version to build.  Check out
# https://launchpad.net/gcc-linaro/+download for the latest link.
GCCURL = http://launchpad.net/gcc-linaro/4.5/4.5-2011.02-0/+download/gcc-linaro-4.5-2011.02-0.tar.bz2

#TODO: download and tar libstm32 and libopencm3


# The rest should be fine...
CURDIR := $(shell pwd)
GCCSRC = downloads/$(notdir $(GCCURL))
BINUTILSSRC = downloads/$(notdir $(BINUTILSURL))
NEWLIBSRC = downloads/$(notdir $(NEWLIBURL))
BUILDSYSROOT = $(CURDIR)/build/sysroot

# Turns gcc-linaro-4.5.2.tar.xz into gcc-linaro, 4.5.2
PRODUCT = $(shell echo $(notdir $(GCCURL)) | sed -r 's/^([a-z\-]+)-([0-9].+)\.tar.+/\1/')
VERSION = $(shell echo $(notdir $(GCCURL)) | sed -r 's/^([a-z\-]+)-([0-9].+)\.tar.+/\2/')

# Directory to put all stamp files
stamp = stamp/

# Tell curl to follow links
CURLFLAGS = -L

-include local.mk

all: gcc

# Install into the configured directory
install: gcc
	mkdir -p $(DESTDIR)$(PREFIX)
	tar cf - -C $(BUILDSYSROOT)$(PREFIX) . | tar xf - -C $(DESTDIR)$(PREFIX)

# Make the final binary tarball
tarball: gcc
	echo Install into $(PREFIX) > $(BUILDSYSROOT)$(PREFIX)/INSTALL
	tar caf $(PRODUCT)-baremetal-$(TARGET)-$(VERSION).tar.bz2 --numeric-owner -C $(dir $(BUILDSYSROOT)$(PREFIX)) .

$(stamp)init-dirs:
	install -d src $(stamp) build downloads
	touch -t 9001010000 $@

# Binutils
binutils: $(stamp)binutils-install

# Fetch the binutils tarball from the web
$(BINUTILSSRC): $(stamp)init-dirs
	curl $(CURLFLAGS) -o $@ $(BINUTILSURL)

# Extract
$(stamp)binutils-extract: $(BINUTILSSRC) $(stamp)init-dirs
	tar xaf $< -C src
	touch $@

# Configure
$(stamp)binutils-configure: $(stamp)binutils-extract
	install -d build/binutils
	cd build/binutils && ../../src/binutils*/configure \
	--prefix=$(PREFIX) \
	--target=$(TARGET) \
	--enable-interwork \
	--enable-multilib \
	--with-gnu-as \
	--with-gnu-ld \
	--disable-nls \
	--disable-werror
	touch $@

# Build and install
$(stamp)binutils-install: $(stamp)binutils-configure
	$(MAKE) -C build/binutils
	$(MAKE) -C build/binutils install DESTDIR=$(BUILDSYSROOT)
	touch $@

# Fetch the newlib tarball from Ubuntu archive
$(NEWLIBSRC): $(stamp)init-dirs
	install -d $(@D)
	curl $(CURLFLAGS) -o $@ $(NEWLIBURL)

# Extract
$(stamp)newlib-extract: $(NEWLIBSRC) $(stamp)init-dirs
	tar xaf $< -C src
	touch $@

# Build GCC
gcc: $(stamp)gcc-install

# Fetch
$(GCCSRC): $(stamp)init-dirs
	curl $(CURLFLAGS) -o $@ $(GCCURL)

# Extract
$(stamp)gcc-extract: $(GCCSRC) $(stamp)init-dirs
	tar xaf $< -C src
	touch $@

# Patch to add multilib support
$(stamp)gcc-patch: $(stamp)gcc-extract
	cd src/gcc-* && \
	patch -p0 -i ../../patches/patch-gcc-config-arm-t-arm-elf.diff
	touch $@

# Configure
$(stamp)gcc-configure: $(stamp)binutils-install $(stamp)newlib-extract $(stamp)gcc-extract $(stamp)gcc-patch
	install -d build/gcc
	ln -f -s $(CURDIR)/src/newlib-*/newlib src/gcc-*
	ln -f -s $(CURDIR)/src/newlib-*/libgloss src/gcc-*
	export PATH=$(BUILDSYSROOT)$(PREFIX)/bin:$(PATH) && \
	cd build/gcc && ../../src/gcc-*/configure \
	--enable-languages=$(LANGUAGES) \
	--prefix=$(PREFIX) \
	--target=$(TARGET) \
	--enable-interwork \
	--enable-multilib \
	--enable-target-optspace \
	--with-system-zlib \
	--with-newlib \
	--with-gnu-as \
	--with-gnu-ld \
	--with-headers=newlib/libc/include \
	--disable-newlib-supplied-syscalls \
	--disable-nls \
	--disable-shared \
	--disable-threads \
	--disable-libgomp \
	--disable-libssp \
	--disable-libstdcxx-pch \
	--disable-libmudflap \
	--disable-werror
	$(GCCFLAGS)
	touch $@

# Build and install
$(stamp)gcc-install: $(stamp)gcc-configure
	export PATH=$(BUILDSYSROOT)$(PREFIX)/bin:$(PATH) && \
	$(MAKE) -C build/gcc && \
	$(MAKE) -C build/gcc install DESTDIR=$(BUILDSYSROOT)
	touch $@

# Remove all temporary files
clean:
	rm -rf $(stamp) build src

# Remove all temporary files
distclean: clean
	rm -rf downloads *.tar.bz2 *~
