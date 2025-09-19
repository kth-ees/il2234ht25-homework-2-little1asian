module LFSR_6bit (
  input  logic clk, rst_n,
  input  logic sel,
  input  logic [5:0] parallel_in,
  output logic [5:0] parallel_out
);
  logic [5:0] lfsr_reg, lfsr_next;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            lfsr_reg <= 6'b0;
        else if (sel)
            lfsr_reg <= lfsr_next;
        else
            lfsr_reg <= parallel_in;
    end

    always_comb begin
        lfsr_next[5] = lfsr_reg[4];
        lfsr_next[4] = lfsr_reg[3];
        lfsr_next[3] = lfsr_reg[2] ^ lfsr_reg[5];
        lfsr_next[2] = lfsr_reg[1];
        lfsr_next[1] = lfsr_reg[0] ^ lfsr_reg[5];
        lfsr_next[0] = lfsr_reg[5];
    end

    assign parallel_out = lfsr_reg;
endmodule

