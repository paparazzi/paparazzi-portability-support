#!/bin/bash

version=1.83
version_nodot=183

export DEBEMAIL="felix.ruess@gmail.com"
export DEBFULLNAME="Felix Ruess"

# Log a message out to the console
function log {
    echo "******************************************************************"
    echo "* $*"
    echo "******************************************************************"
}

wget http://sourceforge.net/projects/lpc21isp/files/lpc21isp/${version}/lpc21isp_${version_nodot}.tar.gz

# for inital package creation
#mv lpc21isp_${version_nodot}.tar.gz lpc21isp-${version}.tar.gz
#mkdir -p lpc21isp-${version}
#log Unpacking upstream source
#tar -xvzf lpc21isp-${version}.tar.gz -C lpc21isp-${version}
#cd lpc21isp-${version}
#dh_make -f ../lpc21isp-${version}.tar.gz
#dch --create -v ${version}-1 --package lpc21isp



mv lpc21isp_${version_nodot}.tar.gz lpc21isp_${version}.orig.tar.gz
mkdir -p lpc21isp-${version}

log Unpacking upstream source
tar -xvzf lpc21isp_${version}.orig.tar.gz -C lpc21isp-${version}
cd lpc21isp-${version}

log Copying debian files into source folder
cp -r ../debian .
log Building packages
debuild -us -uc 


# for updating to a new upstream version
#log Updating version information
#dch -v ${version}-1
#debuild -us -uc 

