module blinky (
    input clk_50mhz,

    input sw6,

    output led0,
    output led1,
    output led2,
    output led3,
    output led4,
    output led5,
    output led6,
    output led7
);

    SB_GB clk_gb (
        .USER_SIGNAL_TO_GLOBAL_BUFFER(clk_50mhz),
        .GLOBAL_BUFFER_OUTPUT(clk)
    );

    localparam BITS = 8;
    localparam LOG2DELAY = 21;

    reg [BITS+LOG2DELAY-1:0] counter = 0;
    reg [BITS-1:0] outcnt;

    always @(posedge clk) begin
	    counter <= counter + 1;
	    if (sw6 == 1)
		    outcnt <= 1<<((counter >> LOG2DELAY)%8);
	    else
		    outcnt <= (1<<7)>>((counter >> LOG2DELAY)%8);
    end

    assign {led0, led1, led2, led3, led4, led5, led6, led7} = outcnt;
endmodule
