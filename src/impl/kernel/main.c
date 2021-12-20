#include "print.h"
#include "isr.h"
#include "idt.h"
#include "util.h"
#include "../drivers/screen.h"
#include "../drivers/ports.c"

void kernel_main() {
    port_byte_out(0x21 , 0xff);
    port_byte_out(0xA1 , 0xff);
    isr_install();

    print_clear();
    print_set_color(PRINT_COLOR_YELLOW, PRINT_COLOR_BLACK);
    print_str("This is a 64 bits kernel");
    print_newline();
    print_str("So i'll try getting input now");
    print_newline();
}