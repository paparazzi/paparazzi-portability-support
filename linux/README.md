This directory holds files/scripts used to create Debian/Ubuntu packages used in the Paparazzi project

Install packages needed for building
====================================
    sudo ./develenv.sh


Building with pbuilder
======================
pbuilder lets you easily create and use a chroot to build debian packages.
See https://wiki.ubuntu.com/PbuilderHowto

- Create a pbuilder chroot-tarball

        sudo pbuilder create --debootstrapopts --variant=buildd

- Build package using debuild

		cd package
		pdebuild


Building with pbuilder-dist
===========================
pbuilder-dist is a wrapper that makes it easy to use pbuilder with many
different versions of Ubuntu and/or Debian.
You can also easily create i386 packages on your amd64 machine.

Setup pbuilder-dist
-------------------
- Create the pbuilder environment for your desired distributions and architectures, e.g.:

        pbuilder-dist wheezy i386 create
        pbuilder-dist precise create

- To update a pbuilder environment:

        pbuilder-dist wheezy i386 update --override-config --release-only

Build the debian package
------------------------
See the respective package directory on how the get the source.

- First build a source package if not already available:

		cd package
        debuild -S

- Build the binary package from the source package:

        pbuilder-dist wheezy i386 build ../<package>.dsc
        pbuilder-dist precise build ../<package>.dsc

You will find the finished packages in ~/pbuilder/


Building the binary package directly without pbuilder
=====================================================

Quickly build an unsigned binary package:

    cd package
    debuild -i -us -uc -b
