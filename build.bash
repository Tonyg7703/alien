#!/usr/bin/env bash

_install.lobash() {
  module_name="lobash"
  cd ./modules || exit
  if ! find . -type d -name "${module_name}*" | grep -q .; then

    echo "👽 Downloading $module_name..."
    VERSION=v0.7.0
    git clone --depth 1 --branch $VERSION https://github.com/adoyle-h/lobash.git

    echo "👽 $module_name is installed..."

    cd lobash || exit

    git submodule update --init --recursive --progress

    if [ -L "$ALIEN_BIN_DIR/lobash-gen" ]; then
      rm -f "$ALIEN_BIN_DIR/lobash-gen"
    fi

    ln -s "$PWD/build" "$ALIEN_BIN_DIR/lobash-gen"

    cd .. || exit

    echo "👽 $module_name is successfully installed..."
  fi

  cd .. || exit
}

alien.build() {
  _install.lobash
}
