# ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS

## Author: Srinivas Rahul Sapireddy
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![License: Zlib](https://img.shields.io/badge/License-Zlib-lightgrey.svg)](https://opensource.org/licenses/Zlib)

A User Interface (UI) that will take RTL netlist & SDC constraints as an input, and will generate sythnesized netlist & pre-layout timing report as an output. It uses Yosys open-source tool for synthesis and Opentimer to generate pre-layout timing reports.

### The task is to take a User Interface to take an Excel file as an input and provide the output as a datasheet.

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/f74d1cd1-95cb-4f3a-a092-fd909c91c6d2)



### A command that passes a .csv file from UNIX shell to TCL script.
#### It checks for the following conditions and responds as shown below:
1. CSV file not provided
2. Incorrect CSV file
3. "-help" for user guidance

### Checking the contents of the CSV file

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/554b39a1-d4f2-4e05-bed0-ad3a53e10260)



### Checking if the CSV file is provided or provided.

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/85eabafe-a4de-4053-9135-a719edf8a476)


Output:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/f7192ee6-ced2-4356-a7bf-f9f18edd800c)



### Checking incorrect CSV file

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/08f26ec8-2d37-4e0b-b110-c0d719051cb3)


Output:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/34fc3c77-486e-446a-8c54-d7528a9defd4)



### Creating “-help” for user guidence

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/895bdb81-2bf1-41d7-b6fe-29d924605e0a)


Output:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/9e4c75ec-1b14-4b90-bf07-20e94ee89a4c)


### Variable Creation and Processing Constraints from CSV 

Tasks:

1. Autocreation of Variables
2. Check if directories and files mentioned exist or not
3. Read constraints file and covert to SDC format

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/01908d3d-5411-44b9-b28f-892cbef37e7c)


Script to create variables: 

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/217bc9e2-7eaa-4685-b770-631f798df68f)


### Checking the auto-creation of the variables 

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/b81cef52-8e2f-4e90-b292-2182d0aa6692)



### Convert the constraints.csv file to a matrix object.

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/6bf05698-7bf5-4744-9dc8-0bc64d4a8d3b)


Output:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/17b0bb5f-c9f5-42ed-a12a-969f93872ea4)



### Computing row and column numbers

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/6c076346-dc2d-4fc3-b7d1-5d5a210dc6e5)


Output:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/fc9e8a4b-b04b-414e-a830-e53685719c2a)


### Creating complete clock constraints

#### Processing clock and input constraints
Task: Convert contraints.csv file into SDC format
Outputs:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/45d28de5-f209-4368-9622-7e7ac2cb18a6)

Creating SDC file:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/b2f4c8bd-f31f-4ed1-9cde-55b01ee2eefb)

Output:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/1fbe7013-7af1-423a-9600-e2ab499d743a)

Checking generated SDC file

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/83be973f-fb90-422f-9a16-f216fc0e457d)

SDC file for Clock:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/159e4218-4d80-4584-9cb5-cb934e9a56a4)

### Grepping input and output ports from all Verilog and reformatting for fixed space

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/e950c05b-682a-4ea1-952d-1c6fa8772c9e)

### Input constraints generation and bits/bussed differentiation

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/4e5e9b2a-f391-4dc6-b066-de94b8a3ee8b)
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/48f652ad-4161-4e3b-90b0-d7acfa75eed8)

Output:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/b8d63339-1240-4cc7-ba26-8f071086091a)

Final SDC:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/e5b9e025-4c12-4c40-9c31-f2ae84558f75)

Output:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/2e04f74b-b253-4a51-99c0-964f515c7806)

### Output constraints generation and bits/bussed differentiation

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/53c6f531-f7ad-499c-88ba-48751dadbc76)
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/08a48638-3816-4cf4-9024-ff48885effe3)

Output:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/b909a594-02f7-4596-969c-86a1fcc7aae8)


