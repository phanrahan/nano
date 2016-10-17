module main( CLOCK_50, LED, KEY );

input 		          		CLOCK_50;
output		     [7:0]		LED;
input 		     [1:0]		KEY;

wire reset_n;								

reg [32:0] counter;
reg  [7:0] LED;

assign   reset_n = KEY[0];

always @(posedge CLOCK_50 or negedge reset_n) begin
	if (!reset_n) begin
		counter <= 0;
		LED <= 0;
	end else begin
		counter   <= counter + 1;
		LED <= counter[32-8 +:8];
	end
end

endmodule
