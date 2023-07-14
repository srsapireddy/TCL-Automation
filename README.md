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

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/64061bd5-cb4c-43be-a706-6c77fe5a01d0)


Creating SDC file:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/b5f0e995-1757-4dbf-a4ab-ca41598085cd)


Output:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/3c6c6fef-330a-46a5-ac7b-fc0ec3845de3)


Checking generated SDC file

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/2270c233-937c-466e-b560-b87eb3e0bb04)


SDC file for Clock:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/9a895e26-1fb9-469f-96a4-e996e937e246)


### Grepping input and output ports from all Verilog and reformatting for fixed space

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/146c0efb-ed04-46aa-848a-015d4a2b4c58)


### Input constraints generation and bits/bussed differentiation

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/fc92321b-fadf-4293-aa09-152fb5139de6)

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/2c379ef3-2419-4ccd-b859-c100766d0c11)


Output:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/9111f744-8e5d-4625-9339-a4e60a71a24b)


Final SDC:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/41a7022a-bb5f-404f-b62e-8dab1201fba6)


Output:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/a286a20c-5718-463e-a074-a83999d4e28c)


### Output constraints generation and bits/bussed differentiation

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/052b710e-7b41-4ed7-9516-7e32bc16c0b7)

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/fc903b37-298a-4ea0-9173-db3db664d52c)


Output:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/c690dd44-07fa-4f89-bd4c-af75d2573e90)



### Synthesis on Yosys
Yosys:
Yosys is the first full-featured open source software for Verilog HDL synthesis. It supports most of Verilog-2005 and is well tested with real-world designs from the ASIC and FPGA world.

Synthesis on yosys for the following RTL code:

### Memory functionality and Synthesis using Yosys Example

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/0b6e2721-7ce7-4155-a546-15f1961aec54)



Script to run memory module using Yosys:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/d91aa0e1-c03f-4c09-b2fe-53d1adc9a707)


Synthesis output:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/a6353d31-5486-41d5-b092-4c7e4420899f)


### Hierarchy check script generation

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/15c0f969-85ce-4dff-8864-d49cf65f75d9)


Hierarchy file:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/d2b4ca93-5b5c-45e7-8fd8-7dda898e1d6f)


Output:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/d338dcc0-bffe-40a2-b5e4-94efe968dcf7)


### Error handling concept in hierarchy check
When all the modules called in the top module exist:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/5b43ebfd-678c-421a-a4ba-d0f2d514c425)


Output:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/efda6bcc-d925-416c-abee-5c7d816aab5e)


### Complete script for error handling script

Checking errors in log file:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/756da7b5-68ec-49fb-a8f0-efa13614f9fb)


Script for error handling:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/34e35ffc-07ae-418f-a854-a0c90f7f2c00)


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










































