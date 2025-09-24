# VeriRISCV-CPU
This project is a minimal CPU model designed to provide an in-depth understanding of how a CPU works. It is mainly aimed at beginners who are interested in exploring the fields of CPU, memory, and processors, and want to gain deeper knowledge of these concepts.
The core components of our VeriRISC processor:
### Controller: 
Generates control signals to synchronize the operations of the CPU, ensuring all components work in harmony.
### Arithmetic Logic Unit (ALU): 
The processor’s powerhouse, performing all arithmetic and logical operations. It works with the accumulator register to execute required tasks.
### Accumulator Register:
Essential for holding intermediate arithmetic and logic results, directly interfacing with the Arithmetic Logic Unit to drive operations.
### Instruction Register: 
Keeps track of the current instruction, playing a key role in decoding and execution.
### Memory:
Stores necessary instructions and data, interfacing with the CPU for efficient read/write operations.
### Multiplexor: 
Directs data from multiple sources to a single output line, optimizing data routing within the CPU.


## How to use this code:
First of all make a project in your software whatever youa re using, then add all the files in the project.
The files are:
  1. alu.sv
  2. controller.sv
  3. counter.sv
  4. cpu.sv
  5. memory.sv
  6. mux.sv
  7. opcodes.sv
  8. register.sv
  9. test_cpu.sv

After adding these files Run Synthesis and Implementations.

Lastly to perform the testing add the test files in the memory.
1. CPUtest1.dat
2. CPUtest2.dat
3. CPUtest3.dat

When you are done with settin up the project Run Simulation and keep on running untill you see, CPU Test 1 passed for test 1,CPU Test 2 passed for test 2,CPU Test 3 passed for test 3.

