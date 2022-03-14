include(FindPackageHandleStandardArgs)
include(SelectLibraryConfigurations)

find_path(OPENMESHCORE_INCLUDE_DIR EigenVectorT.hh PATH_SUFFIXES OpenMesh/Core/Geometry)
get_filename_component(OPENMESHCORE_INCLUDE_DIR ${OPENMESHCORE_INCLUDE_DIR} DIRECTORY)
get_filename_component(OPENMESHCORE_INCLUDE_DIR ${OPENMESHCORE_INCLUDE_DIR} DIRECTORY)
get_filename_component(OPENMESHCORE_INCLUDE_DIR ${OPENMESHCORE_INCLUDE_DIR} DIRECTORY)

find_library(OPENMESHCORE_LIBRARY_DEBUG NAMES OpenMeshCored libOpenMeshCored NAMES_PER_DIR PATH_SUFFIXES lib PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/debug" NO_DEFAULT_PATH REQUIRED)
find_library(OPENMESHCORE_LIBRARY_RELEASE NAMES OpenMeshCore libOpenMeshCore NAMES_PER_DIR PATH_SUFFIXES lib PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}" NO_DEFAULT_PATH REQUIRED)
find_library(OPENMESHTOOLS_LIBRARY_DEBUG NAMES OpenMeshToolsd libOpenMeshToolsd NAMES_PER_DIR PATH_SUFFIXES lib PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/debug" NO_DEFAULT_PATH REQUIRED)
find_library(OPENMESHTOOLS_LIBRARY_RELEASE NAMES OpenMeshTools libOpenMeshTools NAMES_PER_DIR PATH_SUFFIXES lib PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}" NO_DEFAULT_PATH REQUIRED)

select_library_configurations(OPENMESHCORE)
select_library_configurations(OPENMESHTOOLS)

set(OPENMESH_INCLUDE_DIRS ${OPENMESHCORE_INCLUDE_DIR})
set(OPENMESH_LIBRARIES ${OPENMESHCORE_LIBRARY} ${OPENMESHTOOLS_LIBRARY})