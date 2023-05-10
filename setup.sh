#!/bin/bash
export ANDROID_INSTALL_DIR_SUFFIX=ARM_32
export ANDROID_HOME=/home/aciereszko/Android
export ANDROID_HOME_NDK=/home/aciereszko/Android/Sdk/ndk/25.2.9519653
export ANDROID_INSTALL_DIR=$ANDROID_HOME/$ANDROID_INSTALL_DIR_SUFFIX
#uncomment the below two lines to make install dir and build toolchains - on first run
#mkdir $ANDROID_INSTALL_DIR
#python3 $ANDROID_HOME_NDK/build/tools/make_standalone_toolchain.py --api=24 --arch=arm --install-dir=$ANDROID_INSTALL_DIR --force
export PKG_CONFIG_PATH=$ANDROID_INSTALL_DIR/lib/pkgconfig
export PATH=$ANDROID_INSTALL_DIR:$PATH
export PATH=$PKG_CONFIG_PATH:$PATH
export PATH=$ANDROID_INSTALL_DIR/bin:$PATH
cd libplist
./autogen.sh --host=arm-linux-androideabi --prefix=$ANDROID_INSTALL_DIR --without-cython
make clean
make
make install
cd ../
cd libimobiledevice-glue
./autogen.sh --host=arm-linux-androideabi --prefix=$ANDROID_INSTALL_DIR --without-cython
make clean
make
make install
cd ../
cd libusbmuxd
./autogen.sh --host=arm-linux-androideabi --prefix=$ANDROID_INSTALL_DIR --without-cython
make clean
make
make install
cd ../
cd openssl
./Configure --prefix=$ANDROID_INSTALL_DIR android-arm -D__ANDROID_API__=24 no-shared
make clean
make
make install
cd ../
cd libimobiledevice
./autogen.sh --host=arm-linux-androideabi --prefix=$ANDROID_INSTALL_DIR --without-cython
make clean
make install
cd ../
