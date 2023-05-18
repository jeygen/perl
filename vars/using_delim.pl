#!/usr/bin/perl
use strict;
use warnings;

# Open a new Verilog file to write
open(my $verilog_file, '>', 'output.v') or die "Could not open file 'output.v' $!";

# Start of the Verilog code
my $verilog_script = <<'END_VERILOG';
// Module definition
module Test;

  // Register definitions
END_VERILOG

# Automate creation of a certain number of registers
for my $i (1..10) {
    $verilog_script .= "  reg [31:0] reg$i;\n";
}

# More of the Verilog code
$verilog_script .= <<'END_VERILOG';
  // Always block
  always @ (posedge clk) begin

    // Register assignments
END_VERILOG

# Automate creation of a certain number of assignments in always block
for my $i (1..10) {
    $verilog_script .= "    reg$i <= reg".(($i % 10) + 1).";\n";
}

# End of the Verilog code
$verilog_script .= <<'END_VERILOG';
  end
endmodule
END_VERILOG

# Write the entire Verilog script to the file at once
print $verilog_file $verilog_script;

# Close the Verilog file
close $verilog_file;
print "Verilog script 'output.v' has been created.\n";
