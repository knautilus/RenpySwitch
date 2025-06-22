set -e

export DEVKITPRO=/opt/devkitpro
export RENPY_VER=8.3.7
export PYGAME_SDL2_VER=2.1.0

apt-get -y update
apt-get -y upgrade

apt -y install build-essential checkinstall
apt -y install libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

apt -y install python3 python3-dev python3-pip

apt-get -y install p7zip-full libsdl2-dev libsdl2-image-dev libjpeg-dev libpng-dev libsdl2-ttf-dev libsdl2-mixer-dev libavformat-dev libfreetype6-dev libswscale-dev libglew-dev libfribidi-dev libavcodec-dev  libswresample-dev libsdl2-gfx-dev libgl1-mesa-glx
pip3 uninstall distribute
pip3 install future six typing requests ecdsa pefile==2019.4.18 Cython==0.29.36 setuptools==58.3.0

python3 --version

curl -LOC - https://github.com/knautilus/Utils/releases/download/v1.0/devkitpro-pkgbuild-helpers-2.2.4-2-any.pkg.tar.xz
curl -LOC - https://github.com/knautilus/Utils/releases/download/v1.0/python39-switch_t.zip
curl -LOC - https://github.com/knautilus/Utils/releases/download/v1.0/switch-libfribidi-1.0.12-1-any.pkg.tar.xz
dkp-pacman -U --noconfirm devkitpro-pkgbuild-helpers-2.2.4-2-any.pkg.tar.xz
dkp-pacman -U --noconfirm switch-libfribidi-1.0.12-1-any.pkg.tar.xz
unzip -qq python39-switch_t.zip -d $DEVKITPRO/portlibs/switch

rm devkitpro-pkgbuild-helpers-2.2.4-2-any.pkg.tar.xz
rm switch-libfribidi-1.0.12-1-any.pkg.tar.xz
rm python39-switch_t.zip

/bin/bash -c 'sed -i'"'"'.bak'"'"' '"'"'s/set(CMAKE_EXE_LINKER_FLAGS_INIT "/set(CMAKE_EXE_LINKER_FLAGS_INIT "-fPIC /'"'"' $DEVKITPRO/switch.cmake'


curl -LOC - https://www.renpy.org/dl/$RENPY_VER/pygame_sdl2-$PYGAME_SDL2_VER+renpy$RENPY_VER.tar.gz
curl -LOC - https://www.renpy.org/dl/$RENPY_VER/renpy-$RENPY_VER-sdk.zip
curl -LOC - https://www.renpy.org/dl/$RENPY_VER/renpy-$RENPY_VER-source.tar.bz2
#curl -LOC - https://www.renpy.org/dl/$RENPY_VER/android-native-symbols.zip
#curl -LOC - https://dl.otorh.in/github/rawproject.zip

rm -rf pygame_sdl2-$PYGAME_SDL2_VER+renpy$RENPY_VER pygame_sdl2-source
tar -xf pygame_sdl2-$PYGAME_SDL2_VER+renpy$RENPY_VER.tar.gz
mv pygame_sdl2-$PYGAME_SDL2_VER+renpy$RENPY_VER pygame_sdl2-source
rm pygame_sdl2-$PYGAME_SDL2_VER+renpy$RENPY_VER.tar.gz

rm -rf renpy-$RENPY_VER-source renpy-source
tar -xf renpy-$RENPY_VER-source.tar.bz2
mv renpy-$RENPY_VER-source renpy-source
rm renpy-$RENPY_VER-source.tar.bz2

rm -rf renpy-$RENPY_VER-sdk renpy_sdk
unzip -qq renpy-$RENPY_VER-sdk.zip -d renpy_sdk
rm renpy-$RENPY_VER-sdk.zip
#cp -rf subprocess.pyo renpy_sdk/renpy-$RENPY_VER-sdk/lib/python3.9

#dkp-pacman --noconfirm -S switch-libfribidi

#rm -rf raw
#unzip -qq rawproject.zip -d raw
#rm rawproject.zip

#rm -rf android-native-symbols renpy_androidlib ./raw/android/lib
#unzip -qq android-native-symbols.zip -d ./raw/android/lib
#rm -rf ./raw/android/lib/x86_64/
#rm android-native-symbols.zip

pushd renpy-source
patch -p1 < ../renpy.patch
pushd module
rm -rf gen3 gen3-static
popd
popd
pushd pygame_sdl2-source
rm -rf gen3 gen3-static
popd
