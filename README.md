# CHARIS-4 (Chania RISC Instruction Set v.4) Processor Pipeline Architecture in Xilinx ISE

(.vhd files are in src dir)

This project utilizes pipeline registers. For the implementation of this project, we forward the necessary signals from stage to stage for the execution of the instructions li, lw, sw, and add.

The pipelined processor logic involves the propagation of the correct signals on every clock cycle to their respective stages. However, the pipeline method may create hazards in certain cases, so two modules (forward and stall) will be used to address these issues.

The Forward module checks whether the address we want to read is the same as the address that can be used for writing within one or two cycles. The Stall module handles load instructions, as the write data is generated in the fourth cycle. Therefore, when an instruction needs to use the data loaded from the previous cycle, it must wait to avoid hazards.

## Instruction Set:

<img src="https://github.com/Amphicheiras/MultiCycle-Processor-Architecture/blob/main/media/INSTRUCTION_SET.png" alt="INSTRUCTION_SET" width="700">

## Top-Module Schematic (Single-cycle

<img src="https://github.com/Amphicheiras/MultiCycle-Processor-Architecture/blob/main/media/VHDL_TOP_MODULE_SCHEMATIC.png" alt="TOP_MODULE_SCHEMATIC" width="700">

## FSM:

For the 4th lab, we designed a finite state machine (FSM) that activates the appropriate control signals for each module, based on the instruction being executed at any given moment.

The signals it "generates" are as follows:

    RF_WrData_sel: For selecting the data to write to the register file (RF).
    ALU_func: For selecting the operation to be executed by the ALU.
    PC_sel: For choosing between the incoming instruction or the instruction from a given branch.
    PC_LdEn: For reading the instruction from the Program Counter (PC).
    RF_B_sel: For selecting a secondary register.
    ALU_Bin_sel: For selecting the second operand for the ALU.
    RF_WrEn: For writing data to the register file (RF).
    MEM_WrEn: For writing data to RAM.
    Immext: For choosing between sign extension or zero padding.

Additionally, it controls internal signals like reset and FsmState to manage the flow control of the FSM itself.

<img src="https://github.com/Amphicheiras/MultiCycle-Processor-Architecture/blob/main/media/VHDL_FSM.png" alt="FSM" width="700">

In the ResetState, the initialization of our system takes place where the PC (Program Counter) is reset to zero. All states transition to the ResetState only if the reset signal is 1. When the reset signal is cleared (reset = 0), the system transitions to the StartState, where, depending on the instruction being read, the appropriate signals are given, and it transitions either to ALUState or FinalState.

The r-type/ nandi/ addi/ ori/ beq/ bne/ sw/ sb/ lw/ lb instructions transition to ALUState so that the appropriate signals are given, and the necessary operations for these instructions are executed. Then, the beq/ bne instructions, after giving the required signals and making the PC count, transition to the FinalState. All other instructions transition to WAITSTATE, where a signal will be sent to the PC to count and move to the next instruction.

For the li/ lui/ b instructions, and when there is no instruction to execute (nop), the system transitions immediately from StartState to FinalState, after giving the signal for the PC to count and move to the next system instruction. In FinalState, we simply give the system time to move to the next instruction and initialize any necessary signals. From FinalState, it transitions back to StartState, where the next cycle of tasks begins.

## Top-Module Schematic (Multi-cycle)

<img src="https://github.com/Amphicheiras/MultiCycle-Processor-Architecture/blob/main/media/VHDL_TOP_MODULE_SCHEMATIC_MULTICYCLE.png" alt="TOP_MODULE_SCHEMATIC_MULTICYCLE" width="700">

## Simulation:

<img src="https://github.com/Amphicheiras/MultiCycle-Processor-Architecture/blob/main/media/VHDL_SIMULATIONS.png" alt="SIMULATIONS" width="700">
