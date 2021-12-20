# Setup

Build an image for our build-environment:

    docker build buildenv -t osdev

# Build

Enter build environment:

   Linux or MacOS: `docker run --rm -it -v $(pwd):/root/env osdev`<br>
   Windows (CMD): `docker run --rm -it -v "%cd%":/root/env osdev`<br>
   Windows (PowerShell): `docker run --rm -it -v "${pwd}:/root/env" osdev`<br>
   Please use the linux command if you are using `WSL`, `msys2` or `git bash`<br>
   NOTE: If you are having trouble with an unshared drive, ensure your docker daemon has access to the drive you're development environment is in. For Docker Desktop, this is in "Settings > Shared Drives" or "Settings > Resources > File Sharing".

Build for x86 (other architectures may come in the future):

   `make build-x86_64`
   If you are using Qemu, please close it before running this command to prevent errors.

To leave the build environment, enter exit.

# Emulate

You can emulate your operating system using Qemu: (Don't forget to add qemu to your path!)

   `qemu-system-x86_64 -cdrom dist/x86_64/kernel.iso`
   Note: Close the emulator when finished, so as to not block writing to kernel.iso for future builds.

If the above command fails, try one of the following:

   Windows: `qemu-system-x86_64 -cdrom dist/x86_64/kernel.iso -L "C:\Program Files\qemu"`<br>
   Linux: `qemu-system-x86_64 -cdrom dist/x86_64/kernel.iso -L /usr/share/qemu/`<br>
   Alternatively, install a custom BIOS binary file and link it to Qemu using the `-L` option.<br>

Alternatively, you should be able to load the operating system on a USB drive and boot into it when you turn on your computer. (I haven't actually tested this yet, but it appears to be working for others.)

# Cleanup

Remove the build-evironment image:

   `docker rmi myos-buildenv -f`
