module Dec27_testbench(); //For problem 3
reg [7:0] AsciiCode;
wire [6:0] HexSeg;
ASCII27Seg A1 (AsciiCode, HexSeg);

 // Testbench Clock (optional, only if you want to visualize transitions)
    reg clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Create a clock of period 10 time units
    end

    initial begin
        for (AsciiCode = 8'h30; AsciiCode <= 8'h39; AsciiCode = AsciiCode + 1'b1) begin
            #10; // Pause for 10 time units between each input
        end

        $stop; // Stop the simulation after all tests
    end

    // Display outputs
    initial begin
        $monitor("Time: %0d, ASCII Code: %s, HexSeg: %b", $time, AsciiCode, HexSeg);
    end
endmodule

/*module Decmial27Seg_tb();
	reg [7:0] decimalValue;
   	wire[6:0] HexSeg;
    
    // Instantiate Dec27Seg
    Decimal27Seg dec_instance (decimalValue, HexSeg);
    
    // Testbench Clock (optional, only if you want to visualize transitions)
    reg clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Create a clock of period 10 time units
    end

    initial begin
        for (decimalValue = 8'b00000000; decimalValue <= 8'b00001001; decimalValue = decimalValue + 1'b1) begin
            #10; // Pause for 10 time units between each input
        end
        $stop; // Stop the simulation after all tests
    end

    // Display outputs
    initial begin
        $monitor("Time: %0d, Decimal Value: %d, HexSeg: %b", $time, decimalValue, HexSeg);
    end
endmodule */

module dec_numb_tb(); //For problem 4
reg [7:0] Decimal; 
wire [6:0] HexSeg;
Decimal27Seg dec_instance(Decimal, HexSeg);
initial begin 
Decimal = 8'h0; #10; // Start with decimal value 0
    Decimal = 8'h1; #10; // Show decimal value 1
    Decimal = 8'h2; #10; // Show decimal value 2
    Decimal = 8'h3; #10; // Show decimal value 3
    Decimal = 8'h4; #10; // Show decimal value 4
    Decimal = 8'h5; #10; // Show decimal value 5
    Decimal = 8'h6; #10; // Show decimal value 6
    Decimal = 8'h7; #10; // Show decimal value 7
    Decimal = 8'h8; #10; // Show decimal value 8
    Decimal = 8'h9; #10; // Show decimal value 9

    $stop; // Stop the simulation after displaying all numbers
end

// Monitor to display the results in the simulation console
initial begin
    $monitor("At time %0d: Decimal=%h -> HexSeg=%b", $time, Decimal, HexSeg);
end
endmodule