# Install script for directory: /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "default")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.42-mesh-default.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.42-mesh-default.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.42-mesh-default.so"
         RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib:/usr/local/lib64:$ORIGIN/:$ORIGIN/../lib64")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/lib/libns3.42-mesh-default.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.42-mesh-default.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.42-mesh-default.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.42-mesh-default.so"
         OLD_RPATH "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/lib:"
         NEW_RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib:/usr/local/lib64:$ORIGIN/:$ORIGIN/../lib64")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.42-mesh-default.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ns3" TYPE FILE FILES
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/helper/dot11s/dot11s-installer.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/helper/flame/flame-installer.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/helper/mesh-helper.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/helper/mesh-stack-installer.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/dot11s-mac-header.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/hwmp-protocol.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/hwmp-rtable.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/ie-dot11s-beacon-timing.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/ie-dot11s-configuration.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/ie-dot11s-id.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/ie-dot11s-metric-report.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/ie-dot11s-peer-management.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/ie-dot11s-peering-protocol.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/ie-dot11s-perr.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/ie-dot11s-prep.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/ie-dot11s-preq.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/ie-dot11s-rann.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/peer-link-frame.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/peer-link.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/dot11s/peer-management-protocol.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/flame/flame-header.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/flame/flame-protocol-mac.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/flame/flame-protocol.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/flame/flame-rtable.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/mesh-information-element-vector.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/mesh-l2-routing-protocol.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/mesh-point-device.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/mesh-wifi-beacon.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/mesh-wifi-interface-mac-plugin.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/mesh/model/mesh-wifi-interface-mac.h"
    "/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/include/ns3/mesh-module.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/mesh/examples/cmake_install.cmake")

endif()
