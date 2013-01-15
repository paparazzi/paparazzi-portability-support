Building a debian package:

* fakeroot debian/rules get-orig-source
* tar -xvzf <version>.orig.tar.gz
* cd ivy-c_<version>
* rm -rf debian
* cp -r ../debian .

Build using pbuilder:
* sudo pbuilder update --distribution DIST-NAME --override-config
* pdebuild

or build a unsigned binary package if you don't want to use pbuilder:
* debuild -i -us -uc -b
