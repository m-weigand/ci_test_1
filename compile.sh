#!/bin/bash
env
cd /root/mutter

# if [ ! -d mutter ]; then
#     git clone --branch debian/master https://salsa.debian.org/gnome-team/mutter.git
#     cd mutter
#     patch -p1 < ../0001-Add-META_CONNECTOR_TYPE_DPI.patch
#     cd ..
# fi

# cd mutter
# time DEB_BUILD_OPTIONS=nocheck dpkg-buildpackage --build=binary
# cd ..

# test -d mutter_arm64_debs && rm -r mutter_arm64_debs
mkdir mutter_arm64_debs
echo "huhu" >  mutter_arm64_debs/asdasd.txt
mv *.deb mutter_arm64_debs/

echo "moving directory"

test -d /github/home/mutter_arm64_debs && rm -r /github/home/mutter_arm64_debs

mv mutter_arm64_debs /github/home

ls /github/home/
