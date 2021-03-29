#!/bin/bash

echo "Packaging libraries"

LIB="/app/build/Libraries"
mkdir -p $LIB
cd /app/build/install


# Windows 

mkdir -p "$LIB/win-i686"
cp -Pf win-i686/bin/libopus.dll win-i686/bin/librnnoise.dll "$LIB/win-i686/"
cp -Pf win-i686/lib/libsoundio.dll "$LIB/win-i686/"

mkdir -p "$LIB/win-x86_64"
cp -Pf win-x86_64/bin/libopus.dll win-x86_64/bin/librnnoise.dll "$LIB/win-x86_64/"
cp -Pf win-x86_64/lib/libsoundio.dll "$LIB/win-x86_64/"

# Linux

mkdir -p "$LIB/linux-x86_64"
cp -Pf linux-x86_64/lib/libopus.*so* linux-x86_64/lib/librnnoise.*so* linux-x86_64/lib/libsoundio.*so* "$LIB/linux-x86_64/"

# Android

mkdir -p "$LIB/android-armeabi-v7a"
cp -Pf android-armeabi-v7a/lib/libopus.so android-armeabi-v7a/lib/librnnoise.so android-armeabi-v7a/lib/libsoundio.so "$LIB/android-armeabi-v7a/"

mkdir -p "$LIB/android-arm64-v8a"
cp -Pf android-arm64-v8a/lib/libopus.so android-arm64-v8a/lib/librnnoise.so android-arm64-v8a/lib/libsoundio.so "$LIB/android-arm64-v8a/"

mkdir -p "$LIB/android-x86_64"
cp -Pf android-x86_64/lib/libopus.so android-x86_64/lib/librnnoise.so android-x86_64/lib/libsoundio.so "$LIB/android-x86_64/"
