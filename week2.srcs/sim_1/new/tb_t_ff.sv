`timescale 1ns/1ps

module tb_t_ff;

// t_ff Inputs
reg   rstn                                 = 0 ;
reg   clk                                  = 0 ;
reg   t                                    = 0 ;
// t_ff Outputs
wire  q                                    ;
initial
begin
    forever #5  clk=~clk;
end
initial
begin
    #10 rstn  =  1;
end

t_ff  u_t_ff (
    .rstn                    ( rstn   ),
    .clk                     ( clk    ),
    .t                       ( t      ),

    .q                       ( q      )
);

initial
begin
t=1;
#10;
t=0;
#10;
t=1;
#100;

    $finish;
end

endmodule