# ENABLE_GAMMA=1 (to enable gamma support)
# ENABLE_DPMS=1 (to enable dpms support)
# ENABLE_DDC=1 (to enable ddcutil support)
# ENABLE_SCREEN=1 (to enable screen emitted backlight computation support, X only)
# ENABLE_YOCTOLIGHT=1 (to enable YoctoLight ALS devices support)
# ENABLE_PIPEWIRE=1 (to enable Pipewire camera sensor). Technical preview.
#
# Dependencies
# - libudev-dev
# - libmodule
# - libiio-dev 

git checkout 5.9-nextspce
if [ -d .build ];then
    cd .build
    xargs rm < install_manifest.txt
    cd ..
fi
rm -rf .build
mkdir .build
cd .build

export PKG_CONFIG_PATH=/usr/NextSpace/lib/pkgconfig

cmake .. \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_INSTALL_PREFIX=/usr/NextSpace \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSYSTEMD_SERVICE_DIR=lib/systemd \
    -DCMAKE_BUILD_TYPE="Release" \
    -DENABLE_DDC=1 -DENABLE_GAMMA=1 -DENABLE_DPMS=1 -DENABLE_SCREEN=1
