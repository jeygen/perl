#!/usr/bin/perl

# no vars in q mode

my $filename = "automated_counter.sv";

open(my $fh, '>', $filename) or die "Cannot open file '$filename' for writing: $!";

my $content = q{
module Adder (
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] sum
);
    assign sum = a + b;
endmodule

module Mux2to1 (
    input wire select,
    input wire [31:0] in0,
    input wire [31:0] in1,
    output wire [31:0] out
);
    assign out = (select) ? in1 : in0;
endmodule

module DFF (
    input wire clk,
    input wire reset,
    input wire [31:0] d,
    output reg [31:0] q
);
    always @(posedge clk, posedge reset)
        if (reset)
            q <= 32'd0;
        else
            q <= d;
endmodule

module ProgramCounter (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire inc,
    input wire [31:0] branchTarget,
    output wire [31:0] pcOut
);
    wire [31:0] pcNext;
    wire [31:0] pcInc;
    wire [31:0] pcBranch;

    Adder adder (.a(pcOut), .b(32'd1), .sum(pcInc));
    Mux2to1 mux (.select(enable), .in0(pcOut), .in1(pcBranch), .out(pcNext));
    DFF dff (.clk(clk), .reset(reset), .d(pcNext), .q(pcOut));

    assign pcBranch = branchTarget;
    assign pcInc = pcOut + 1;

    always @(posedge clk)
        if (inc)
            pcOut <= pcInc;
endmodule

// Testbench module or additional logic
module Testbench;
    // Testbench logic goes here
endmodule

// Instantiate the program counter module and testbench
ProgramCounter pc (.clk(clk), .reset(reset), .enable(enable), .inc(inc), .branchTarget(branchTarget), .pcOut(pcOut));
Testbench tb;
};

print $fh $content;

close($fh);

print "File '$filename' created successfully.\n";
