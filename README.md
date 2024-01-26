# Assembler Programs for x86 Architecture

Contained within this repository are low-level assembly programs crafted using the Netwide Assembler (NASM) and the GNU Compiler Collection (GCC).

## Getting Started

1. Open your terminal within the directory where you intend to execute the code.

2. Execute the following commands for each code file carrying the `.asm` extension:

   ```
   nasm -felf32 <FILENAME>.asm -o <FILENAME>.o
   gcc -m32 <FILENAME>.o
   ./<FILENAME>.out
   ```

3. To remove all object files (`.o` files), utilize the following command:

   ```
   rm *.o
   ```

4. To erase all executable files, apply the following command:

   ```
   rm *.out
   ```

Ensure to substitute `FILENAME` with the accurate name of the code file you wish to assemble and execute.

Kindly note that these instructions presume the presence of NASM and GCC on your operating system.