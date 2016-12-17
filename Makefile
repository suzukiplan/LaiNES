OBJS = build/apu.o\
	build/cartridge.o\
	build/cpu.o\
	build/joypad.o\
	build/mapper.o\
	build/ppu.o\
	build/mapper1.o\
	build/mapper2.o\
	build/mapper3.o\
	build/mapper4.o

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
	lib/include/Nes_Apu.h

FLAGS = -std=c++14 -Isrc/include -Ilib/include -c

all: build $(OBJS)
	g++ test.cpp $(OBJS)

build:
	mkdir build

build/apu.o: src/apu.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) $<

build/cartridge.o: src/cartridge.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) $<

build/cpu.o: src/cpu.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) $<

build/joypad.o: src/joypad.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) $<

build/mapper.o: src/mapper.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) $<

build/ppu.o: src/ppu.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) $<

build/mapper1.o: src/mappers/mapper1.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) $<

build/mapper2.o: src/mappers/mapper2.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) $<

build/mapper3.o: src/mappers/mapper3.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) $<

build/mapper4.o: src/mappers/mapper4.cpp $(HEADERS)
	g++ -o $@ $(FLAGS) $<
