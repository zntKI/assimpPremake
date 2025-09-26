project "assimpPremake"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir "%{wks.location}/bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"
    objdir "%{wks.location}/bin-int/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"

    includedirs
    {
        "include",
        "code",
        "contrib/irrXML",
        "contrib/unzip",
        "contrib/zlib",
        "contrib/rapidjson/include"
    }

    files
    {
        "code/**.cpp",
        "code/**.c",
        "code/**.h",
        "code/**.hpp",
        "contrib/irrXML/**.cpp",
        "contrib/irrXML/**.h",
        "contrib/unzip/**.c",
        "contrib/unzip/**.h",
        "contrib/zlib/**.c",
        "contrib/zlib/**.h"
    }

    -- exclude tools, tests, and sample apps
    removefiles
    {
        "code/Tools/**",
        "code/CTestFiles.cmake"
    }

    defines
    {
        "_CRT_SECURE_NO_WARNINGS"
    }

    filter "system:windows"
        systemversion "latest"
        defines { "WIN32", "_WINDOWS" }

    filter "system:linux"
        defines { "LINUX" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"
        defines { "ZR_DEBUG", "DEBUG" }

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
        defines { "ZR_NDEBUG", "NDEBUG" }
