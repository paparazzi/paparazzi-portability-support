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
		asciidoc
    ;;
    Ubuntu)
	aptitude -y install \
		libmpfr-dev \
		libtool \
		texinfo \
		asciidoc
    ;;
    *)
	echo "Which Linux you are using ?"
	exit 1
    ;;
esac
