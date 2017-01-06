#pragma once
#include <string>
#include "Nes_Apu.h"
#include "common.hpp"

namespace HAL {
    u8 get_joypad_state(int n);
#ifdef USE_32BIT_COLOR
    void new_frame(u32* pixels);
#else
    void new_frame(u16* pixels);
#endif
    void new_samples(const blip_sample_t* samples, size_t count);
}
