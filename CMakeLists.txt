cmake_minimum_required(VERSION 3.0.2)

if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    if(DEFINED ENV{DEVKITPRO})
        set(DEVKITPRO $ENV{DEVKITPRO})
        set(CMAKE_TOOLCHAIN_FILE "$ENV{DEVKITPRO}/switch.cmake" CACHE PATH "toolchain file")
    else()
        message(FATAL_ERROR "Please define DEVKITPRO to point to your SDK path!")
    endif()
endif()

project(renpy-switch-modules)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE RelWithDebInfo)
endif()

set(C_FLAGS
    -DFRIBIDI_ENTRY=
    -DHAVE_CONFIG_H=1
)

set(OPTIMIZATION_FLAGS
    -Ofast
)

set(INCLUDES
    ${DEVKITPRO}/portlibs/switch/include/python2.7
    ${DEVKITPRO}/portlibs/switch/include/fribidi
    include
    include/module
    include/module/src
)

# source/libnx_wrap.c disabled for the time being

set(SOURCES
    source/module/IMG_savepng.c
    source/module/SDL2_rotozoom.c
    source/module/SDL_gfxPrimitives.c
    source/module/_renpy.c
    source/module/_renpybidi.c
    source/module/alphablit.c
    source/module/core.c
    source/module/ffmedia.c
    source/module/ftsupport.c
    source/module/pygame_sdl2.color.c
    source/module/pygame_sdl2.controller.c
    source/module/pygame_sdl2.display.c
    source/module/pygame_sdl2.draw.c
    source/module/pygame_sdl2.error.c
    source/module/pygame_sdl2.event.c
    source/module/pygame_sdl2.font.c
    source/module/pygame_sdl2.gfxdraw.c
    source/module/pygame_sdl2.image.c
    source/module/pygame_sdl2.joystick.c
    source/module/pygame_sdl2.key.c
    source/module/pygame_sdl2.locals.c
    source/module/pygame_sdl2.mixer.c
    source/module/pygame_sdl2.mixer_music.c
    source/module/pygame_sdl2.mouse.c
    source/module/pygame_sdl2.power.c
    source/module/pygame_sdl2.pygame_time.c
    source/module/pygame_sdl2.rect.c
    source/module/pygame_sdl2.render.c
    source/module/pygame_sdl2.rwobject.c
    source/module/pygame_sdl2.scrap.c
    source/module/pygame_sdl2.surface.c
    source/module/pygame_sdl2.transform.c
    source/module/renpy.audio.renpysound.c
    source/module/renpy.display.accelerator.c
    source/module/renpy.display.matrix.c
    source/module/renpy.display.render.c
    source/module/renpy.gl.gldraw.c
    source/module/renpy.gl.glenviron_shader.c
    source/module/renpy.gl.glrtt_copy.c
    source/module/renpy.gl.glrtt_fbo.c
    source/module/renpy.gl.gltexture.c
    source/module/renpy.pydict.c
    source/module/renpy.style.c
    source/module/renpy.styledata.style_activate_functions.c
    source/module/renpy.styledata.style_functions.c
    source/module/renpy.styledata.style_hover_functions.c
    source/module/renpy.styledata.style_idle_functions.c
    source/module/renpy.styledata.style_insensitive_functions.c
    source/module/renpy.styledata.style_selected_activate_functions.c
    source/module/renpy.styledata.style_selected_functions.c
    source/module/renpy.styledata.style_selected_hover_functions.c
    source/module/renpy.styledata.style_selected_idle_functions.c
    source/module/renpy.styledata.style_selected_insensitive_functions.c
    source/module/renpy.styledata.styleclass.c
    source/module/renpy.styledata.stylesets.c
    source/module/renpy.text.ftfont.c
    source/module/renpy.text.textsupport.c
    source/module/renpy.text.texwrap.c
    source/module/renpysound_core.c
    source/module/ttgsubtable.c
    source/module/write_jpeg.c
    source/module/write_png.c
    source/module/renpybidicore.c

    source/module/renpy.compat.dictviews.c
    source/module/renpy.gl2.gl2draw.c
    source/module/renpy.gl2.gl2mesh.c
    source/module/renpy.gl2.gl2mesh2.c
    source/module/renpy.gl2.gl2mesh3.c
    source/module/renpy.gl2.gl2model.c
    source/module/renpy.gl2.gl2polygon.c
    source/module/renpy.gl2.gl2shader.c
    source/module/renpy.gl2.gl2texture.c
    source/module/renpy.uguu.gl.c
    source/module/renpy.uguu.uguu.c
    
    source/module/renpy.lexersupport.c
    source/module/renpy.display.quaternion.c
)

