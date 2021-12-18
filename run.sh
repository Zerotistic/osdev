export PATH=$PATH:/usr/local/i386elfgcc/bin

nasm "boot.asm" -f bin -o "binaries/boot.bin"
nasm "kernel/kernel_entry.asm" -f elf -o "binaries/kernel_entry.o"
i386-elf-gcc -ffreestanding -m32 -g -c "kernel/kernel.cpp" -o "binaries/kernel.o"
nasm "zeroes.asm" -f bin -o "binaries/zeroes.bin"

i386-elf-ld -o "binaries/full_kernel.bin" -Ttext 0x1000 "binaries/kernel_entry.o" "binaries/kernel.o" --oformat binary

cat "binaries/boot.bin" "binaries/full_kernel.bin" "binaries/zeroes.bin"  > "binaries/OS.bin"

qemu-system-x86_64 -drive format=raw,file="binaries/OS.bin",index=0,if=floppy, -m 128M