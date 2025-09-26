# Vivado Initialisation

Init a Vivado Project using Tcl file.

### Project Structure

	.
	├── constraints	[ Constraints Files ]
	│   └── constraints.xdc
	├── rtl
	│   ├── sim	[ Simulation TestBenches ]
	│   │   └── interface_tb.v
	│   └── src	[ Synthesisable Sources ]
	│       └── interface.v
	└── scripts	[ Script Files ]
	    └── init_vivado.tcl

### To launch Vivado and Initialize Project

1. Source the Vivado environment:

```bash
	source <path to vivado>/Vivado/2024.1/settings64.sh
```

Launch Vivado:

```bash
	vivado -source ./scripts/init_vivado.tcl
```
