micromamba install meson

###############################################################################

# mesonlsp
# https://github.com/JCWasmx86/mesonlsp/releases/

pushd _demos
# wget https://github.com/JCWasmx86/mesonlsp/releases/download/v4.2.2/mesonlsp-aarch64-unknown-linux-musl.zip
wget https://github.com/JCWasmx86/mesonlsp/releases/latest/download/mesonlsp-aarch64-unknown-linux-musl.zip
unzip mesonlsp-aarch64-unknown-linux-musl.zip
cp mesonlsp /usr/local/bin/mesonlsp
popd

###############################################################################

# muon
# https://github.com/annacrombie/muon.git

pushd _demos
git clone https://github.com/annacrombie/muon.git --depth 1
pushd muon
meson setup --reconfigure build --prefix /usr/local
meson compile -C build
meson install -C build
popd
popd

###############################################################################
