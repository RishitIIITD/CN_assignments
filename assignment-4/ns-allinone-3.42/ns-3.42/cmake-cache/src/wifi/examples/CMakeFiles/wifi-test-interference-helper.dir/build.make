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
include src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/compiler_depend.make

# Include the progress variables for this target.
include src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/progress.make

# Include the compile flags for this target's objects.
include src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/flags.make

src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.o: src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/flags.make
src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.o: /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/wifi/examples/wifi-test-interference-helper.cc
src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.o: src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.o"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/wifi/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.o -MF CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.o.d -o CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.o -c /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/wifi/examples/wifi-test-interference-helper.cc

src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.i"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/wifi/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/wifi/examples/wifi-test-interference-helper.cc > CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.i

src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.s"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/wifi/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/wifi/examples/wifi-test-interference-helper.cc -o CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.s

# Object files for target wifi-test-interference-helper
wifi__test__interference__helper_OBJECTS = \
"CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.o"

# External object files for target wifi-test-interference-helper
wifi__test__interference__helper_EXTERNAL_OBJECTS =

/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/src/wifi/examples/ns3.42-wifi-test-interference-helper-default: src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/wifi-test-interference-helper.cc.o
/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/src/wifi/examples/ns3.42-wifi-test-interference-helper-default: src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/build.make
/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/src/wifi/examples/ns3.42-wifi-test-interference-helper-default: src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/src/wifi/examples/ns3.42-wifi-test-interference-helper-default"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/wifi/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wifi-test-interference-helper.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/build: /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/src/wifi/examples/ns3.42-wifi-test-interference-helper-default
.PHONY : src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/build

src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/clean:
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/wifi/examples && $(CMAKE_COMMAND) -P CMakeFiles/wifi-test-interference-helper.dir/cmake_clean.cmake
.PHONY : src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/clean

src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/depend:
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42 /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/wifi/examples /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/wifi/examples /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/wifi/examples/CMakeFiles/wifi-test-interference-helper.dir/depend
