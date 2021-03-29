#!/bin/bash


if [ -z "$1" ]; then
    CONFIG="Release"
else
    CONFIG="$1"
fi

echo "Configuration: $1"


echo "Compiling libsoundio"

echo "Compiling for Windows"

cd /app/libsoundio
mkdir -p build/win-i686
cd build/win-i686
(export PATH="/app/mxe/usr/bin:$PATH" && \
i686-w64-mingw32.static-cmake ../.. -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/app/build/install/win-i686 && \
make -j$(nproc) && \
make install)

cd /app/libsoundio
mkdir -p build/win-x86_64
cd build/win-x86_64
(export PATH="/app/mxe/usr/bin:$PATH" && \
x86_64-w64-mingw32.static-cmake ../.. -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/app/build/install/win-x86_64 && \
make -j$(nproc) && \
make install)

echo "Compiling for Linux"

cd /app/libsoundio
mkdir -p build/linux-x86_64
cd build/linux-x86_64
cmake ../.. -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/app/build/install/linux-x86_64
make -j$(nproc)
make install

echo "Compiling for Android"

cd /app/libsoundio
mkdir -p build/android-armeabi-v7a
cd build/android-armeabi-v7a
cmake ../..  -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake" -DANDROID_PLATFORM=android-21 -DANDROID_ARCH=armeabi-v7a -DCMAKE_INSTALL_PREFIX=/app/build/install/android-armeabi-v7a
make -j$(nproc)
make install

cd /app/libsoundio
mkdir -p build/android-arm64-v8a
cd build/android-arm64-v8a
cmake ../..  -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake" -DANDROID_PLATFORM=android-21 -DANDROID_ARCH=arm64-v8a -DCMAKE_INSTALL_PREFIX=/app/build/install/android-arm64-v8a
make -j$(nproc)
make install

cd /app/libsoundio
mkdir -p build/android-x86_64
cd build/android-x86_64
cmake ../..  -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake" -DANDROID_PLATFORM=android-21 -DANDROID_ARCH=x86_64 -DCMAKE_INSTALL_PREFIX=/app/build/install/android-x86_64
make -j$(nproc)
make install


echo "Compiling opus"

echo "Compiling for Windows"

cd /app/opus
mkdir -p build/win-i686
cd build/win-i686
(export PATH="/app/mxe/usr/bin:$PATH" && \
i686-w64-mingw32.static-cmake ../.. -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/app/build/install/win-i686 && \
make -j$(nproc) && \
make install)

cd /app/opus
mkdir -p build/win-x86_64
cd build/win-x86_64
(export PATH="/app/mxe/usr/bin:$PATH" && \
x86_64-w64-mingw32.static-cmake ../.. -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/app/build/install/win-x86_64 && \
make -j$(nproc) && \
make install)

echo "Compiling for Linux"

cd /app/opus
mkdir -p build/linux-x86_64
cd build/linux-x86_64
cmake ../.. -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/app/build/install/linux-x86_64
make -j$(nproc)
make install

echo "Compiling for Android"

cd /app/opus
mkdir -p build/android-armeabi-v7a
cd build/android-armeabi-v7a
cmake ../..  -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake" -DANDROID_PLATFORM=android-21 -DANDROID_ARCH=armeabi-v7a -DCMAKE_INSTALL_PREFIX=/app/build/install/android-armeabi-v7a
make -j$(nproc)
make install

cd /app/opus
mkdir -p build/android-arm64-v8a
cd build/android-arm64-v8a
cmake ../..  -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake" -DANDROID_PLATFORM=android-21 -DANDROID_ARCH=arm64-v8a -DCMAKE_INSTALL_PREFIX=/app/build/install/android-arm64-v8a
make -j$(nproc)
make install

cd /app/opus
mkdir -p build/android-x86_64
cd build/android-x86_64
cmake ../..  -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake" -DANDROID_PLATFORM=android-21 -DANDROID_ARCH=x86_64 -DCMAKE_INSTALL_PREFIX=/app/build/install/android-x86_64
make -j$(nproc)
make install


echo "Compiling rnnoise"

echo "Compiling for Windows"

cd /app/rnnoise
mkdir -p build/win-i686
cd build/win-i686
(export PATH="/app/mxe/usr/bin:$PATH" && \
i686-w64-mingw32.static-cmake ../.. -DOpus_DIR=/app/build/install/win-i686/lib/cmake/Opus -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/app/build/install/win-i686 && \
make -j$(nproc) && \
make install)

cd /app/rnnoise
mkdir -p build/win-x86_64
cd build/win-x86_64
(export PATH="/app/mxe/usr/bin:$PATH" && \
x86_64-w64-mingw32.static-cmake ../.. -DOpus_DIR=/app/build/install/win-x86_64/lib/cmake/Opus -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/app/build/install/win-x86_64 && \
make -j$(nproc) && \
make install)

echo "Compiling for Linux"

cd /app/rnnoise
mkdir -p build/linux-x86_64
cd build/linux-x86_64
cmake ../.. -DOpus_DIR=/app/build/install/linux-x86_64/lib/cmake/Opus -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/app/build/install/linux-x86_64
make -j$(nproc)
make install

echo "Compiling for Android"

cd /app/rnnoise
mkdir -p build/android-armeabi-v7a
cd build/android-armeabi-v7a
cmake ../.. -DOpus_DIR=/app/build/install/android-armeabi-v7a/lib/cmake/Opus -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake" -DANDROID_PLATFORM=android-21 -DANDROID_ARCH=armeabi-v7a -DCMAKE_INSTALL_PREFIX=/app/build/install/android-armeabi-v7a
make -j$(nproc)
make install

cd /app/rnnoise
mkdir -p build/android-arm64-v8a
cd build/android-arm64-v8a
cmake ../.. -DOpus_DIR=/app/build/install/android-arm64-v8a/lib/cmake/Opus -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake" -DANDROID_PLATFORM=android-21 -DANDROID_ARCH=arm64-v8a -DCMAKE_INSTALL_PREFIX=/app/build/install/android-arm64-v8a
make -j$(nproc)
make install

cd /app/rnnoise
mkdir -p build/android-x86_64
cd build/android-x86_64
cmake ../.. -DOpus_DIR=/app/build/install/android-x86_64/lib/cmake/Opus -DCMAKE_BUILD_TYPE=$CONFIG -DBUILD_SHARED_LIBS=ON -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake" -DANDROID_PLATFORM=android-21 -DANDROID_ARCH=x86_64 -DCMAKE_INSTALL_PREFIX=/app/build/install/android-x86_64
make -j$(nproc)
make install



/app/scripts/package.sh