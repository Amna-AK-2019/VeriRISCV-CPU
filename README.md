# VeriRISCV-CPU
This project is a minimal CPU model designed to provide an in-depth understanding of how a CPU works.

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
