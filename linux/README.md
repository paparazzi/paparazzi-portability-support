This directory holds files used to create toolchains and packages used in the Paparazzi project

Install packages needed for building
====================================
        $ ./develenv.sh


Building on Ubuntu with pbuilder-dist
=====================================
pbuilder-dist is a multi-distribution pbuilder wrapper
See https://wiki.ubuntu.com/PbuilderHowto

Setup pbuilder-dist
-------------------
- Create the pbuilder environment for your desired distributions and architectures:

        $ pbuilder-dist wheezy i386 create
        $ pbuilder-dist precise create

- To update a pbuilder environment:

        $ pbuilder-dist wheezy i386 update --override-config --release-only

Build the debian package
------------------------
- first build a source package:

        $ cd package
        $ debuild -S

- then the binary package:

        $ pbuilder-dist wheezy i386 build ../<package>.dsc
        $ pbuilder-dist precise build ../<package>.dsc

You will find the finished packages in ~/pbuilder/


Building the binary package directly without pbuilder
=====================================================

Quickly build an usigned binary package:

        $ cd package
        $ debuild -i -us -uc -b