### Synthesis on Yosys
Yosys:
Yosys is the first full-featured open source software for Verilog HDL synthesis. It supports most of Verilog-2005 and is well tested with real-world designs from the ASIC and FPGA world.

Synthesis on yosys for the following RTL code:

### Memory functionality and Synthesis using Yosys Example

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/ce9fa6a8-a91d-44d5-a44f-42c1dbfd6069)

Script to run memory module using Yosys:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/a744bb95-8dc4-4885-9dcf-bfaf469b79d6)

Synthesis output:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/26230544-1337-44ef-a255-76fb9c9cb17f)

### Hierarchy check script generation

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/d3868daa-1b7e-4829-bb6d-e9d0e45084df)

Hierarchy file:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/57f77903-0cc5-4674-acd8-076ee4926371)

Output:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/0378ffc8-ea3c-4412-846c-c96029a9e377)

### Error handling concept in hierarchy check
When all the modules called in the top module exist:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/6a8b3afa-6570-424c-9666-7df427265723)

Output:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/9cf877c8-4869-4cb5-bd18-3bd5f98930e2)

### Complete script for error handling script

Checking errors in log file:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/0b4cb5ce-5d4c-45dd-a875-1ef69fdb8507)

Script for error handling:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/bde4d8cf-a260-4419-857e-3bbe5968fb63)

### Synthesis script creation: Running synthesis on Yosys
#### To run STA analysis on OpenTimer

OpenTimer tool:
OpenTimer is a new static timing analysis (STA) tool to help IC designers verify the circuit timing quickly. It is developed completely from the ground up using C++17 to support parallel and incremental timing efficiently. Key features are:

1. Industry standard format (.lib, .v, .spef, .sdc) support
2. Graph- and path-based timing analysis
3. Parallel incremental timing for fast-timing closure

Generating log file

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/f62de66a-91c4-4e21-9377-5bd6829f838f)

Checking log file errors

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/ece9c547-52ea-4838-85bb-d81010fe09c0)

### Edit the synthesis file so that OpenTimer can use it
Unedited synthesis file:

Errors due to "*" code

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/457d0aa1-e70a-47a2-b07d-b88747ae839a)

Errors due to "\" in code

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/e66a03d1-596a-405c-bfd4-d541e375e07a)

Count of errors found in the unedited file

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/597d2e46-da58-4c13-839c-0596308469f2)

### Edit output netlist to be used by OpenTimer
Edited synthesis file:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/4c3bf7d0-4fa6-4339-baee-61f8d4dccea1)

Output:

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/d4b2e73f-6bc9-4db2-9db0-53b1ce115436)

Before Editing

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/06e55962-6d10-448a-b127-d9d7b94a0af3)

After Editing

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/2203350b-8631-44a5-8172-c368882377b8)

As seen from the above two images, we remove the characters "\" and "*" from the original synthesis file to be usable by OpenTimer.

#### Procs:

- Procs, short for processes, are fundamental units of execution in Electronic Design Automation (EDA) tools. They represent specific tasks or operations performed during the design flow of integrated circuits. Procs encapsulate algorithms, functions, or scripts that automate various design tasks, such as synthesis, placement, routing, and verification.

### Proc Example Scripts

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/c5f535df-12db-4ff6-9022-2e1a4dfb8df9)
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/d57ae74e-c265-4218-917b-d208d98593bc)

### 'set_multi_cpu_usage' proc Script

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/a60563e2-ce66-4225-a897-0f5b170c1eeb)

### STA Using OpenTimer

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/6350f0dc-9fc9-43a0-af42-a53885f93cb8)

### Output

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/9608996b-946e-4e0b-95b9-624b94b95eb7)

### Output Files Generated

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/5254166a-1f09-4d37-8826-5cfd092b3652)

### read_lib, read_verilog and reada_sdc proc Scripts

### Code
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/caf09221-5233-4772-8d4a-33ce2d700fd6)

