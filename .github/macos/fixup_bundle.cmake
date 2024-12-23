include(BundleUtilities)

# Xcode generator puts the build type in the build directory
set(BUILD_PREFIX "")
if (CMAKE_GENERATOR STREQUAL "Xcode")
    set(BUILD_PREFIX "${CMAKE_BUILD_TYPE}/")
endif()

# Use generator expressions to get the absolute path to the bundle and frameworks
set(APPS "${BUILD_PREFIX}Zelda64Recompiled.app/Contents/MacOS/Zelda64Recompiled")
set(DIRS "${BUILD_PREFIX}Zelda64Recompiled.app/Contents/Frameworks")

# The fixup_bundle command needs an absolute path
file(REAL_PATH ${APPS} APPS)
file(REAL_PATH ${DIRS} DIRS)

fixup_bundle("${APPS}" "" "${DIRS}")