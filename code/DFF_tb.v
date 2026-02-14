`timescale 1ns/1ps

module DFF_tb;

    // 1. Declare signals
    reg D;
    reg clk;
    wire Q;

    // 2. Instantiate the Unit Under Test (UUT)
    DFF uut (
        .Q(Q), 
        .D(D), 
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
        D = 0;

        // Wait for global reset (if any)
        #10;
        
        // Test Case 1: Set D to 1
        D = 1;
        #10; // Wait for one clock cycle
        
        // Test Case 2: Set D back to 0
        D = 0;
        #10;
        
        // Test Case 3: Rapid changes (D changes between clock edges)
        #2 D = 1;
        #2 D = 0;
        #10;

        $display("Simulation finished.");
        $finish;
    end

    // 5. (Optional) Create a waveform file
    initial begin
        $dumpfile("dff_test.vcd");
        $dumpvars(0, DFF_tb);
    end

endmodule
