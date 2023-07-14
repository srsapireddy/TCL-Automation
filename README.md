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

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/f28f57de-1680-4459-8423-355b1fb24a1f)


Checking log file errors

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/0d8b92e5-6497-4707-bede-f9520872ea30)


### Edit the synthesis file so that OpenTimer can use it
Unedited synthesis file:

Errors due to "*" code

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/d3500543-bb93-4054-8774-8e69c0a9dd0b)


Errors due to "\" in code

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/16b86f0c-f56d-4f3c-8654-1da4b3ee02b7)


Count of errors found in the unedited file

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/b0699622-446d-4488-90ed-5778801e20d1)


### Edit output netlist to be used by OpenTimer
Edited synthesis file:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/8665444c-d461-494c-8fb8-9e065a0f5e35)


Output:

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/aa8898fb-afc1-4946-82a5-c22d552c53fa)


Before Editing

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/0d8311fe-9707-4bb6-bab2-efd194129cbc)


After Editing

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/e752feff-f4ee-442e-bd4c-55be50fe3f12)


As seen from the above two images, we remove the characters "\" and "*" from the original synthesis file to be usable by OpenTimer.

#### Procs:

- Procs, short for processes, are fundamental units of execution in Electronic Design Automation (EDA) tools. They represent specific tasks or operations performed during the design flow of integrated circuits. Procs encapsulate algorithms, functions, or scripts that automate various design tasks, such as synthesis, placement, routing, and verification.

### Proc Example Scripts

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/6671e839-b971-4aa2-82d7-825d6434ae97)

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/7d614e73-166b-4b0d-9cc5-69c399f1144e)


### 'set_multi_cpu_usage' proc Script

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/5140d6c9-9ed6-4778-b778-929fc28cbbb2)


### STA Using OpenTimer

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/0a6f2b14-2e9a-4296-b1e0-a90864c7f317)


### Output

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/6b9210ae-4b96-4b16-9518-a50ee3c18c72)


### Output Files Generated

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/ff4043d8-0cea-439c-9ca7-f07d09feaa6e)


### read_lib, read_verilog and reada_sdc proc Scripts

### Code
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/5fa57b34-1135-495b-8415-f59867c561c4)


### Output
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/e5642e88-5749-4489-b0b0-8d4922f6eb4b)


### Procs Folder Files
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/0a5b4448-2436-43e3-8301-e5e7ca2b2fe4)


### Constraints converted from SDC format to opentimer format

#### Script

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/4620ecb4-5eef-4540-930d-0c3518ae3753)


#### Output

![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/71fff1a1-b2e3-4022-bdd2-4f8ef2a37923)


### Proc file Scripts

#### read_lib.proc file:
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/fec58b91-0e3c-460b-bdfc-57caedc29970)


#### read_sdc.proc file:
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/585d1d8c-5ec0-4725-9e0c-a3bb3f566b3c)


#### read_verilog.proc file:
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/b715801a-8b6b-49c7-82d5-f0386a2a3308)


#### reopenStdout.proc file:
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/34cebd6e-a5e0-4b86-9059-f5913213be5f)


#### set_num_threads.proc
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/2b4f35fe-8da6-4ff7-95f1-8374a10811e1)


#### Convert set_clock_latency in SDC to arrival_time in opentimer

#### Script
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/42ab6989-c246-4bee-8e28-8ff8f57b4d5f)

#### Output
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/ac392b22-93b3-4e30-bb53-44abb11797c6)


#### Convert transition and input delay to opentimer format

#### Script
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/284e6501-147a-4198-9beb-c7c68a829549)

#### Output
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/231907f8-69bd-42b1-9291-f7ea0b22756e)


#### Script
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/dce7f6a2-89fc-471e-a347-e24df5b68d81)

#### Output
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/c6f6a050-a56f-4216-ab96-11b6499bdabc)


#### Script
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/c5a4ddec-5b39-4c28-b65b-6e35e88e9071)

#### Output
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/b8e7c68c-b9f8-4f3d-8d00-a59d33a1baad)


#### Convert output SDC constraints to opentimer format

#### Script
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/fb6397a6-eaee-4a27-aa1d-4dd397eaf349)

#### Output
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/332be2a7-2ac5-4fa1-bcc2-961df3cd79f4)


#### Script
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/4c03e1b4-dbda-445f-85f7-d6191f40972b)

#### Output
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/1e13eadb-d19a-44c6-9e7a-0ff85fb4f12c)


### Processing bussed ports and configuration file creation

#### Script to expand bussed input ports for arrival time constraints: Converting all bussed constraints to bit-blasted
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/405e1630-4a42-463c-aba5-8aa7e122efdf)


##### Bus port: Before
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/f1a1c3d7-c3eb-4581-92a9-999dad01e9ee)


##### Bit blasted port: After
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/9fb0908d-a642-4fc6-9c4e-4951014874c6)


#### Opentimer configuration file creation

#### Running the Script
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/c0662715-1b2c-4378-be81-6a0ed8824ea2)


### Checking output files
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/ee2068cd-0424-4cb6-b83f-6349823406a9)


#### SPEF file contents
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/15f57101-b0d9-4ba1-93b1-0d8a38e30c16)


#### Configuration file output
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/f3f6b073-1705-4af3-ae2d-a548ad2ea0f0)


#### Quaity of Results (QoR)

#### PRELAYOUT TIMING RESULTS

#### Script to print the values of QoR
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/05431940-804c-42e8-8bdc-ec123e100e23)



#### Output
![image](https://github.com/srsapireddy/TCL-Automation/assets/32967087/22cf60fb-eb66-4d93-b325-045bc8dca981)

Acknowledgements: Mr. Kunal Ghosh










































