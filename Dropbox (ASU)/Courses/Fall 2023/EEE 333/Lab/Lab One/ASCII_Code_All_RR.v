/** Richard Rojas' verliog code
Course: EEE 333
Professor: Olin Hartin

Objective: Code is able to convert all ASCII code to be able to 
compile 26 letters/10 numbers in 7-segment HEX LED display with bits

Date: 09/01/2023



*/

module ASCIICodes(input Kkey0, output [6:0] HexSeg4, HexSeg3, HexSeg2, HexSeg1, HexSeg0); //Parent Module (For problem 2)
reg [7:0] Message [4:0];

always @ (*) begin
  Message[4] = "H"; // this initializes Message in each pass
  Message[3] = "e";
  Message[2] = "l";
  Message[1] = "l";
  Message[0] = "o";
// using case assures a parallel structure
  case (Kkey0)
	1'b1: begin
	Message[4] = "H";
	Message[3] = "e";
  	Message[2] = "l";
  	Message[1] = "l";
  	Message[0] = "o";
	end
	1'b0: begin
	Message[4] = "R";
	Message[3] = "R";
  	Message[2] = "";
  	Message[1] = "";
  	Message[0] = ""; 
	end
      default : begin
	Message[4] = "H"; // default sets Message in every case
	Message[3] = "e";
  	Message[2] = "l";
  	Message[1] = "l";
  	Message[0] = "o";
	end
	endcase
end
ASCII27Seg SevH4 (Message[4], HexSeg4); // Instantiates of ASCII27, which is an
ASCII27Seg SevH3 (Message[3], HexSeg3);// instance of that module. Not to confuse
ASCII27Seg SevH2 (Message[2], HexSeg2);// a subroutine call in another language.
ASCII27Seg SevH1 (Message[1], HexSeg1); 
ASCII27Seg SevH0 (Message[0], HexSeg0); 

endmodule
module ASCII27Seg (input [7:0] AsciiCode, output reg[6:0] HexSeg); // Instance module (For problem 1)
	always @ (*) begin // Block will execute based on any input change
	HexSeg = 7'd0; //initialization of variable HexSeg [7 is # of bits in the decimal literal. Any value that goes to it must be in range of 0-255]
	$display("AsciiCode $b", AsciiCode); //$b is a format string to print the input into binary./ Display in simulator's console.
//Logic to conversion from ASCII to 7-segment.
// lower letters and capital letters HexSeg will correspond based on FPGA board DE10-Lite.
	case (AsciiCode)
/* A */ 8'h41: HexSeg[3] = 1;
/* a */ 8'h61: HexSeg[3] = 1;
/* B */ 8'h42: begin
	HexSeg[0] = 1; HexSeg[1] = 1; end
/* b */ 8'h62: begin
	HexSeg[0] = 1; HexSeg[1] = 1; end
/* C */ 8'h43: begin
	HexSeg[1] = 1; HexSeg[2]= 1; HexSeg[6] = 1; end
/* c */ 8'h63: begin
	HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[6] = 1; end
/* D */ 8'h44: begin
	HexSeg[0] = 1; HexSeg[5] = 1; end
/* d */ 8'h64: begin
	HexSeg[0] = 1; HexSeg[5] = 1; end
/* E */ 8'h45: begin
	HexSeg[1] = 1; HexSeg[2] = 1; end
/* e */ 8'h65: begin
	HexSeg[1] = 1; HexSeg[2] = 1; end
/* F */ 8'h46: begin
	HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[3] = 1;end
/* f */ 8'h66: begin
	HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[3] = 1;end
/* G */ 8'h47: begin
	HexSeg[4] = 1; end
/* g */ 8'h67: begin
	HexSeg[4] = 1; end
/* H */ 8'h48: begin //H, K, X are same. 
	HexSeg[0] = 1; HexSeg[3] = 1; end
/* h */ 8'h68: begin
	HexSeg[0] = 1; HexSeg[3] = 1; end
/* I */ 8'h49: begin
	HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[3] = 1;HexSeg[6] = 1; end
/* i */ 8'h69: begin
	HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[3] = 1;HexSeg[6] = 1; end
/* J */ 8'h4A: begin
	HexSeg[0] = 1; HexSeg[5] = 1; HexSeg[6] = 1; end
/* j */ 8'h6A: begin
	HexSeg[0] = 1; HexSeg[5] = 1; HexSeg[6] = 1; end
/* K */ 8'h4B: begin
	HexSeg[0] = 1; HexSeg[3] = 1; end
/* k */ 8'h6B: begin
	HexSeg[0] = 1; HexSeg[3] = 1; end
/* L */ 8'h4C: begin
	HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[6] = 1;end
/* l */ 8'h6C: begin
	HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[6] = 1;end
/* M */ 8'h4D: begin
	HexSeg[1] = 1; HexSeg[3] = 1; HexSeg[5] = 1; HexSeg[6] = 1;end
/* m */ 8'h6D: begin
	HexSeg[1] = 1; HexSeg[3] = 1; HexSeg[5] = 1; HexSeg[6] = 1;end
