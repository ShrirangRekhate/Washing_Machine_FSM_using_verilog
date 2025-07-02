# Washing Machine FSM in Verilog

[![Verilog](https://img.shields.io/badge/Language-SystemVerilog-blue.svg)](https://www.verilog.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## Table of Contents

* [Overview](#overview)
* [Features](#features)
* [FSM States](#fsm-states)
* [Repository Structure](#repository-structure)
* [Getting Started](#getting-started)

  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
  * [Simulation](#simulation)
* [Usage](#usage)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)

## Overview

This project implements a **Finite State Machine (FSM)** for a washing machine controller using SystemVerilog. The FSM controls the sequence of operations including door lock, water fill, detergent wash, main wash (cycle), drain, spin, and a water-only wash option (`againwash`).

## Features

* Modular **Verilog** implementation of washing machine states
* Support for manual detergent addition and optional second water wash
* Comprehensive **testbench** for functional verification
* Synthesizable code ready for FPGA/ASIC integration

## FSM States

1. **IDLE**: Waiting for `start` and `door_close` signals.
2. **FILL\_WATER**: Activates water valve until `filled` is asserted.
3. **ADD\_DETERGENT**: (Optional) Waits for `detergent_added` signal.
4. **CYCLE**: Main wash cycle runs until `cycleTO` timeout.
5. **DRAIN**: Opens drain valve until `drained` is asserted. If `againwash` is high, returns to FILL\_WATER for a water-only wash.
6. **SPIN**: Spin cycle runs until `spinTO` timeout, then returns to IDLE and asserts `done`.

## Repository Structure

```
Washing_Machine_FSM_using_verilog/
├── src/
│   ├── Washing_Machine.sv     # FSM implementation
│   └── Washingtb.sv            # Testbench
├── Images/                     # FSM diagram and waveforms
├── LICENSE                     # MIT License
└── README.md                   # Project overview
```

## Getting Started

### Prerequisites

* **Verilog/SystemVerilog simulator** (e.g., ModelSim, Icarus Verilog)
* **make** (optional)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/ShrirangRekhate/Washing_Machine_FSM_using_verilog.git
   cd Washing_Machine_FSM_using_verilog/src
   ```

### Simulation

Run the testbench using your simulator of choice:

```bash
# Example with Icarus Verilog\iverilog -g2012 -o wash_tb Washing_Machine.sv Washingtb.sv
vvp wash_tb
```

## Usage

* Modify input stimuli in `Washingtb.sv` to customize timing or add new test cases.
* View waveforms in your simulator's GUI or export to VCD:

```bash
# Dump VCD in testbench
$dumpfile("waveforms.vcd");
$dumpvars(0, tb_Washing_Machine);
```

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/my-feature`)
3. Commit your changes (`git commit -m "Add feature"`)
4. Push to the branch (`git push origin feature/my-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Contact

👤 **Shrirang Rekhate**

* Email: `your.email@example.com`
* GitHub: [ShrirangRekhate](https://github.com/ShrirangRekhate)
