module Fibonacci (
    input            clk       ,
    input            rst_n     ,
    input            in_valid  ,
    input      [7:0] in_level  ,
    output reg       out_valid ,
    output reg [7:0] result
);

    reg [31:0] f1;
    reg [31:0] f2;
    reg  [7:0] in_level_r;

    reg [2:0] current_state ;
    reg [2:0] next_state    ;

    parameter [2:0] IDLE = 2'b00;
    parameter [2:0] CALC = 2'b01;
    parameter [2:0] COMP = 2'b10;

    // FSM start
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end
    wire done;
    always @(*) begin
        case (current_state)
            IDLE: begin
                if (in_valid) begin
                    next_state <= CALC;
                end
                else begin
                    next_state <= IDLE;
                end
            end
            CALC: begin
                if (done) begin
                    next_state <= COMP;
                end
                else begin
                    next_state <= CALC;
                end
            end
            COMP: begin
                next_state <= IDLE;
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end
    assign done = (in_level_r - 1 == 0);
    // FSM end

    // signal controller
    always @(posedge clk or rst_n) begin
        case (current_state)
            IDLE: begin
                in_level_r <= (in_valid) ? in_level : in_level_r;
            end
            CALC: begin
                in_level_r <= in_level_r - 1;
            end
            COMP: begin
                in_level_r <= 0;
            end
        endcase
    end
    always @(posedge clk or rst_n) begin
        case (current_state)
            IDLE: begin
                result    <= 0;
                out_valid <= 0;
            end
            CALC: begin
                result    <= f2;
            end
            COMP: begin
                out_valid <= 1;
            end
        endcase
    end
    always @(posedge clk or rst_n) begin
        case (current_state)
            IDLE: begin
                f1 <= 1;
                f2 <= 1;
            end
            CALC: begin
                f1 <= f1 + f2;
                f2 <= f1;
            end
        endcase
    end
    //
    
endmodule