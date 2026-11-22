/*
From Page 83 of ICE40 Technology Library Technical Note

Table 4.1. Input Pin Function
| Pin Function Mnemonic      | PIN_TYPE[1:0] | Functional Description of Package Pin Input Operation                                                                |
| :------------------------- | :------------ | :------------------------------------------------------------------------------------------------------------------- |
| PIN_INPUT                  | 2'b01         | Simple input pin (D_IN_0)                                                                                            |
| PIN_INPUT_LATCH            | 2'b11         | Disables internal data changes on the physical input pin by latching the value.                                      |
| PIN_INPUT_REGISTERED       | 2'b00         | Input data is registered in input cell.                                                                              |
| PIN_INPUT_REGISTERED_LATCH | 2'b10         | Disables internal data changes on the physical input pin by latching the value on the input register.                |
| PIN_INPUT_DDR              | 2'b00         | Input 'DDR' data is clocked out on rising and falling clock edges. Use the D_IN_0 and D_IN_1 pins for DDR operation. |

TTable 4.2. Output Pin Function
| Pin Function Mnemonic                            | PIN_TYPE[5:2] | Functional Description of Package Pin Output Operation                               |
| :----------------------------------------------- | :------------ | :----------------------------------------------------------------------------------- |
| PIN_NO_OUTPUT                                    | 4'b0000       | Disables the output function                                                         |
| PIN_OUTPUT                                       | 4'b0110       | Simple output pin, (no enable)                                                       |
| PIN_OUTPUT_TRISTATE                              | 4'b1010       | The output pin may be tristated using the enable                                     |
| PIN_OUTPUT_ENABLE_REGISTERED                     | 4'b1110       | The output pin may be tristated using a registered enable signal                     |
| PIN_OUTPUT_REGISTERED                            | 4'b0101       | Output registered, (no enable)                                                       |
| PIN_OUTPUT_REGISTERED_ENABLE                     | 4'b1001       | Output registered with enable (enable is not registered)                             |
| PIN_OUTPUT_REGISTERED_ENABLE_REGISTERED          | 4'b1101       | Output registered and enable registered                                              |
| PIN_OUTPUT_DDR                                   | 4'b0100       | Output 'DDR' data is clocked out on rising and falling clock edges                   |
| PIN_OUTPUT_DDR_ENABLE                            | 4'b1000       | Output data is clocked out on rising and falling clock edges                         |
| PIN_OUTPUT_DDR_ENABLE_REGISTERED                 | 4'b1100       | Output 'DDR' data with registered enable signal                                      |
| PIN_OUTPUT_REGISTERED_INVERTED                   | 4'b0111       | Output registered signal is inverted                                                 |
| PIN_OUTPUT_REGISTERED_ENABLE_INVERTED            | 4'b1011       | Output signal is registered and inverted, (no enable function)                       |
| PIN_OUTPUT_REGISTERED_ENABLE_REGISTERED_INVERTED | 4'b1111       | Output signal is registered and inverted, the enable/tristate control is registered. |

*/

// Simulation model from /opt/oss-cad-suite/share/yosys/ice40/cells_sim.v
(* blackbox *)
module SB_IO (
	inout  PACKAGE_PIN,       // User’s Pin signal name
	input  LATCH_INPUT_VALUE, // Latches/holds the Input value
	input  CLOCK_ENABLE,      // Clock Enable common to input and output clock
	input  INPUT_CLK,         // Clock for the input registers
	input  OUTPUT_CLK,        // Clock for the output registers
	input  OUTPUT_ENABLE,     // Output Pin Tristate/Enable control
	input  D_OUT_0,           // Data 0 – out to Pin/Rising clk edge
	input  D_OUT_1,           // Data 1 - out to Pin/Falling clk edge
	output D_IN_0,            // Data 0 - Pin input/Rising clk edge
	output D_IN_1             // Data 1 – Pin input/Falling clk edge
);
	parameter [5:0] PIN_TYPE = 6'b000000; // See Input and Output Pin Function Tables.
	parameter [0:0] PULLUP = 1'b0;        // Enable IO Pullup (Bank 0, 1, 2 only)
	parameter [0:0] NEG_TRIGGER = 1'b0;   // Specify the polarity of all FFs in the IO to be falling edge
	parameter IO_STANDARD = "SB_LVCMOS";  // Other IO standards are supported in bank 3 only

endmodule
