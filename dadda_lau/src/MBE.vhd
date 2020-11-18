library ieee;
use ieee.std_logic_1164.all;
library work;
use work.dadda_package.all;

entity MBE is
port(

	pp1: in std_logic_vector(k downto 0); --33 bit input, row 1
	pp2: in std_logic_vector(k downto 0); --33 bit input
	pp3: in std_logic_vector(k downto 0); --33 bit input
	pp4: in std_logic_vector(k downto 0); --33 bit input
	pp5: in std_logic_vector(k downto 0); --33 bit input
	pp6: in std_logic_vector(k downto 0); --33 bit input
	pp7: in std_logic_vector(k downto 0); --33 bit input
	pp8: in std_logic_vector(k downto 0); --33 bit input
	pp9: in std_logic_vector(k downto 0); --33 bit input
	pp10: in std_logic_vector(k downto 0); --33 bit input
	pp11: in std_logic_vector(k downto 0); --33 bit input
	pp12: in std_logic_vector(k downto 0); --33 bit input
	pp13: in std_logic_vector(k downto 0); --33 bit input
	pp14: in std_logic_vector(k downto 0); --33 bit input
	pp15: in std_logic_vector(k downto 0); --33 bit input
	pp16: in std_logic_vector(k downto 0); --33 bit input
	pp17: in std_logic_vector(k-1 downto 0); --32 bit input row 17
	
	s1: in std_logic; -- sign pp1
	s2: in std_logic;
	s3: in std_logic;
	s4: in std_logic;
	s5: in std_logic;
	s6: in std_logic;
	s7: in std_logic;
	s8: in std_logic;
	s9: in std_logic;
	s10: in std_logic;
	s11: in std_logic;
	s12: in std_logic;
	s13: in std_logic;
	s14: in std_logic;
	s15: in std_logic;
	s16: in std_logic;
	s17: in std_logic; -- sign pp17
		
	prod: out std_logic_vector(k*2-1 downto 0) -- 64 
);
end MBE;

architecture structural of MBE is 

	component dadda_tree
	port(
	pp1: in std_logic_vector(k downto 0); --33 bit input, row 1
	pp2: in std_logic_vector(k downto 0); --33 bit input
	pp3: in std_logic_vector(k downto 0); --33 bit input
	pp4: in std_logic_vector(k downto 0); --33 bit input
	pp5: in std_logic_vector(k downto 0); --33 bit input
	pp6: in std_logic_vector(k downto 0); --33 bit input
	pp7: in std_logic_vector(k downto 0); --33 bit input
	pp8: in std_logic_vector(k downto 0); --33 bit input
	pp9: in std_logic_vector(k downto 0); --33 bit input
	pp10: in std_logic_vector(k downto 0); --33 bit input
	pp11: in std_logic_vector(k downto 0); --33 bit input
	pp12: in std_logic_vector(k downto 0); --33 bit input
	pp13: in std_logic_vector(k downto 0); --33 bit input
	pp14: in std_logic_vector(k downto 0); --33 bit input
	pp15: in std_logic_vector(k downto 0); --33 bit input
	pp16: in std_logic_vector(k downto 0); --33 bit input
	pp17: in std_logic_vector(k-1 downto 0); --32 bit input row 17
	
	s1: in std_logic; -- sign pp1
	s2: in std_logic;
	s3: in std_logic;
	s4: in std_logic;
	s5: in std_logic;
	s6: in std_logic;
	s7: in std_logic;
	s8: in std_logic;
	s9: in std_logic;
	s10: in std_logic;
	s11: in std_logic;
	s12: in std_logic;
	s13: in std_logic;
	s14: in std_logic;
	s15: in std_logic;
	s16: in std_logic;
	s17: in std_logic; -- sign pp17

	out1: out std_logic_vector(k*2-1 downto 0); --64 bit out
	out2: out std_logic_vector(k*2-2 downto 0) --63 bit out
	
	
	);
	end component;
	
	component rca 
	port (	
		A:	In	std_logic_vector(k*2-2 downto 0);--63 bit SUM BIT at the output of Dadda tree
		B:	In	std_logic_vector(k*2-2 downto 0);--63 bit       CARRY BIT at the output of Dadda tree
		Ci:	In	std_logic:='0';
		S:	Out	std_logic_vector(k*2-2 downto 0);--63 bit
		Co:	Out	std_logic
		);
	end component;
	
	signal out1s: std_logic_vector(k*2-1 downto 0); --64 bit out TO A IN 
	signal out2s: std_logic_vector(k*2-2 downto 0); --63 bit out TO B IN
	signal cis: std_logic:='0';
	signal cos: std_logic;
	signal prods: std_logic_vector(k*2-2 downto 0); -- 63 bit 
	
	begin
	
	dadda: dadda_tree
	port map( 
	pp1=>pp1,
	pp2=>pp2,
	pp3=>pp3,
	pp4=>pp4,
	pp5=>pp5,
	pp6=>pp6,
	pp7=>pp7,
    pp8=>pp8,
    pp9=>pp9,
    pp10=>pp10,
    pp11=>pp11,
    pp12=>pp12,
    pp13=>pp13,
    pp14=>pp14,
    pp15=>pp15,
    pp16=>pp16,
    pp17=>pp17,
	
	s1=>s1,
	s2=>s2,
	s3=>s3,
	s4=>s4,
    s5=>s5,
    s6=>s6,
    s7=>s7,
    s8=>s8,
    s9=>s9,
    s10=>s10,
    s11=>s11,
    s12=>s12,
    s13=>s13,
    s14=>s14,
    s15=>s15,
    s16=>s16,
    s17=>s17,
	
	out1=>out1s,
	out2=>out2s
	
	);
	
	RCA_comp: rca 
	port map(
	A=>out1s(k*2-1 downto 1),
	B=>out2s,
	Ci=>cis,
	S=>prods,
	Co=>cos
	);
	
	prod<=prods & out1s(0); --LSB of prod come directly from the LSB of Dadda tree
	
	
	
	
	end architecture structural;