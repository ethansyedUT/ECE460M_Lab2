`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2024 02:14:36 AM
// Design Name: 
// Module Name: ThreeCodeConverter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ThreeCodeConverter_tb;
    reg clk = 0;
    reg x;
    wire s,v;
    ThreeCodeConverter uut (.clk(clk), .x(x), .s(s), .v(v));
    
    reg [11:0] stimulus = 12'b101111001101;
    reg [3:0] count = 0;
    reg start = 1;
    
    initial begin
        #250 $finish; // Run for 250ns then terminate
    end
    
    always @(posedge clk && start)
    begin
        if(count == 12)
        begin
            start = 0;
        end else begin
            #2 // Wait 1/4 clk period
            x <= stimulus[count];
            count <= count + 1;
        end
        
    end

    
    always
    #5 clk = ~clk;
endmodule
