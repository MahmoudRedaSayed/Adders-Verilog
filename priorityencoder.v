module priority_encoder(
			input [24:0] mantessaIn,
			input [7:0] Exponent_in,
			output reg [24:0] mantessaOut,
			output [7:0] Exponent_out
			);

reg [4:0] shift;

always @(mantessaIn)
begin
	casex (mantessaIn)
		25'b1_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx :	begin
													mantessaOut = mantessaIn;
									 				shift = 5'd0;
								 			  	end
		25'b1_01xx_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin						
										 			mantessaOut = mantessaIn << 1;
									 				shift = 5'd1;
								 			  	end

		25'b1_001x_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin						
										 			mantessaOut = mantessaIn << 2;
									 				shift = 5'd2;
								 				end

		25'b1_0001_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin 							
													mantessaOut = mantessaIn << 3;
								 	 				shift = 5'd3;
								 				end

		25'b1_0000_1xxx_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 4;
								 	 				shift = 5'd4;
								 				end

		25'b1_0000_01xx_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 5;
								 	 				shift = 5'd5;
								 				end

		25'b1_0000_001x_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 6;
								 	 				shift = 5'd6;
								 				end

		25'b1_0000_0001_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 7;
								 	 				shift = 5'd7;
								 				end

		25'b1_0000_0000_1xxx_xxxx_xxxx_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 8;
								 	 				shift = 5'd8;
								 				end

		25'b1_0000_0000_01xx_xxxx_xxxx_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 9;
								 	 				shift = 5'd9;
								 				end

		25'b1_0000_0000_001x_xxxx_xxxx_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 10;
								 	 				shift = 5'd10;
								 				end

		25'b1_0000_0000_0001_xxxx_xxxx_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 11;
								 	 				shift = 5'd11;
								 				end

		25'b1_0000_0000_0000_1xxx_xxxx_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 12;
								 	 				shift = 5'd12;
								 				end

		25'b1_0000_0000_0000_01xx_xxxx_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 13;
								 	 				shift = 5'd13;
								 				end

		25'b1_0000_0000_0000_001x_xxxx_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 14;
								 	 				shift = 5'd14;
								 				end

		25'b1_0000_0000_0000_0001_xxxx_xxxx  : 	begin						
									 				mantessaOut = mantessaIn << 15;
								 	 				shift = 5'd15;
								 				end

		25'b1_0000_0000_0000_0000_1xxx_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 16;
								 	 				shift = 5'd16;
								 				end

		25'b1_0000_0000_0000_0000_01xx_xxxx : 	begin						
											 		mantessaOut = mantessaIn << 17;
										 	 		shift = 5'd17;
												end

		25'b1_0000_0000_0000_0000_001x_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 18;
								 	 				shift = 5'd18;
								 				end

		25'b1_0000_0000_0000_0000_0001_xxxx : 	begin						
									 				mantessaOut = mantessaIn << 19;
								 	 				shift = 5'd19;
												end

		25'b1_0000_0000_0000_0000_0000_1xxx :	begin						
									 				mantessaOut = mantessaIn << 20;
								 					shift = 5'd20;
								 				end

		25'b1_0000_0000_0000_0000_0000_01xx : 	begin						
									 				mantessaOut = mantessaIn << 21;
								 	 				shift = 5'd21;
								 				end

		25'b1_0000_0000_0000_0000_0000_001x : 	begin						
									 				mantessaOut = mantessaIn << 22;
								 	 				shift = 5'd22;
								 				end

		25'b1_0000_0000_0000_0000_0000_0001 : 	begin						
									 				mantessaOut = mantessaIn << 23;
								 	 				shift = 5'd23;
								 				end

		25'b1_0000_0000_0000_0000_0000_0000 : 	begin						
								 					mantessaOut = mantessaIn << 24;
							 	 					shift = 5'd24;
								 				end
		default : 	begin
						mantessaOut = (~mantessaIn) + 1'b1;
						shift = 8'd0;
					end

	endcase
end
assign Exponent_out = Exponent_in - shift;

endmodule