find_package(PkgConfig REQUIRED)
# Workaround for library paths not being set correctly
set(pkgcfg_lib_SDL2_IMAGE_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/libm.a)
set(pkgcfg_lib_SDL2_MIXER_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/libm.a)
set(pkgcfg_lib_SDL2_TTF_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/libm.a)
set(pkgcfg_lib_SDL2_EGL /opt/devkitpro/portlibs/switch/lib/libEGL.a)
set(pkgcfg_lib_SDL2_GFX_EGL /opt/devkitpro/portlibs/switch/lib/libEGL.a)
set(pkgcfg_lib_SDL2_IMAGE_EGL /opt/devkitpro/portlibs/switch/lib/libEGL.a)
set(pkgcfg_lib_SDL2_MIXER_EGL /opt/devkitpro/portlibs/switch/lib/libEGL.a)
set(pkgcfg_lib_SDL2_TTF_EGL /opt/devkitpro/portlibs/switch/lib/libEGL.a)
set(pkgcfg_lib_LIBDRM_NOUVEAU_drm_nouveau /opt/devkitpro/portlibs/switch/lib/libdrm_nouveau.a)
set(pkgcfg_lib_SDL2_GFX_drm_nouveau /opt/devkitpro/portlibs/switch/lib/libdrm_nouveau.a)
set(pkgcfg_lib_SDL2_IMAGE_drm_nouveau /opt/devkitpro/portlibs/switch/lib/libdrm_nouveau.a)
set(pkgcfg_lib_SDL2_MIXER_drm_nouveau /opt/devkitpro/portlibs/switch/lib/libdrm_nouveau.a)
set(pkgcfg_lib_SDL2_TTF_drm_nouveau /opt/devkitpro/portlibs/switch/lib/libdrm_nouveau.a)
set(pkgcfg_lib_SDL2_drm_nouveau /opt/devkitpro/portlibs/switch/lib/libdrm_nouveau.a)
set(pkgcfg_lib_SDL2_GFX_SDL2 /opt/devkitpro/portlibs/switch/lib/libSDL2.a)
set(pkgcfg_lib_SDL2_IMAGE_SDL2 /opt/devkitpro/portlibs/switch/lib/libSDL2.a)
set(pkgcfg_lib_SDL2_MIXER_SDL2 /opt/devkitpro/portlibs/switch/lib/libSDL2.a)
set(pkgcfg_lib_SDL2_SDL2 /opt/devkitpro/portlibs/switch/lib/libSDL2.a)
set(pkgcfg_lib_SDL2_TTF_SDL2 /opt/devkitpro/portlibs/switch/lib/libSDL2.a)
set(pkgcfg_lib_SDL2_IMAGE_z /opt/devkitpro/portlibs/switch/lib/libz.a)
set(pkgcfg_lib_SDL2_TTF_z /opt/devkitpro/portlibs/switch/lib/libz.a)
set(pkgcfg_lib_SDL2_GFX_glapi /opt/devkitpro/portlibs/switch/lib/libglapi.a)
set(pkgcfg_lib_SDL2_IMAGE_glapi /opt/devkitpro/portlibs/switch/lib/libglapi.a)
set(pkgcfg_lib_SDL2_MIXER_glapi /opt/devkitpro/portlibs/switch/lib/libglapi.a)
set(pkgcfg_lib_SDL2_TTF_glapi /opt/devkitpro/portlibs/switch/lib/libglapi.a)
set(pkgcfg_lib_SDL2_glapi /opt/devkitpro/portlibs/switch/lib/libglapi.a)
set(pkgcfg_lib_SDL2_IMAGE_SDL2_image /opt/devkitpro/portlibs/switch/lib/libSDL2_image.a)
set(pkgcfg_lib_SDL2_GFX_SDL2_gfx /opt/devkitpro/portlibs/switch/lib/libSDL2_gfx.a)
set(pkgcfg_lib_SDL2_IMAGE_jpeg /opt/devkitpro/portlibs/switch/lib/libjpeg.a)
set(pkgcfg_lib_SDL2_IMAGE_png16 /opt/devkitpro/portlibs/switch/lib/libpng16.a)
set(pkgcfg_lib_SDL2_IMAGE_webp /opt/devkitpro/portlibs/switch/lib/libwebp.a)
set(pkgcfg_lib_SDL2_MIXER_SDL2_mixer /opt/devkitpro/portlibs/switch/lib/libSDL2_mixer.a)
set(pkgcfg_lib_SDL2_MIXER_modplug /opt/devkitpro/portlibs/switch/lib/libmodplug.a)
set(pkgcfg_lib_SDL2_MIXER_mpg123 /opt/devkitpro/portlibs/switch/lib/libmpg123.a)
set(pkgcfg_lib_SDL2_MIXER_ogg /opt/devkitpro/portlibs/switch/lib/libogg.a)
set(pkgcfg_lib_SDL2_MIXER_opus /opt/devkitpro/portlibs/switch/lib/libopus.a)
set(pkgcfg_lib_SDL2_MIXER_opusfile /opt/devkitpro/portlibs/switch/lib/libopusfile.a)
set(pkgcfg_lib_SDL2_MIXER_stdc++ /opt/devkitpro/devkitA64/aarch64-none-elf/lib/pic/libstdc++.a)
set(pkgcfg_lib_SDL2_MIXER_vorbisidec /opt/devkitpro/portlibs/switch/lib/libvorbisidec.a)
set(pkgcfg_lib_SDL2_TTF_SDL2_ttf /opt/devkitpro/portlibs/switch/lib/libSDL2_ttf.a)
set(pkgcfg_lib_SDL2_TTF_bz2 /opt/devkitpro/portlibs/switch/lib/libbz2.a)
set(pkgcfg_lib_SDL2_TTF_freetype /opt/devkitpro/portlibs/switch/lib/libfreetype.a)
set(pkgcfg_lib_SDL2_TTF_png16 /opt/devkitpro/portlibs/switch/lib/libpng16.a)

