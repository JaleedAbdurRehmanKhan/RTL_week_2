`timescale 1ns/1ps

module freq_div (
    input clk_100_mhz, rstn,
    output logic clk_25_mhz
);

logic counter;

always_ff @( posedge clk_100_mhz,negedge rstn  ) begin 
    if(!rstn) begin clk_25_mhz <= 0; counter <=0; end
    else  if (counter ==1 )begin
        clk_25_mhz <= ~clk_25_mhz;
        counter <= 0; 
    end
    else begin
          counter <= counter +1; 
          clk_25_mhz <= clk_25_mhz;
    end
    
end

    
endmodule