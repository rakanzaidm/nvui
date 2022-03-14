# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/function
    REF boost-1.77.0
    SHA512 637f6d436614a805bb7d8e5dac0fc154896f4e77a51e1bf2d4509779bc412eaff1756dedcc9937490ca21d5bc15c8df6d911cfe9eebce51f80b5ec42a85d4155
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
