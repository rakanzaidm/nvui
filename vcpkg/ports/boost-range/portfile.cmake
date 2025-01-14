# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/range
    REF boost-1.77.0
    SHA512 502dfd6f4c08fd653fee6a9fac14c717ddcd53d3e9ff68c43b80ccac73b88bb98bfb92e88508b82eb8eafa96e29914fe43b0ab550f62e6708d5ea0465ae9d51e
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
