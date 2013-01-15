#/bin/sh

#
# installing needed debian/ubuntu packages
#

case `lsb_release -si` in
    Debian)
	aptitude -y install \
		automake \
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
		devscripts \
		pbuilder \
		fakeroot \
		debootstrap \
		dh-ocaml
    ;;
    Ubuntu)
	aptitude -y install \
		automake \
		libmpfr-dev \
		libtool \
		texinfo \
		quilt \
		debhelper \
		ubuntu-dev-tools \
		asciidoc \
		pbuilder \
		fakeroot \
		debootstrap \
		debian-archive-keyring \
		dh-ocaml
    ;;
    *)
	echo "Which Linux you are using ?"
	exit 1
    ;;
esac
