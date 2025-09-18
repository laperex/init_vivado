# Vivado Initialisation - Tcl

Init a Vivado Project using Tcl file. 

## Usage

### Requirements

- Vivado 2020.2+ installed and on `$PATH`
- A supported FPGA board (e.g., Digilent Nexys A7 or Boolean)
- ModelSim or Vivado Simulator (for simulation)

### To launch Vivado and automatically set up the project:

1. **(Optional)** Source the Vivado environment:
   
```bash
	source /opt/Xilinx/Vivado/2024.1/settings64.sh
```

Launch Vivado and initialize the project:

```bash
	vivado -mode gui -source init.tcl
```

Launch Vivado After initialization:

```bash
	vivado ./build/<your project name>.xpr
```

