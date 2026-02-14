// D Flip Flop - without Clear

`default_nettype none
`timescale 1ns/1ps

module DFF(output reg Q, input D, input clk);
    always@(posedge clk) begin
       Q <= D;       
    end
endmodule   
