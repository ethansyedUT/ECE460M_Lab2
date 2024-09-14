`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2024 01:20:07 AM
// Design Name: 
// Module Name: ThreeCodeConverter
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


module ThreeCodeConverter(
    input wire x,clk,
    output wire s,v
    );
    
    reg [2:0] cur_state;
    reg [2:0] next_state;
    
    //About 
    //4-bit value(n) transmitted by x (LSB -> MSB)
    //s refelects n + 3
    //on MSB transmit: if overflow v = 1; otherwise v = 0;
    
    //Behavioral
    
    
    // Dataflow
    always @(posedge clk)
    begin
        cur_state[0] <= cur_state[1]&&~cur_state[2]&&~x
            |(~cur_state[0]&&cur_state[1]&&cur_state[2])
            |(cur_state[0]&&~cur_state[1]&&cur_state[2]);
        cur_state[1] <= (~cur_state[0]&&~cur_state[1]&&~x)
            |(~cur_state[0]&&cur_state[2]&&x)
            |(cur_state[1]&&~cur_state[2]&&x);
        cur_state[2] <= (cur_state[1]&&~cur_state[2]&&~x)
            |(~cur_state[0]&&x)
            |(~cur_state[0]&&~cur_state[1]&&cur_state[2]);
    end
    
    //output
    assign s = (~cur_state[0]&&~cur_state[1]&&~x)
    |(~cur_state[1]&&cur_state[2]&&x)
    |(cur_state[0]&&~cur_state[1]&&x)
    |(cur_state[1]&&cur_state[2]&&~x);
    assign v = cur_state[2] && cur_state[1] && cur_state[0] && x;
    

    
endmodule
