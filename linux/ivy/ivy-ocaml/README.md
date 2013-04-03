The upstream ivy-ocaml repository can now be directly used to build debian packages.

* svn checkout http://svn.tls.cena.fr/svn/ivy/ivy-ocaml/trunk ivy-ocaml
* cd ivy-ocaml

Build using pbuilder:
* sudo pbuilder update --distribution DIST-NAME --override-config
* pdebuild

or build a unsigned binary package if you don't want to use pbuilder:
* debuild -i -us -uc -b
