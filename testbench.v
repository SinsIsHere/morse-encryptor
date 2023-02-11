`timescale 1ns / 1ps
module testbench;
    reg  [4:0] IN;
    reg        clk;
    reg        rst_n;
    reg        EN;
    wire       OUT;

    Morse_Code_Encryptor DUT (
        .IN   (IN),
        .clk  (clk),
        .rst_n(rst_n),
        .EN   (EN),
        .OUT  (OUT)
    );

    always #1 clk = ~clk;

    initial begin
        IN = 0; clk = 0; rst_n = 0; EN = 0;

        #2 rst_n = 1; IN = 5'd17; EN = 1;
        #2 EN = 0;

        #30 IN = 5'd21; EN = 1;
        #2 EN = 0;

        #18 IN = 5'd1; EN = 1;
        #2 EN = 0;

        #14 IN = 5'd14; EN = 1;
        #2 EN = 0;

        #16 $finish;
    end
endmodule
