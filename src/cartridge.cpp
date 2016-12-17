#include <cstdio>
#include "apu.hpp"
#include "cpu.hpp"
#include "mappers/mapper0.hpp"
#include "mappers/mapper1.hpp"
#include "mappers/mapper2.hpp"
#include "mappers/mapper3.hpp"
#include "mappers/mapper4.hpp"
#include "ppu.hpp"
#include "cartridge.hpp"

namespace Cartridge {


Mapper* mapper = nullptr;  // Mapper chip.

/* PRG-ROM access */
template <bool wr> u8 access(u16 addr, u8 v)
{
    if (!wr) return mapper->read(addr);
    else     return mapper->write(addr, v);
}
template u8 access<0>(u16, u8); template u8 access<1>(u16, u8);

/* CHR-ROM/RAM access */
template <bool wr> u8 chr_access(u16 addr, u8 v)
{
    if (!wr) return mapper->chr_read(addr);
    else     return mapper->chr_write(addr, v);
}
template u8 chr_access<0>(u16, u8); template u8 chr_access<1>(u16, u8);

void signal_scanline()
{
    mapper->signal_scanline();
}

/* Load the ROM from the memory. */
void load(void* rom, int size)
{
    u8* _rom = (u8*)rom;
    int mapperNum = (_rom[7] & 0xF0) | (_rom[6] >> 4);
    if (loaded()) delete mapper;
    switch (mapperNum)
    {
        case 0:  mapper = new Mapper0(_rom); break;
        case 1:  mapper = new Mapper1(_rom); break;
        case 2:  mapper = new Mapper2(_rom); break;
        case 3:  mapper = new Mapper3(_rom); break;
        case 4:  mapper = new Mapper4(_rom); break;
    }

    CPU::power();
    PPU::reset();
    APU::reset();
}

bool loaded()
{
    return mapper != nullptr;
}


}
