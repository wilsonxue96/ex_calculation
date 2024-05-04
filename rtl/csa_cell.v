`timescale 1ns/1ps

module csa_cell(
    input [25:0] A,
    input [25:0] B,
    input [25:0] C,
    output [25:0] sum,
    output [25:0] carry
);
    assign sum = A ^ B ^ C;  // XOR for sum
    assign carry = ((A & B) | (B & C) | (A & C))<<1;  // Majority function for carry, shifted left internally
endmodule


