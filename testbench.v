`timescale 1ps/1ps

module tb_fibonacci;

    reg        clk       ;
    reg        rst_n     ;
    reg        in_valid  ;
    reg  [7:0] in_level  ;
    wire       out_valid ;
    wire [7:0] result    ;

 
Fibonacci uut (
    .clk      (clk)       ,
    .rst_n    (rst_n)     ,
    .in_valid (in_valid)  ,
    .in_level (in_level)  ,
    .out_valid(out_valid) ,
    .result   (result)
);

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) clk=~clk;

    initial begin
        rst_n = 1'b1;
        clk   = 1'b0;
        in_valid = 1'b0;
        in_level = 8'd0;
        seed = 32'h1234_5678;
        $dumpfile("tb_fibonacci.vcd");
        $dumpvars(0, tb_fibonacci);
    end

    integer i    ;
    integer seed ;
    initial begin
        #5 rst_n = 1'b0;
        #5 rst_n = 1'b1;
        for(i=0;i<10;i=i+1)begin
            repeat (2) @(posedge clk);
            in_valid = 1;
            in_level = ($random(seed) % 'd10) +1;
            $display("data level = %d\n",in_level);
            @(posedge clk);
            in_valid = 0;
            in_level = 0;          
            while(out_valid != 1)begin
                @(posedge clk);
            end
            $display("result = %d\n\n",result);
        end

        repeat(10) @(posedge clk);
        $finish;
    end

endmodule