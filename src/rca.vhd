library ieee;
use ieee.std_logic_1164.all;
library work;
use work.dadda_package.all;

entity rca is 
	
	Port (	A:	In	std_logic_vector(k*2-1 downto 0);--64 bit SUM BIT at the output of Dadda tree
		B:	In	std_logic_vector(k*2-2 downto 0);--63 bit       CARRY BIT at the output of Dadda tree
		Ci:	In	std_logic;
		S:	Out	std_logic_vector(k*2-1 downto 0);--64 bit
		Co:	Out	std_logic);
end rca; 

architecture STRUCTURAL of rca is

  signal STMP : std_logic_vector(k*2-2 downto 0);
  signal CTMP : std_logic_vector(k*2-1 downto 0);

  component fa
  Port ( A:	In	std_logic;
	 B:	In	std_logic;
	 Ci:	In	std_logic;
	 S:	Out	std_logic;
	 Co:	Out	std_logic);
  end component; 

begin


  CTMP(0) <= Ci;
  S(k*2-1 downto 1) <= STMP;
  Co <= CTMP(8);
  
  ADDER1: for I in 0 to 62 generate
    FAI : fa port Map (A(I+1), B(I), CTMP(I), STMP(I), CTMP(I+1)); 
  end generate ADDER1;
  
  S(0)<=A(0); --LSB of the sum bit at the output of the Dadda tree

end STRUCTURAL;
