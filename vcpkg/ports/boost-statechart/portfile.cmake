# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/statechart
    REF boost-1.77.0
    SHA512 6bbe4a45ae1ff8ec76282d4bf2579a7882fe4682531facd97743096da33c715ea800fbf5e006c0d5b19a96b273fd297ee15c83a1ef90f1e0984aff66977ecbf1
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
