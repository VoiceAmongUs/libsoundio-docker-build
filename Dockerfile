FROM ubuntu:20.04 as build
ENV DEBIAN_FRONTEND=noninteractive TZ=Europe/Berlin

# Install dependencies of MXE, native libsoundio and Android
RUN apt-get update && \
    apt-get -y install --no-install-recommends \
    git ca-certificates cmake libasound2-dev libjack-jackd2-dev libpulse-dev wget unzip \
    autoconf automake autopoint bash bison bzip2 flex g++ g++-multilib gettext git gperf intltool libc6-dev-i386 libgdk-pixbuf2.0-dev \
    libltdl-dev libssl-dev libtool-bin libxml-parser-perl lzip make openssl p7zip-full patch perl python ruby sed unzip wget xz-utils && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Android NDK
RUN wget "https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip" && \
    unzip android-ndk-r21e-linux-x86_64.zip -d android-ndk && \
    rm android-ndk-r21e-linux-x86_64.zip
ENV ANDROID_NDK_HOME "/app/android-ndk/android-ndk-r21e"

# Install MXE cross-compiler
RUN git clone --depth=1 https://github.com/mxe/mxe.git
RUN cd mxe && \
    make MXE_TARGETS='x86_64-w64-mingw32.static i686-w64-mingw32.static' gcc cmake

ENTRYPOINT [ "bash" ]
