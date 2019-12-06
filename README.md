# ISL-2P 
## Gray Code 
The reflected binary code (RBC), also known just as reflected binary (RB) or Gray code after Frank Gray, is an ordering of the binary numeral system such that two successive values differ in only one bit (binary digit). The reflected binary code was originally designed to prevent spurious output from electromechanical switches. Today, Gray codes are widely used to facilitate error correction in digital communications such as digital terrestrial television and some cable TV systems.
</br></br>
<p align="center">
    <img src= "https://user-images.githubusercontent.com/45442173/68965773-5ab03e80-07bb-11ea-9d54-1dd9cc6c4a52.gif">
</p>
</br>


## Finite States Machine
A finite-state machine (FSM) or finite-state automaton (FSA, plural: automata), finite automaton, or simply a state machine, is a mathematical model of computation. It is an abstract machine that can be in exactly one of a finite number of states at any given time. The FSM can change from one state to another in response to some external inputs and/or a condition is satisfied; the change from one state to another is called a transition. An FSM is defined by a list of its states, its initial state, and the conditions for each transition. Finite state machines are of two types – deterministic finite state machines and non-deterministic finite state machines.  A deterministic finite-state machine can be constructed equivalent to any non-deterministic one.
<p align="center">
     <img src=https://user-images.githubusercontent.com/45442173/68966510-0d34d100-07bd-11ea-9b50-727df8417a5d.jpg>
</p>


## Ring Counter
A ring counter is a type of counter composed of flip-flops connected into a shift register, with the output of the last flip-flop fed to the input of the first, making a "circular" or "ring" structure.

There are two types of ring counters:

* A straight ring counter, also known as a one-hot counter, connects the output of the last shift register to the first shift register input and circulates a single one (or zero) bit around the ring.
* A twisted ring counter, also called switch-tail ring counter, walking ring counter, Johnson counter, or Mobius counter, connects the complement of the output of the last shift register to the input of the first register and circulates a stream of ones followed by zeros around the ring.
</br></br></br>
<p align="center">
    <img src="https://user-images.githubusercontent.com/45442173/68966706-7b799380-07bd-11ea-8256-244f320fe971.jpeg">
</p>



## "Linguagem Xylo" Combinational Logic

The practical work 1 developed by the group was based on the foundations of combinational logic, the theme was the fictional Xylo language that is based on musical notes. The work was developed using the <i>verilog</i> hardware description language in order to further tests using FPGA ( Field Programmable Gate Array)

* The file 'Alpha.v' corresponds to the description file of each part of the 7 segment display.
* The file 'Alfa_desc.v' corresponds to the test bench of the file 'Alfa.v'
* The synthesis of the description file was developed in the <i>Quartus</i>  software in which each part of the 7 segment display was declared in addition to 3 swiths that correspond in bit notation to the 7 possible notes and a separate swith for the tone.


<p align="center">
    <img src="https://user-images.githubusercontent.com/45442173/68965375-6cddad00-07ba-11ea-9050-f2a9d83a1936.png">

</p>

## "Adverbio/Adjetivo" Sequential Logic and Finite States Machine
Practical work 2 uses the concepts of sequential logic together with the concepts of finite state machines in order to classify along with practical work 1 the words adverb, adjective and comparative adjective.

* The file 'tp2.v' corresponds to the description and definition of word types using finite state machines

* The file 'tp1.v' corresponds to the first practical work

* The file 'synthesis.v' corresponds to the synthesis used in Quartus software for effective FPGA testing.

![Captura de tela de 2019-11-15 13-38-40](https://user-images.githubusercontent.com/45442173/68961220-a8737980-07b0-11ea-9ae0-4b64afab8cc2.png)