#include <thread>
#include <nvtx3/nvtx3.hpp>

void some_function() {
  NVTX3_FUNC_RANGE(); // equivalent to e.g. `nvtx3::scoped_range fn{__FUNCTION__};'
  for (int i = 0; i < 6; ++i) {
    nvtx3::scoped_range loop{"loop iteration range"};
    // Make each iteration last for one ms:
    std::this_thread::sleep_for(std::chrono::milliseconds{1});
  }
}

int main(int, char **) {
  some_function();
}