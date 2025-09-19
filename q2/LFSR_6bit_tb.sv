module LFSR_6bit_tb;

 logic clk;
    logic rst_n;
    logic sel;
    logic [5:0] parallel_in;
    logic [5:0] parallel_out;

    // Instantiate the LFSR module
    LFSR_6bit uut (
        .clk(clk),
        .rst_n(rst_n),
        .sel(sel),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        rst_n = 0; 
        sel = 1;   
        parallel_in = 6'b000000;

        #10;
        rst_n = 1;

 
        #20; 

        sel = 0;
        parallel_in = 6'b101101; 
        #10; 
        sel = 1; 
        #20; 

        $finish;
    end



endmodule
