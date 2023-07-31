# Verilog Code for EEC 180 - UC Davis

## Task 1 (task1.v) 

This Verilog module, named `task1`, performs a multiply-accumulate (MAC) operation, a key technique used in many signal processing applications, including filters and transforms.

This module includes several I/O elements:

- The inputs `x` and `y`, both 8-bit signed, are the operands to be multiplied.
- Three control signals (`clk`, `macc_clear`) serve as inputs.
- The 19-bit signed output `s` stores the result of the MAC operation.

Internally, the `task1` module operates synchronously to the positive edge of the `clk` signal. Here's a rough outline of its operations:

- The module performs a multiplication of `x` and `y` when the `macc_clear` signal is high (1), and the result is stored in `s`.
- When `macc_clear` is low (0), it carries out an accumulation operation where the product of `x` and `y` is added to the existing value in `s`.
- By doing so, the module can perform multiple multiply-accumulate operations over successive clock cycles.

Overall, this module forms a key part of a digital system used to carry out MAC operations. It effectively uses control signals to switch between multiplication and accumulation operations. The design of this module allows it to handle complex tasks efficiently, making it a valuable asset in a range of signal processing applications.

## Task 2 (task2.v)

This system has been named `task2` and it uses various components such as clocks, multiplexers, digital flip flops, and memory (RAM) to perform operations on matrices A and B and store the results in matrix C. All these matrices are arrays of 8-bit signed integers with 64 elements each.

Here is a brief description of the main components:

1. **Inputs and Outputs**: `task2` has three inputs: `clk` (a clock signal), `start` (a signal to start processing), and `reset` (a signal to reset the system). The module also has two outputs: `done` (a signal indicating the completion of a task), and `clock_count` (a count of the number of clock cycles since the start signal was activated).

2. **Matrices**: `matrixA`, `matrixB`, and `matrixC` are arrays of signed integers. `matrixA` and `matrixB` are the input matrices for computation, while `matrixC` is the output matrix.

3. **MAC (Multiply-Accumulate) Units**: `math` is an instance of a MAC unit. It performs multiplication and accumulation on the elements of matrices A and B.

4. **RAM**: `RAMOUTPUT` is a memory unit that stores the output of the computations.

5. **Index Variables**: `i`, `j`, and `k` are the index variables for handling the elements of the matrices during computation. Similarly, `prev_i` and `prev_j` are the variables to hold the previous state of `i` and `j` respectively.

6. **Control Logic**: The control logic is implemented using several `always` blocks. These blocks respond to various signals, such as the rising edge of the clock signal or changes in `clock_count`, and update the system state accordingly. For example, the control logic decides when to start or reset computations, increment the clock count, and select the inputs for the multiplexer.

7. **Initialization**: The `initial begin` block is used to read data from two files into `matrixA` and `matrixB`.

In essence, this code defines a system that uses MAC operations to compute matrix multiplications. It leverages various digital logic components, and it controls the flow of operations based on clock cycles and input signals. The operation is performed in a column-major order, i.e., it's executed along the columns for each row.

## Task 3 (task3.v)

This system has been named `task3` and it uses various components such as clocks, multiplexers, digital flip flops, and memory (RAM) to perform operations on matrices A and B and store the results in matrix C. All these matrices are arrays of 8-bit signed integers with 64 elements each.

Here is a brief description of the main components:

1. **Inputs and Outputs**: `task3` has three inputs: `clk` (a clock signal), `start` (a signal to start processing), and `reset` (a signal to reset the system). The module also has two outputs: `done` (a signal indicating the completion of a task), and `clock_count` (a count of the number of clock cycles since the start signal was activated).

2. **Matrices**: `matrixA`, `matrixB`, and `matrixC` are arrays of signed integers. `matrixA` and `matrixB` are the input matrices for computation, while `matrixC` is the output matrix.

3. **MAC (Multiply-Accumulate) Units**: `math1` and `math2` are instances of a MAC unit. They perform multiplication and accumulation on the elements of matrices A and B.

4. **Flip Flop**: `dff` is a D flip-flop that takes `mac2` as an input and provides `dff_out` as an output.

5. **Multiplexer**: `mux` is a 2:1 multiplexer that takes `mac` and `dff_out` as inputs and provides `out` as an output based on the value of `mux_select`.

6. **RAM**: `RAMOUTPUT` is a memory unit that stores the output of the computations.

7. **Control Logic**: The control logic is implemented using several `always` blocks. These blocks respond to various signals, such as the rising edge of the clock signal or changes in `clock_count`, and update the system state accordingly. For example, the control logic decides when to start or reset computations, increment the clock count, and select the inputs for the multiplexer.

8. **Initialization**: The `initial begin` block is used to read data from two files into `matrixA` and `matrixB`.

## Supplemental Modules

### dflipflop.v 
The D flip-flop module takes a 19-bit signed input `in` and a clock signal `clk`. On every positive edge of the `clk` signal, the value of `in` is stored and output on `out`.

### mac.v 
This Verilog code defines a Multiply-Accumulate (MAC) module. The module takes two 8-bit signed inputs `x` and `y`, a clear signal `macc_clear`, and a clock signal `clk`. On every positive edge of the `clk` signal, the product of `x` and `y` is either stored directly into `s` (when `macc_clear` is true) or added to the current value of `s` (when `macc_clear` is false). The output `s` is a 19-bit signed register.

### mux21.v 
This Verilog code defines a 2-to-1 multiplexer (mux21) module. The module takes two 19-bit signed inputs `in1` and `in2`, a single-bit selector `s`, and a clock signal `clk`. On every positive edge of the `clk` signal, the output `out` is assigned the value of either `in2` or `in1`, based on the value of the selector `s`. If `s` is true (or 1), the output is `in2`; otherwise, the output is `in1`. 

### ram.v 
This Verilog code defines a module for a simple random-access memory (RAM) with 64 cells, each capable of storing a 19-bit value. The RAM is controlled by a clock signal `clk`, a write-enable signal `write_enable`, a 7-bit `address`, and an 19-bit `data_in`. The output `data_in` returns the data from the memory cell at the addressed location. On the positive edge of each `clk` signal, if `write_enable` is high (1), the module writes the data at `data_in` to the RAM cell at the location specified by `address`, and the content at that location is sent to `data_out`. A display statement is also printed to indicate the current memory address and data out value. On the other hand, if `write_enable` is low (0), the data from `data_in` is written to the location specified by `address-1`. This structure essentially creates a single port RAM that has separate read and write operations.
