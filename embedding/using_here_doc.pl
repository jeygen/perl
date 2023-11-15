#!/usr/bin/perl

use strict;
use warnings;

# Parameters for the shift register
my $width = 8;   # Width of each register
my $depth = 4;   # Number of stages in the shift register

# Open a file for writing
open(my $fh, '>', 'shift_register.sv') or die "Could not open file 'shift_register.sv' $!";

# Print the header and module declaration
print $fh <<"END_HEADER";
// SystemVerilog Shift Register
// Width: $width bits, Depth: $depth stages

module shift_register (
    input wire clk,
    input wire reset,
    input wire [$width-1:0] in,
    output wire [$width-1:0] out
);
END_HEADER

# Generate the shift register logic
print $fh "    reg [$width-1:0] stages[$depth-1:0];\n";
print $fh "    assign out = stages[$depth-1];\n\n";

print $fh "    always @(posedge clk or posedge reset) begin\n";
print $fh "        if (reset) begin\n";

# Reset loop
for (my $i = 0; $i < $depth; $i++) {
    print $fh "            stages[$i] <= 0;\n";
}

print $fh "        end else begin\n";

# Shift logic
print $fh "            stages[0] <= in;\n";
for (my $i = 1; $i < $depth; $i++) {
    print $fh "            stages[$i] <= stages[" . ($i-1) . "];\n";
}

print $fh "        end\n";
print $fh "    end\n";

# Close the module
print $fh "endmodule\n";

# Close the file
close $fh;

print "Shift register SystemVerilog code generated in 'shift_register.sv'\n";
