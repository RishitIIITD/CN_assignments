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
include src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/compiler_depend.make

# Include the progress variables for this target.
include src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/progress.make

# Include the compile flags for this target's objects.
include src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/flags.make

src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.o: src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/flags.make
src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.o: /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/olsr/examples/simple-point-to-point-olsr.cc
src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.o: src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.o"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/olsr/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.o -MF CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.o.d -o CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.o -c /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/olsr/examples/simple-point-to-point-olsr.cc

src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.i"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/olsr/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/olsr/examples/simple-point-to-point-olsr.cc > CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.i

src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.s"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/olsr/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/olsr/examples/simple-point-to-point-olsr.cc -o CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.s

# Object files for target simple-point-to-point-olsr
simple__point__to__point__olsr_OBJECTS = \
"CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.o"

# External object files for target simple-point-to-point-olsr
simple__point__to__point__olsr_EXTERNAL_OBJECTS =

/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/src/olsr/examples/ns3.42-simple-point-to-point-olsr-default: src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/simple-point-to-point-olsr.cc.o
/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/src/olsr/examples/ns3.42-simple-point-to-point-olsr-default: src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/build.make
/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/src/olsr/examples/ns3.42-simple-point-to-point-olsr-default: src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/src/olsr/examples/ns3.42-simple-point-to-point-olsr-default"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/olsr/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/simple-point-to-point-olsr.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/build: /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/build/src/olsr/examples/ns3.42-simple-point-to-point-olsr-default
.PHONY : src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/build

src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/clean:
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/olsr/examples && $(CMAKE_COMMAND) -P CMakeFiles/simple-point-to-point-olsr.dir/cmake_clean.cmake
.PHONY : src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/clean

src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/depend:
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42 /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/olsr/examples /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/olsr/examples /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/olsr/examples/CMakeFiles/simple-point-to-point-olsr.dir/depend
