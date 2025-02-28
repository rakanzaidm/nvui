# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/compute
    REF boost-1.77.0
    SHA512 1ca1ed9fdb87ea5c848bdac6e1a941b85927c31454143d06d98e214469fa1b902f1bc722c0a3e99acdc184b966789cb02d1ad2502aebd83315c3b54959dc79c0
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
