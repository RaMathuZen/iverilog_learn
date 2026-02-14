`timescale 1ns/1ps

module JKFF_AsyncClear_tb;

    // 1. Declare signals
    
    reg J;
    reg  K;
    reg clk;
    reg  clr;
    
    wire Q;

    // 2. Instantiate the Unit Under Test (UUT)
    JKFF_AsyncClear uut (
        .Q(Q), 
        .J(J),
        .K(K),
        .clr(clr),
        .clk(clk)
    );

    // 3. Generate the Clock (10ns period -> 100MHz)
    always begin
        #5 clk = ~clk; 
    end

    // 4. Stimulus block
    initial begin
        // Initialize inputs
        clk = 0;
        clr = 0;       
        J = 0;
        K = 0;
       
        // Wait for global reset (if any)
        #10;
        
        J = 0; K = 1;
       
        #10; // Wait for one clock cycle
        
        J = 1; K = 0;
       
        #10;

        J = 1; K = 1;
       
        #10;
        
        J = 0; K = 0;       
       
        #10;

        $display("Simulation finished.");
        $finish;
    end

    // 5. (Optional) Create a waveform file
    initial begin
        $dumpfile("jkff_test.vcd");
        $dumpvars(0, JKFF_AsyncClear_tb);
    end

endmodule
