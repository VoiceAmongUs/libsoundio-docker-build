# libsoundio-docker-build
Docker build environment for libsoundio

## Requirements

- Docker
- Docker Compose

## Setup

Clone this repository using `git clone --recurse-submodules`.

Run `docker-compose build` to build the image, or download a cached version via `docker-compose pull` from the [Docker Hub](https://hub.docker.com/r/voiceamongus/libsoundio-builder).

## Usage

Run `docker-compose run libsoundio /app/scripts/compile.sh` to compile the library. Binaries will be placed inside `build`.

Run `docker-compose run libsoundio /app/scripts/clean.sh`to clean the build tree.