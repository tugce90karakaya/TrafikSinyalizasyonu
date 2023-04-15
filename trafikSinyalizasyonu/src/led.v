module led(
    input clk,
    input reset,
    output reg[2:0] led
);

reg [31:0] sayici;
reg [31:0] sayici1;
reg [31:0] sayici2;

always @(posedge clk or negedge reset) begin
    if(!reset)
        sayici <= 32'd0;
    else if(sayici < 32'd48000000)
        sayici <= sayici+1;
    else 
        sayici <= 32'd0;
end 

always @(posedge clk or negedge reset) begin
    if(!reset)
        sayici1 <= 32'd0;
    else if(sayici1 < 32'd120000000)
        sayici1 <= sayici1+1;
    else 
        sayici1 <= 32'd0;
end 

always @(posedge clk or negedge reset) begin
    if(!reset)
        sayici2 <= 32'd0;
    else if(sayici2 < 32'd240000000)
        sayici2 <= sayici2+1;
    else 
        sayici2 <= 32'd0;
end

always @(posedge clk or negedge reset) begin 
    if(!reset)
        led <= 3'b111;
    else if(sayici == 32'd48000000)
        led <= 3'b011;
    else if(sayici1 == 32'd120000000)
        led <= 3'b110;
    else if(sayici2 == 32'd240000000)
        led <= 3'b101;
end

endmodule