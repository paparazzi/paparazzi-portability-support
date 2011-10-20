#/bin/sh

#
# installing needed debian/ubuntu packages
#

case `lsb_release -si` in
    Debian)
	aptitude -y install \
		autoconf \
		debhelper \
		git \
		libftdi-dev \
		libgmp3-dev \
		libmpfr-dev \
		libncurses5-dev \
		libtool \
		texinfo \
		quilt \
		asciidoc \
		devscripts
    ;;
    Ubuntu)
	aptitude -y install \
		libmpfr-dev \
		libtool \
		texinfo \
		quilt \
		debhelper \
		devscripts \
		asciidoc
    ;;
    *)
	echo "Which Linux you are using ?"
	exit 1
    ;;
esac
