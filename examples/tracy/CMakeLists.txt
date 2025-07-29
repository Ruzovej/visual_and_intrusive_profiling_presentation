cmake_minimum_required(VERSION 3.16)

project(
    tracy_example
    DESCRIPTION "tracy usage example"
    LANGUAGES CXX
)

set(CMAKE_EXPORT_COMPILE_COMMANDS "ON" CACHE BOOL "Export compile commands" FORCE)

include(FetchContent)

FetchContent_Declare(
    tracy
    GIT_REPOSITORY  https://github.com/wolfpld/tracy
    GIT_TAG         v0.12.2
    GIT_SHALLOW     TRUE
    GIT_PROGRESS    TRUE
)
FetchContent_MakeAvailable(tracy)

add_executable(tracy_example main.cxx)
target_link_libraries(tracy_example PRIVATE Tracy::TracyClient)
