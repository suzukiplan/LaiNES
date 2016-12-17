// this is a dummy code for checking the linkage
#include "hal.hpp"

int main() {
	return 0;
}

namespace HAL {
	u8 get_joypad_state(int n) {
		return 0; // return joypad state
	}
	void new_frame(u32* pixels) {
		// set pixels to graphic-module
	}
	void new_samples(const blip_sample_t* samples, size_t count) {
		// set samples to sound-module
	}
}
