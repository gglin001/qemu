##############################################################################

brew install glib
brew install pkg-config
brew install intltool

##############################################################################

./configure -h >_demos/configure.h.log

##############################################################################

mkdir -p build && pushd build

args=(
  --cc=/usr/bin/clang
  --cxx=/usr/bin/clang++
  --python=$(which python)
  --ninja=$(which ninja)
  --target-list="riscv64-softmmu"
  --prefix=$PWD/install
  --disable-docs
  --disable-cocoa
  --disable-coreaudio
  --disable-vmnet
  --enable-debug
  --extra-cflags="-O0 -g"
)
../configure "${args[@]}"

make -j$(nproc)
# make install

popd

###############################################################################

pushd build
make -j$(nproc)
popd

###############################################################################
