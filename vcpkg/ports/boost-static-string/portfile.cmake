# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/static_string
    REF boost-1.77.0
    SHA512 62e8f014e1b073282a56136591f3eebde2e43574f4d12a638483740483f768e844d2f9f741d31ba7acf9d541c6ac68c1b54f30741763d029091e7d4d1c64bd37
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
