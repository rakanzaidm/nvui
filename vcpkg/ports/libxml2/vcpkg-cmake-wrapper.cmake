_find_package(${ARGS})
if(LibXml2_FOUND)
    list(APPEND LIBXML2_INCLUDE_DIRS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include")
    list(APPEND LIBXML2_INCLUDE_DIR "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include") # This is wrong but downstream doesn't correctly use _DIR vs _DIRS variables
    if(TARGET LibXml2::LibXml2)
       target_include_directories(LibXml2::LibXml2 INTERFACE "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include")
    endif()
endif()
if(LibXml2_FOUND AND "@VCPKG_LIBRARY_LINKAGE@" STREQUAL "static" AND NOT ${ARGV0}_CONFIG)
    find_package(LibLZMA)
    find_package(ZLIB)
    find_package(Iconv)
    include(SelectLibraryConfigurations)
    find_library(LIBXML2_LIBRARY_DEBUG NAMES xml2 libxml2 xml2s libxml2s xml2d libxml2d xml2sd libxml2sd NAMES_PER_DIR PATH_SUFFIXES lib PATHS "${_INSTALLED_DIR}/debug" NO_DEFAULT_PATH)
    find_library(LIBXML2_LIBRARY_RELEASE NAMES xml2 libxml2 xml2s libxml2s NAMES_PER_DIR PATH_SUFFIXES lib PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}" NO_DEFAULT_PATH)
    unset(LIBXML2_LIBRARIES)
    unset(LIBXML2_LIBRARY CACHE)
    select_library_configurations(LIBXML2)
    list(APPEND LIBXML2_LIBRARIES ${LIBLZMA_LIBRARIES} ${ZLIB_LIBRARIES})
    if(Iconv_LIBRARIES)
        list(APPEND LIBXML2_LIBRARIES ${Iconv_LIBRARIES})
    endif()
    if(TARGET LibXml2::LibXml2 AND LIBXML2_LIBRARY_RELEASE)
        set_target_properties(LibXml2::LibXml2 PROPERTIES IMPORTED_LOCATION_RELEASE "${LIBXML2_LIBRARY_RELEASE}")
    endif()
    if(TARGET LibXml2::LibXml2 AND LIBXML2_LIBRARY_DEBUG)
        set_target_properties(LibXml2::LibXml2 PROPERTIES IMPORTED_LOCATION_DEBUG "${LIBXML2_LIBRARY_DEBUG}")
    endif()
    cmake_policy(PUSH)
    cmake_policy(SET CMP0079 NEW)
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        list(APPEND LIBXML2_LIBRARIES m)
        if(TARGET LibXml2::LibXml2)
            set_property(TARGET LibXml2::LibXml2 APPEND PROPERTY INTERFACE_LINK_LIBRARIES "m")
        endif()
    elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
        list(APPEND LIBXML2_LIBRARIES ws2_32)
        if(TARGET LibXml2::LibXml2)
            set_property(TARGET LibXml2::LibXml2 APPEND PROPERTY INTERFACE_LINK_LIBRARIES "ws2_32")
        endif()
    endif()
    if(TARGET LibXml2::LibXml2)
        set_property(TARGET LibXml2::LibXml2 APPEND PROPERTY INTERFACE_LINK_LIBRARIES "liblzma::liblzma" "ZLIB::ZLIB")
        if(TARGET Iconv::Iconv)
            set_property(TARGET LibXml2::LibXml2 APPEND PROPERTY INTERFACE_LINK_LIBRARIES "Iconv::Iconv")
        endif()
    endif()
    cmake_policy(POP)
endif()
