# NanoProcessor
### this nano-processor can execute 18-bit instructions written in the machine language and has 16 different instructions

#### Here the RTL eloborated design of the extended nano processor
![PROCESSOR_RTL](https://github.com/shavinanjitha2002/NanoProcessor/assets/85817726/e462f98a-e673-4db4-87b0-8dfb335e9dcc)

### There is 18-bit ISA for this nanoprocessor with basic operations.
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
- final 8-bit  -> immediate value/jumo address

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

Install the Xilinx Vivado Hardware Design Software

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/your_username_/Project-Name.git](https://github.com/shavinanjitha2002/NanoProcessor
   ```

2. Open the project with Vivado by double clicking the NanoProcessor.xpr file

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Contributors -->
## Contributors

 - Shavin Anjitha Chandrawansha (shavin.21@cse.mrt.ac.lk)
 - Tharusha Dinujaya (tharushad.21@cse.mrt.ac.lk)

Project Link: https://github.com/shavinanjitha2002/NanoProcessor



<p align="right">(<a href="#readme-top">back to top</a>)</p>
