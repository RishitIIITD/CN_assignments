# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache

# Include any dependencies generated for this target.
include examples/wireless/CMakeFiles/wifi-dsss-validation.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/wireless/CMakeFiles/wifi-dsss-validation.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/wireless/CMakeFiles/wifi-dsss-validation.dir/progress.make

# Include the compile flags for this target's objects.
include examples/wireless/CMakeFiles/wifi-dsss-validation.dir/flags.make

examples/wireless/CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.o: examples/wireless/CMakeFiles/wifi-dsss-validation.dir/flags.make
examples/wireless/CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.o: /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/examples/wireless/wifi-dsss-validation.cc
examples/wireless/CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.o: examples/wireless/CMakeFiles/wifi-dsss-validation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/wireless/CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.o"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/examples/wireless && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples/wireless/CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.o -MF CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.o.d -o CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.o -c /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/examples/wireless/wifi-dsss-validation.cc

examples/wireless/CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.i"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/examples/wireless && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/examples/wireless/wifi-dsss-validation.cc > CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.i

examples/wireless/CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.s"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/examples/wireless && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/examples/wireless/wifi-dsss-validation.cc -o CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.s

# Object files for target wifi-dsss-validation
wifi__dsss__validation_OBJECTS = \
"CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.o"

# External object files for target wifi-dsss-validation
wifi__dsss__validation_EXTERNAL_OBJECTS =

/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/examples/wireless/ns3.42-wifi-dsss-validation-default: examples/wireless/CMakeFiles/wifi-dsss-validation.dir/wifi-dsss-validation.cc.o
/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/examples/wireless/ns3.42-wifi-dsss-validation-default: examples/wireless/CMakeFiles/wifi-dsss-validation.dir/build.make
/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/examples/wireless/ns3.42-wifi-dsss-validation-default: examples/wireless/CMakeFiles/wifi-dsss-validation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/examples/wireless/ns3.42-wifi-dsss-validation-default"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/examples/wireless && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wifi-dsss-validation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/wireless/CMakeFiles/wifi-dsss-validation.dir/build: /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/examples/wireless/ns3.42-wifi-dsss-validation-default
.PHONY : examples/wireless/CMakeFiles/wifi-dsss-validation.dir/build

examples/wireless/CMakeFiles/wifi-dsss-validation.dir/clean:
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/examples/wireless && $(CMAKE_COMMAND) -P CMakeFiles/wifi-dsss-validation.dir/cmake_clean.cmake
.PHONY : examples/wireless/CMakeFiles/wifi-dsss-validation.dir/clean

examples/wireless/CMakeFiles/wifi-dsss-validation.dir/depend:
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42 /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/examples/wireless /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/examples/wireless /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/examples/wireless/CMakeFiles/wifi-dsss-validation.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : examples/wireless/CMakeFiles/wifi-dsss-validation.dir/depend
