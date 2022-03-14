# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/lambda
    REF boost-1.77.0
    SHA512 bf8514928f42618eb056fc61370606ac38c1914822c308a288342459b29a8c202f2ca6efe3c9317b371a5ca435da2c0b79f6f8de2df7a8a95033b9eb22331102
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
