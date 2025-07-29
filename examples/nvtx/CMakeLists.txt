cmake_minimum_required(VERSION 3.16)

project(
    nvtx_example
    DESCRIPTION "nvtx usage example"
    LANGUAGES CXX
)

set(CMAKE_EXPORT_COMPILE_COMMANDS "ON" CACHE BOOL "Export compile commands" FORCE)

include(FetchContent)

FetchContent_Declare(
    nvtx3
    GIT_REPOSITORY https://github.com/NVIDIA/NVTX.git
    GIT_TAG        release-v3
)
FetchContent_MakeAvailable(nvtx3)

add_executable(nvtx_example main.cxx)
target_link_libraries(nvtx_example PRIVATE nvtx3-cpp)
