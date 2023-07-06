set -ex

meson setup builddir          \
    ${MESON_ARGS}             \
    -Denable_tests=false      \
    --prefix=$PREFIX          \
    --buildtype=release       \
    # without this, on aarch64 and some others defaults to lib64
    --libdir=lib

meson compile -C builddir

meson install -C builddir --no-rebuild
