./configure -h >_demos/configure.h.log

##############################################################################

mkdir -p build && pushd build

args=(
  --cc=/usr/bin/clang
  --cxx=/usr/bin/clang++
  --python=$(which python)
  --ninja=$(which ninja)
  --target-list="riscv64-linux-user"
  # --target-list="riscv64-linux-user riscv64-softmmu"
  # --target-list="riscv64-linux-user riscv64-softmmu aarch64-linux-user aarch64-softmmu"
  --prefix=$PWD/install
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
