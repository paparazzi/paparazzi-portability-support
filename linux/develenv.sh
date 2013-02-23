#/bin/sh

#
# installing debian/ubuntu packages to help building new packages
#

DEBIAN_DEVEL="devscripts debhelper quilt pbuilder fakeroot dh-ocaml automake git subversion"
UBUNTU_EXTRAS="ubuntu-dev-tools"

# some dev packages needed to build some paparazzi packages...
# incomplete and only needed if not using pbuilder
LIB_DEV_DEPS="libftdi-dev libgmp-dev libmpfr-dev libncurses5-dev"
#libtool texinfo asctidoc

case `lsb_release -si` in
    Debian)
	apt-get -ys install $DEBIAN_DEVEL
    ;;
    Ubuntu)
	apt-get -ys install $DEBIAN_DEVEL $UBUNTU_EXTRAS
    ;;
    *)
	echo "Which Linux you are using ?"
	exit 1
    ;;
esac
