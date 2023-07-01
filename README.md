# x86 Assembly Programs

This repository contains low-level assembly programs written using the Netwide Assembler (NASM) and the GNU Compiler Collection (GCC).

## Instructions

1. Open the terminal in the folder where you want to run the codes.

2. Run the following commands for each code file with the `.asm` extension:

   ```
   nasm -felf32 filename.asm
   gcc -m32 filename.o
   ./a.out
   ```

3. To delete the object files (`.o` files), use the following command:

   ```
   rm *.o
   ```

4. To delete the executable file, use the following command:

   ```
   rm a.out
   ```

Make sure to replace `filename` with the actual name of the code file you want to assemble and run.

Please note that these instructions assume you have NASM and GCC installed on your system. If you don't have them installed, you can install them using the package manager of your Linux distribution.
