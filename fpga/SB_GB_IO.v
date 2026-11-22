// See SB_IO.v for PIN_TYPE function tables

// Simulation model from /opt/oss-cad-suite/share/yosys/ice40/cells_sim.v
(* blackbox *)
module SB_GB_IO (
    inout  PACKAGE_PIN,         // User’s Pin signal name
	input  LATCH_INPUT_VALUE,   // Latches/holds the Input value
	input  CLOCK_ENABLE,        // Clock Enable common to input and output clock
	input  INPUT_CLK,           // Clock for the input registers
	input  OUTPUT_CLK,          // Clock for the output registers
	input  OUTPUT_ENABLE,       // Output Pin Tristate/Enable control
	input  D_OUT_0,             // Data 0 – out to Pin/Rising clk edge
	input  D_OUT_1,             // Data 1 - out to Pin/Falling clk edge
	output D_IN_0,              // Data 0 - Pin input/Rising clk edge
	output D_IN_1,              // Data 1 – Pin input/Falling clk edge
	output GLOBAL_BUFFER_OUTPUT // Global buffered output
);
	parameter [5:0] PIN_TYPE = 6'b000000; // See Input and Output Pin Function Tables.
	parameter [0:0] PULLUP = 1'b0;        // Enable IO Pullup (Bank 0, 1, 2 only)
	parameter [0:0] NEG_TRIGGER = 1'b0;   // Specify the polarity of all FFs in the IO to be falling edge
	parameter IO_STANDARD = "SB_LVCMOS";  // Other IO standards are supported in bank 3 only

endmodule
