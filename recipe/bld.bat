@echo on


set "MESON_ASM_ARGS="
if "%target_platform%"=="win-arm64" set "MESON_ASM_ARGS=-Denable_asm=false"

meson setup builddir           ^
    %MESON_ARGS%               ^
    --prefix=%LIBRARY_PREFIX%  ^
    -Denable_tests=false       ^
    %MESON_ASM_ARGS%           ^
    --buildtype=release
if errorlevel 1 exit 1

meson compile -C builddir
if errorlevel 1 exit 1

meson install -C builddir --no-rebuild
if errorlevel 1 exit 1
