OBJS = build/apu.o\
	build/cartridge.o\
	build/cpu.o\
	build/joypad.o\
	build/mapper.o\
	build/ppu.o\
	build/mapper1.o\
	build/mapper2.o\
	build/mapper3.o\
	build/mapper4.o\
	build/Nes_Apu.o\
	build/Nes_Oscs.o\
	build/Blip_Buffer.o

HEADERS = src/include/apu.hpp\
	src/include/cartridge.hpp\
	src/include/common.hpp\
	src/include/cpu.hpp\
	src/include/hal.hpp\
	src/include/joypad.hpp\
	src/include/mapper.hpp\
	src/include/ppu.hpp\
	src/include/mappers/mapper0.hpp\
	src/include/mappers/mapper1.hpp\
	src/include/mappers/mapper2.hpp\
	src/include/mappers/mapper3.hpp\
	src/include/mappers/mapper4.hpp\
	lib/include/Nes_Apu.h\
	lib/include/Nes_Oscs.h\
	lib/include/Blip_Buffer.h

FLAGS = -std=c++14 -Isrc/include -Isrc/include/mappers -Ilib/include

all: build $(OBJS)
	g++ $(FLAGS) test.cpp $(OBJS)

build:
	mkdir build

build/apu.o: src/apu.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) -c $<

build/cartridge.o: src/cartridge.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) -c $<

build/cpu.o: src/cpu.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) -c $<

build/joypad.o: src/joypad.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) -c $<

build/mapper.o: src/mapper.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) -c $<

build/ppu.o: src/ppu.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) -c $<

build/mapper1.o: src/mappers/mapper1.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) -c $<

build/mapper2.o: src/mappers/mapper2.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) -c $<

build/mapper3.o: src/mappers/mapper3.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) -c $<

build/mapper4.o: src/mappers/mapper4.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) -c $<

build/Nes_Apu.o: lib/Nes_Apu.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) -c $<

build/Nes_Oscs.o: lib/Nes_Oscs.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) -c $<

build/Blip_Buffer.o: lib/Blip_Buffer.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) -c $<
