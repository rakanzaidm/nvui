# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/assign
    REF boost-1.77.0
    SHA512 5c72f5637f0c456a060a4204533798ceea39f95a7d96e4f9e05cdd25d178244b8a3a596a7387228df5929b1e3141724503b2579db9b546fadbb0e70648fc99e1
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