pkg_check_modules(EGL REQUIRED IMPORTED_TARGET egl)
pkg_check_modules(FREETYPE2 REQUIRED IMPORTED_TARGET freetype2)
pkg_check_modules(GLAPI REQUIRED IMPORTED_TARGET glapi)
pkg_check_modules(GLESV2 REQUIRED IMPORTED_TARGET glesv2)
pkg_check_modules(LIBAVCODEC REQUIRED IMPORTED_TARGET libavcodec)
pkg_check_modules(LIBAVFILTER REQUIRED IMPORTED_TARGET libavfilter)
pkg_check_modules(LIBAVFORMAT REQUIRED IMPORTED_TARGET libavformat)
pkg_check_modules(LIBAVUTIL REQUIRED IMPORTED_TARGET libavutil)
pkg_check_modules(LIBDRM_NOUVEAU REQUIRED IMPORTED_TARGET libdrm_nouveau)
pkg_check_modules(LIBSWRESAMPLE REQUIRED IMPORTED_TARGET libswresample)
pkg_check_modules(LIBSWSCALE REQUIRED IMPORTED_TARGET libswscale)
pkg_check_modules(SDL2 REQUIRED IMPORTED_TARGET sdl2)
pkg_check_modules(SDL2_GFX REQUIRED IMPORTED_TARGET SDL2_gfx)
pkg_check_modules(SDL2_IMAGE REQUIRED IMPORTED_TARGET SDL2_image)
pkg_check_modules(SDL2_MIXER REQUIRED IMPORTED_TARGET SDL2_mixer)
pkg_check_modules(SDL2_TTF REQUIRED IMPORTED_TARGET SDL2_ttf)
pkg_check_modules(ZLIB REQUIRED IMPORTED_TARGET zlib)

# Workaround for pkg-config not expanding $(DEVKITPRO)
if(LIBDRM_NOUVEAU_INCLUDE_DIRS)
    set_property(TARGET PkgConfig::LIBDRM_NOUVEAU PROPERTY
                 INTERFACE_INCLUDE_DIRECTORIES "${DEVKITPRO}/portlibs/switch/include")
endif()

add_library(${PROJECT_NAME} STATIC ${SOURCES})

target_link_libraries(${PROJECT_NAME}
    ${DEVKITPRO}/portlibs/switch/lib/libpython2.7.a
    ${DEVKITPRO}/portlibs/switch/lib/libfribidi.a
    m
    PkgConfig::EGL
    PkgConfig::FREETYPE2
    PkgConfig::GLAPI
    PkgConfig::GLESV2
    PkgConfig::LIBAVCODEC
    PkgConfig::LIBAVFILTER
    PkgConfig::LIBAVFORMAT
    PkgConfig::LIBAVUTIL
    PkgConfig::LIBDRM_NOUVEAU
    PkgConfig::LIBSWRESAMPLE
    PkgConfig::LIBSWSCALE
    PkgConfig::SDL2
    PkgConfig::SDL2_GFX
    PkgConfig::SDL2_IMAGE
    PkgConfig::SDL2_MIXER
    PkgConfig::SDL2_TTF
    PkgConfig::ZLIB
)

target_include_directories(${PROJECT_NAME} PUBLIC ${INCLUDES})
target_compile_options(${PROJECT_NAME} PUBLIC $<$<COMPILE_LANGUAGE:C>:${C_FLAGS}>)
target_compile_options(${PROJECT_NAME} PUBLIC $<$<CONFIG:RELEASE>:${OPTIMIZATION_FLAGS}>)
target_compile_options(${PROJECT_NAME} PUBLIC $<$<CONFIG:RELWITHDEBINFO>:${OPTIMIZATION_FLAGS}>)
set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)

