

project "SDL2"
    kind "SharedLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "Off"

    targetdir (TARGET_OUTPUT_DIR .. "/%{prj.name}")
    objdir (OBJ_OUTPUT_DIR .. "/%{prj.name}")

    includedirs {
        "include",
    }

    files {
        
        "src/*.c",
        "src/*.h",
        "src/atomic/*.c",
        "src/cpuinfo/*.c",

        "src/audio/*.c",
        "src/audio/*.h",
        "src/audio/disk/*.c",
        "src/audio/disk/*.h",
        "src/audio/dummy/*.c",
        "src/audio/dummy/*.h",

        "src/dynapi/*.c",
        "src/dynapi/*.h",
        
        "src/events/*.c",
        "src/events/*.h",

        "src/file/*.c",

        "src/haptic/*.c",
        "src/haptic/*.h",

        "src/hidapi/*.h",
        "src/hidapi/*.c",
        
        "src/joystick/*.c",
        "src/joystick/*.h",
        "src/joystick/hidapi/**.c",
        "src/joystick/hidapi/**.h",
        "src/joystick/virtual/*.c",
        "src/joystick/virtual/*.h",

        "src/libm/*.c",
        "src/libm/*.h",

        "src/loadso/dummy/*.c",

        "src/locale/*.c",
        "src/locale/*.h",

        "src/misc/*.c",
        "src/misc/*.h",

        "src/power/*.c",
        "src/power/*.h",

        "src/render/opengl/*.c",
        "src/render/opengl/*.h",
        "src/render/opengles2/*.c",
        "src/render/opengles2/*.h",
        "src/render/SDL_yuv_sw.c",
        "src/render/SDL_yuv_sw_c.h",
        "src/render/software/*.c",
        "src/render/software/*.h",
        "src/render/SDL_sysrender.h",
        "src/render/SDL_render.c",

        "src/sensor/*.c",
        "src/sensor/*.h",

        "src/stdlib/*.c",
        "src/stdlib/*.h",

        "src/thread/*.c",
        "src/thread/*.h",
        "src/thread/generic/SDL_syscond.c",
       
        "src/timer/*.c",
        "src/timer/*.h",
       
        "src/video/*.c",
        "src/video/*.h",
        "src/video/dummy/*.c",
        "src/video/dummy/*.h",
        "src/video/yuv2rgb/*.c",
        "src/video/yuv2rgb/*.h",
    }

    filter "system:windows"
        files {

            "include/SDL_config_windows.h",

            "src/core/windows/*.c",
            "src/core/windows/*.h",

            "src/audio/directsound/*.c",
            "src/audio/directsound/*.h",
            "src/audio/wasapi/*.c",
            "src/audio/wasapi/*.h",
            "src/audio/winmm/*.c",
            "src/audio/winmm/*.h",

            "src/filesystem/windows/*.c",

            "src/haptic/windows/*.c",
            "src/haptic/windows/*.h",

            "src/joystick/windows/*.c",
            "src/joystick/windows/*.h",

            "src/locale/windows/*.c",
            "src/locale/windows/*.h",

            "src/misc/windows/*.c",
            "src/misc/windows/*.h",

            "src/loadso/windows/*.c",
            "src/power/windows/*.c",

            "src/render/*.c",
            "src/render/*.h",
            "src/render/direct3d11/*.c",
            "src/render/direct3d11/*.h",
            "src/render/direct3d/*.h",
            "src/render/direct3d/*.c",
            "src/render/direct3d12/*.c",
            "src/render/direct3d12/*.h",
            
            "src/sensor/windows/*.c",
            "src/sensor/windows/*.h",

            "src/thread/windows/*.c",
            "src/thread/windows/*.h",

            "src/timer/windows/SDL_systimer.c",

            "src/video/windows/*.c",
            "src/video/windows/SDL_vkeys.h",
            "src/video/windows/SDL_windowsclipboard.h",
            "src/video/windows/SDL_windowsevents.h",
            "src/video/windows/SDL_windowsframebuffer.h",
            "src/video/windows/SDL_windowskeyboard.h",
            "src/video/windows/SDL_windowsmessagebox.h",
            "src/video/windows/SDL_windowsmodes.h",
            "src/video/windows/SDL_windowsmouse.h",
            "src/video/windows/SDL_windowsopengl.h",
            "src/video/windows/SDL_windowsshape.h",
            "src/video/windows/SDL_windowsvideo.h",
            "src/video/windows/SDL_windowsvulkan.h",
            "src/video/windows/SDL_windowswindow.h",
            "src/video/windows/wmmsg.h",

        }

        defines {
            "_WINDOWS",
            "WIN32",
            "__WIN32__",
            "DLL_EXPORT"
        }

        flags {
            "NoRuntimeChecks", -- Only used on Visual Studio.
            "NoBufferSecurityCheck"
        }   

        links {
            "setupapi",
            "winmm",
            "imm32",
            "version",
        }

        postbuildcommands {
            ("{COPY} " .. TARGET_OUTPUT_DIR ..  "/SDL2/SDL2.dll " .. TARGET_OUTPUT_DIR .. "/Sandbox")
        }

        systemversion "latest"

    filter "configurations:Debug"
        defines "_DEBUG"
        runtime "Debug"
        symbols "On"
    
        
    filter "configurations:Release"
        defines "NDEBUG"
        runtime "Release"
        optimize "Speed"

    
    filter "configurations:Final"
        
        