### Output
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/f15da641-0174-4865-aa2a-d60beaabcea3)

### Procs Folder Files
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/685f75f3-2f4f-44ad-adb6-c479606d4f7c)

### Constraints converted from SDC format to opentimer format

#### Script

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/415ffcdd-439e-4f6f-95fc-7be68c0c60c8)

#### Output

![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/e0404b1c-9050-4ddd-b729-cc65a11851b6)

### Proc file Scripts

#### read_lib.proc file:
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/dca9a668-a670-4e81-9c2c-c95bcd14891b)

#### read_sdc.proc file:
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/681f21d4-f886-429a-b80d-785dbd25c29d)

#### read_verilog.proc file:
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/41613170-d75f-471f-87dc-27d3a3a41238)

#### reopenStdout.proc file:
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/0405bbd4-3af1-4f30-b7be-33ff869c1c77)

#### set_num_threads.proc
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/3cea8144-a1e3-44f6-93a8-2409829f1cb0)

#### Convert set_clock_latency in SDC to arrival_time in opentimer

#### Script
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/84470d0a-3791-4a17-a21f-1ee0606607c9)
#### Output
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/a49d2c59-a318-4a6c-8269-b9696fe7e585)

#### Convert transition and input delay to opentimer format

#### Script
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/de6fcb65-dce5-47b8-8b75-fcb112c0470a)
#### Output
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/95afd981-b3fa-48b0-b9c9-5db2a2fa7bf7)

#### Script
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/adaf5e7b-e537-4593-b3fc-3a82d62af220)
#### Output
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/080f3dca-3ab0-48cb-be95-33b16c21193c)

#### Script
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/67d10e89-6f0f-42c9-84d3-110ac370ed5b)
#### Output
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/10de8d5c-bb1c-4e4f-a03d-26fdee768c15)

#### Convert output SDC constraints to opentimer format

#### Script
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/f0be3ebc-8ffa-4722-af51-55cd1cf4a4c8)
#### Output
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/dbbf00df-5b37-4662-b623-88de24ef5623)

#### Script
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/d445f029-aae4-4cbe-98a7-ac1f96206d81)
#### Output
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/7d00f96e-9a17-4773-bad8-efac0dbaee86)

### Processing bussed ports and configuration file creation

#### Script to expand bussed input ports for arrival time constraints: Converting all bussed constraints to bit-blasted
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/41cd8606-e12f-49b5-a659-071638dbc1a3)

##### Bus port: Before
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/22e52cb1-5736-4433-bcc5-eb4a6ba352c5)

##### Bit blasted port: After
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/e0f864f9-8479-49d6-98fa-c423db124917)

#### Opentimer configuration file creation

#### Running the Script
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/ca1e7e06-1860-4df2-978a-0f27aec4f8d8)

### Checking output files
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/d0535daa-6b77-42b1-82f0-dbc1a9b9c39c)

#### SPEF file contents
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/0fd0d2dd-e9db-4dc1-adbc-7d105265fbb1)

#### Configuration file output
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/3ac96623-0910-4488-b60e-2c33b64bd310)

#### Quaity of Results (QoR)

#### Script to print the values of QoR
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/def6c41e-5c34-411c-8cfb-fef0bdb0eafc)
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/6b7d7469-abb7-454d-b014-6de06ef89423)

#### Output
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/e91a31a7-6590-40d1-bb24-df528fd16df2)

#### PRELAYOUT TIMING RESULTS

#### Script to print the values of QoR
![image](https://github.com/srsapireddy/ADVANCED-SCRIPTING-TECHNIQUES-IN-VLSI-DESIGN-AND-SYNTHESIS/assets/32967087/0c6b8ed2-5a5e-4d74-b612-239deb23aee1)


#### Output
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/22cf60fb-eb66-4d93-b325-045bc8dca981)

Acknowledgements: Mr. Kunal Ghosh










































