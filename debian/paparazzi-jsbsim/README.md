Build the package:

Get the sources and copy the debian dir into them
* fakeroot debian/rules get-orig-source
* tar -xvzf paparazzi-jsbsim_<version>.orig.tar.gz
* cd paparazzi-jsbsim-<version>
* cp -r ../debian .

to build a source package that includes the orig.tar.gz in upload:
* debuild -S -sa

or to build a binary package with pbuilder
* sudo pbuilder update --distribution DIST-NAME --override-config
* pdebuild

