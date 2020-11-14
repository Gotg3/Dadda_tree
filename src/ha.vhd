library ieee;
use ieee.std_logic_1164.all;


entity ha is 
	port(
		A: in std_logic;
		B: in std_logic;
		S: out std_logic;
		C: out std_logic
	);
end ha;

	architecture structural of ha is
		begin
			
			S<= A XOR B;
			C<= A AND B;
		
	end structural;
	
	