library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.dadda_package.all;


package dadda_package is

	constant k: integer:=32;    --operand bits
	constant k_row:  integer:=33;	 --bits in the row k+1 bits
	--type array_level1 is array (0 to 16) of std_logic_vector(63 downto 0); -- matrix of layer 1
	type array_level2 is array (0 to 12) of std_logic_vector(63 downto 0); -- matrix of layer 2
	type array_level3 is array (0 to 8) of std_logic_vector(63 downto 0); -- matrix of layer 3
	type array_level4 is array (0 to 5) of std_logic_vector(63 downto 0); -- matrix of layer 4
	type array_level5 is array (0 to 3) of std_logic_vector(63 downto 0); -- matrix of layer 5
	type array_level6 is array (0 to 2) of std_logic_vector(63 downto 0); -- matrix of layer 6
	type array_level7 is array (0 to 1) of std_logic_vector(63 downto 0); -- matrix of layer 7


end package dadda_package;