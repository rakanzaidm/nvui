# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/parameter_python
    REF boost-1.77.0
    SHA512 d3fb2f165cbb1917143ea92be4debbf5f02d43003d9f1ec2e1c19412e39b96e143ac9e0b64a7455d9ce05617f152f0b8b67fee737c92381f0cdbf8996c610b77
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
