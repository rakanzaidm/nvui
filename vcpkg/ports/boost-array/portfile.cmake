# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/array
    REF boost-1.77.0
    SHA512 e34d8e46ccb3d1efad8863a6babe59762c6cd7c5eaf45bd85402a68e445bde3202cd13c86d1ecef62d5b1855b4d32aa5d5bc62010213da38ee69b7c796669a53
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
