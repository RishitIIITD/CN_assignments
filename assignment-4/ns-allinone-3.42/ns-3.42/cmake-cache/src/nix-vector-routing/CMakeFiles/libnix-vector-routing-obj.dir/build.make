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
include src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/compiler_depend.make

# Include the progress variables for this target.
include src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/progress.make

# Include the compile flags for this target's objects.
include src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/flags.make

src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.o: src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/flags.make
src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.o: /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/nix-vector-routing/helper/nix-vector-helper.cc
src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.o: src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.o"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/nix-vector-routing && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.o -MF CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.o.d -o CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.o -c /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/nix-vector-routing/helper/nix-vector-helper.cc

src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.i"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/nix-vector-routing && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/nix-vector-routing/helper/nix-vector-helper.cc > CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.i

src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.s"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/nix-vector-routing && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/nix-vector-routing/helper/nix-vector-helper.cc -o CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.s

src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.o: src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/flags.make
src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.o: /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/nix-vector-routing/model/nix-vector-routing.cc
src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.o: src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.o"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/nix-vector-routing && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.o -MF CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.o.d -o CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.o -c /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/nix-vector-routing/model/nix-vector-routing.cc

src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.i"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/nix-vector-routing && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/nix-vector-routing/model/nix-vector-routing.cc > CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.i

src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.s"
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/nix-vector-routing && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/nix-vector-routing/model/nix-vector-routing.cc -o CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.s

libnix-vector-routing-obj: src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/helper/nix-vector-helper.cc.o
libnix-vector-routing-obj: src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/model/nix-vector-routing.cc.o
libnix-vector-routing-obj: src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/build.make
.PHONY : libnix-vector-routing-obj

# Rule to build all files generated by this target.
src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/build: libnix-vector-routing-obj
.PHONY : src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/build

src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/clean:
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/nix-vector-routing && $(CMAKE_COMMAND) -P CMakeFiles/libnix-vector-routing-obj.dir/cmake_clean.cmake
.PHONY : src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/clean

src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/depend:
	cd /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42 /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/src/nix-vector-routing /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/nix-vector-routing /mnt/c/Users/RISHIT/Documents/CSE/SEM_5/CN/assignments/assignment-4/ns-allinone-3.42/ns-3.42/cmake-cache/src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/nix-vector-routing/CMakeFiles/libnix-vector-routing-obj.dir/depend
