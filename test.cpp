// this is a dummy code for checking the linkage
#include <stdio.h>
#include "cartridge.hpp"
#include "apu.hpp"
#include "cpu.hpp"
#include "hal.hpp"

int main(int argc, char* argv[]) {
	if (argc < 2) {
		puts("usage: a.out rom_file");
		return 1;
	}

	// note: need initialize APU before load rom
	APU::init();

	// load rom file
	puts("loading");
	Cartridge::load(argv[1]);
	if (!Cartridge::loaded()) {
		puts("load error");
		return 2;
	}

	// execute 60 frame
	for (int i = 0; i < 60; i++) {
		puts("execute 1 frame");
		CPU::run_frame();
	}

	return 0;
}

// these function will callbacked by CPU (CPU::run_frame function)
namespace HAL {
	u8 get_joypad_state(int n) {
		printf("get_joypad_state: %d\n", n);
		return 0; // return joypad state
	}
	void new_frame(u32* pixels) {
		// set pixels to graphic-module
		printf("new_frame: %p\n", pixels);
	}
	void new_samples(const blip_sample_t* samples, size_t count) {
		// set samples to sound-module
		printf("new_samples: %p, %ld\n", samples, count);
	}
}