/* N */ 8'h4E: begin
	HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[3] = 1; HexSeg[5] = 1; end
/* n */ 8'h6E: begin
	HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[3] = 1; HexSeg[5] = 1; end
/* O */ 8'h4F: HexSeg[6] = 1; 
/* o */ 8'h6F: HexSeg[6] = 1; 
/* P */ 8'h50:  begin
	HexSeg[2] = 1; HexSeg[3] = 1; end
/* p */ 8'h70: begin
	HexSeg[2] = 1; HexSeg[3] = 1; end
/* Q */ 8'h51: begin
	HexSeg[3] = 1; HexSeg[4] = 1; end
/* q */ 8'h71: begin
	HexSeg[3] = 1; HexSeg[4] = 1; end
/* R */ 8'h52: begin
	HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[3] = 1; HexSeg[5] = 1; end
/* r */ 8'h72: begin
	HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; HexSeg[3] = 1; HexSeg[5] = 1; end
/* S */ 8'h53: begin
	HexSeg[1] = 1; HexSeg[4] = 1; end
/* s */ 8'h73: begin
	HexSeg[1] = 1; HexSeg[4] = 1; end
/* T */ 8'h54: begin
	HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; end 
/* t */ 8'h74: begin
	HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[2] = 1; end 
/* U */ 8'h55: begin
	HexSeg[0] = 1; HexSeg[6] = 1; end
/* u */ 8'h75: begin
	HexSeg[0] = 1; HexSeg[6] = 1; end
/* V */ 8'h56: begin
	HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[5] = 1;HexSeg[6] = 1; end
/* v */ 8'h76: begin
	HexSeg[0] = 1; HexSeg[1] = 1; HexSeg[5] = 1;HexSeg[6] = 1; end
/* W */ 8'h57: begin
	HexSeg[0] = 1; HexSeg[2] = 1; HexSeg[4] = 1; HexSeg[6] = 1; end
/* w */ 8'h77: begin
	HexSeg[0] = 1; HexSeg[2] = 1; HexSeg[4] = 1; HexSeg[6] = 1; end
/* X */ 8'h58: begin
	HexSeg[0] = 1; HexSeg[3] = 1; end
/* x */ 8'h78: begin
	HexSeg[0] = 1; HexSeg[3] = 1; end
/* Y */ 8'h59: begin
	HexSeg[0] = 1; HexSeg[4] = 1; end
/* y */ 8'h79: begin
	HexSeg[0] = 1; HexSeg[4] = 1; end
/* Z */ 8'h5A: begin
	HexSeg[2] = 1; HexSeg[5] = 1; end
/* z */ 8'h7A: begin
	HexSeg[2] = 1; HexSeg[5] = 1; end

//Numbers

/* 0 */ 8'h30: HexSeg[6]=1;
/* 1 */ 8'h31: begin
	HexSeg[0] = 1; HexSeg[3] = 1; HexSeg[4] = 1; HexSeg[5] = 1; HexSeg[6] = 1; end
/* 2 */ 8'h32: begin
	HexSeg[2] = 1; HexSeg[5] = 1; end
/* 3 */ 8'h33: begin
	HexSeg[4] = 1; HexSeg[5] = 1; end
/* 4 */ 8'h34: begin
	HexSeg[0] = 1; HexSeg[3] =1; HexSeg[4] =1; end
/* 5 */ 8'h35: begin
	HexSeg[1] = 1; HexSeg[4] =1; end
/* 6 */ 8'h36: begin
	HexSeg[1] = 1; end
/* 7 */ 8'h37: begin
	HexSeg[3] = 1; HexSeg[4] = 1; HexSeg[5] = 1; HexSeg[6] = 1 ; end
/* 8 */ 8'h38: HexSeg = 8'b11111111;// no segments are left off
/* 9 */ 8'h39: begin 
	HexSeg[4] = 1; end
	
	
	
//.../  //

//	turn all the bits off by default
	default : HexSeg = 8'b11111111; // default  of the variable
	endcase
	end
	endmodule
	
module Decimal27Seg(input [7:0] decimal, output reg [6:0] HexSeg); // Instance module (For problem 4)

always @(decimal) begin
    case (decimal)
	8'b00000000: HexSeg = 7'b1000000; // 0
        8'b00000001: HexSeg = 7'b1111001; // 1
        8'b00000010: HexSeg = 7'b0100100; // 2
        8'b00000011: HexSeg = 7'b0110000; // 3
        8'b00000100: HexSeg = 7'b0011001; // 4
        8'b00000101: HexSeg = 7'b0010010; // 5
        8'b00000110: HexSeg = 7'b0000010; // 6
        8'b00000111: HexSeg = 7'b0111000; // 7
        8'b00001000: HexSeg = 7'b0000000; // 8
        8'b00001001: HexSeg = 7'b0010000; // 9
        default:     HexSeg = 7'b1111111; //blank for values not between 0 to 9
        endcase
end

endmodule	

