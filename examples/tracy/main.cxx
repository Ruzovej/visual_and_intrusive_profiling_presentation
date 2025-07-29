#include <thread>
#include <tracy/Tracy.hpp>

void some_function() {
  ZoneScoped; // equivalent to the `NVTX3_FUNC_RANGE();`
  for (int i = 0; i < 6; ++i) {
    ZoneScopedN("loop iteration range"); // equivalent to the
                                         // `nvtx3::scoped_range loop{...};`
    std::this_thread::sleep_for(std::chrono::milliseconds{1});
  }
}

int main(int, char **) { some_function(); }