The upstream ivy-c repository can now be directly used to build debian packages.

* svn checkout http://svn.tls.cena.fr/svn/ivy/ivy-c/trunk ivy-c
* cd ivy-c

Build using pbuilder:
* sudo pbuilder update --distribution DIST-NAME --override-config
* pdebuild

or build a unsigned binary package if you don't want to use pbuilder:
* debuild -i -us -uc -b

