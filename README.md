# libsoundio-docker-build
Docker build environment for libsoundio

## Requirements

- Docker
- Docker Compose
- Optional: VSCode

## Setup

Clone this repository using `git clone --recurse-submodules`.

Use the provided VSCode tasks or invoke the commands manually:

Run `docker-compose build` to build the image, or download a cached version via `docker-compose pull` from the Docker Hub.

## Usage

Use the provided VSCode tasks or invoke the commands manually:

Run `docker-compose run libsoundio /app/scripts/compile.sh` to compile the library. Binaries will be placed inside `build`.

Run `docker-compose run libsoundio /app/scripts/clean.sh`to clean the build tree.