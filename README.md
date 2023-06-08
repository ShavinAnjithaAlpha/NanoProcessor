# NanoProcessor
### this 4-bit nano-processor can execute 14-bit instructions written in the machine language

#### Here the RTL eloborated design of the extended nano processor
![PROCESSOR_RTL](https://github.com/shavinanjitha2002/NanoProcessor/assets/85817726/e462f98a-e673-4db4-87b0-8dfb335e9dcc)

### There is 14-bit ISA for this nanoprocessor with basic operations.
| Op Code (4-bit)  | Operation |
| ------------- | ------------- |
|  00 00 | ADD  |
|  00 01 | NEG  |
|  00 10 | MOVI  |
|  00 11 | JZR  |
|  01 00 | AND  |
|  01 01 | OR  |
|  01 10 | NOT  |
|  01 11 | XOR  |
|  11 00 | EQUAL (A = B)  |
|  11 01 | LESS THAN (A < B)  |
|  11 10 | GEATER THAN (A > B)  |
|  11 11 | NOT EQUAL (A != B)  |
|  10 00 | MUL (multiplication)  |
|  10 01 |  LEFT SHIFT |
|  10 10 |  RIGHT SHIFT |
|  10 11 | RGT (Regsietr Transfer) |


Basic Structure of the instruction of the ISA:
- first 4-bit  ->   Op Code
- second 3-bit  ->  First register address
- third 3-bits  ->  Second regsiter address
- final 4-bit  -> immediate value/jumo address
