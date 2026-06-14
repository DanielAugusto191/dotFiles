cmake_minimum_required(VERSION ${CMAKE_VERSION})
project("main")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mhvx")
# -fno-rtti = No type info, no dynamic_cast or typeid

# include_directories(${LLVM_INCLUDE_DIRS})
# include_directories("include/")
# link_directories(${LLVM_LIBRARY_DIRS})
# add_definitions(${LLVM_DEFINITIONS})

# add_subdirectory(lib)
# add_subdirectory(tests)
add_executable(main main.c)

llvm_config(teste support core irreader)
target_link_libraries(main PRIVATE ${llvm_libs})
