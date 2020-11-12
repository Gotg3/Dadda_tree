library ieee;
use ieee.std_logic_1164.all;


entity dadda_tree is 

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
	pp16 in std_logic_vector(k downto 0); --33 bit input
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
	out2: out std_logic_vector(k*2-2 downto 0); --63 bit out
	
	);
	end dadda_tree;
	
	
	architecture structural of dadda_tree is
	
	component ha 
	port(
		A: in std_logic;
		B: in std_logic;
		S: out std_logic;
		C: out std_logic
	);
	end component;
	
	component fa
	port(	
		A:	In	std_logic;
		B:	In	std_logic;
		Ci:	In	std_logic;
		S:	Out	std_logic;
		Co:	Out	std_logic
		);
	end component;
	
	
	signal l1_matrix: array_level1:= (others=>(others=>'0')); --matrix level 1 17 r x64 bit
	signal l2_matrix: array_level2:= (others=>(others=>'0')); --matrix level 2 13 r x64 bit
	signal l3_matrix: array_level3:= (others=>(others=>'0')); --matrix level 3 9 r x64 bit
	signal l4_matrix: array_level4:= (others=>(others=>'0')); --matrix level 4 6 r x64 bit
	signal l5_matrix: array_level5:= (others=>(others=>'0')); --matrix level 5 4 r x64 bit
	signal l6_matrix: array_level6:= (others=>(others=>'0')); --matrix level 6 3 r x64 bit
	signal l7_matrix: array_level7:= (others=>(others=>'0')); --matrix level 7 2 r x64 bit
	
	
	
	begin
	--matrix 1 assignment
	l1_matrix(35 downto 0)(0)<=( not s1 & s1 & s1 & pp1);
	l1_matrix(36 downto 2)(1)<=( 1 & not s2 & pp2);
	l1_matrix(0)(1)<=s2;
	l1_matrix(38 downto 4)(2)<=( 1 & not s3 & pp3);
	l1_matrix(2)(2)<=s3;
	l1_matrix(40 downto 6)(3)<=( 1 & not s4 & pp4);
	l1_matrix(4)(3)<=s4;
	l1_matrix(42 downto 8)(4)<=( 1 & not s5 & pp5);
	l1_matrix(6)(4)<=s5;
	l1_matrix(44 downto 10)(5)<=( 1 & not s6 & pp6);
	l1_matrix(8)(5)<=s6;
	l1_matrix(46 downto 12)(6)<=( 1 & not s7 & pp7);
	l1_matrix(10)(6)<=s7;
	l1_matrix(48 downto 14)(7)<=( 1 & not s8 & pp8);
	l1_matrix(12)(7)<=s8;
	l1_matrix(50 downto 16)(8)<=( 1 & not s9 & pp9);
	l1_matrix(14)(8)<=s9;
	l1_matrix(52 downto 18)(9)<=( 1 & not s10 & pp10);
	l1_matrix(16)(9)<=s10;
	l1_matrix(54 downto 20)(10)<=( 1 & not s11 & pp11);
	l1_matrix(18)(10)<=s11;
	l1_matrix(56 downto 22)(11)<=( 1 & not s12 & pp12);
	l1_matrix(20)(11)<=s12;
	l1_matrix(58 downto 24)(12)<=( 1 & not s13 & pp13);
	l1_matrix(22)(12)<=s13;
	l1_matrix(60 downto 26)(13)<=( 1 & not s14 & pp14);
	l1_matrix(24)(13)<=s14;
	l1_matrix(62 downto 28)(14)<=( 1 & not s15 & pp15);
	l1_matrix(26)(14)<=s15;
	l1_matrix(63 downto 30)(15)<=( not s16 & pp16);
	l1_matrix(28)(15)<=s16;
	l1_matrix(63 downto 32)(16)<=(pp17);
	l1_matrix(30)(16)<=s17;
	
	
	
	--------------------LAYER 1----------------------------
	--HA row 1,2 ; bit 24 
	HA_1_2_24 : port map( l1_matrix(24,1), l1_matrix(24,2), l2_matrix(24,1), l2_matrix(25,1));
	
	--HA row 1,2 ; bit 25,31 
	HA_1_2_25_31 : for I in 1 to 8 generate
	HA12_I: ha port map(l1_matrix(24+I,1), l1_matrix(24+I,2), l2_matrix(24+I,2), l2_matrix(24+I+1,1)
	
	
	
	
	----------------------------------------A DOMANI 
	--HA row 2,3 ; bit 24,25 ok
	HA_1_2_24 : port map( l1_matrix(24,1), l1_matrix(24,2), l2_matrix(24,1), l2_matrix(25,1));
	HA_1_2_25 : port map( l1_matrix(25,1), l1_matrix(25,2), l2_matrix(25,2), l2_matrix(26,1));
	
	--HA row 4,5 ; bit 26,27
	HA_4_5_26 : port map( l1_matrix(26,4), l1_matrix(26,5), l2_matrix(26,4), l2_matrix(26,5));
	HA_4_5_27 : port map( l1_matrix(27,4), l1_matrix(27,5), l2_matrix(27,4), l2_matrix(27,5));
	
	--HA row 7,8 ; bit 28,29
	HA_7_8_28 : port map( l1_matrix(28,7), l1_matrix(28,8), l2_matrix(28,7), l2_matrix(28,8));
	HA_7_8_29 : port map( l1_matrix(29,7), l1_matrix(29,8), l2_matrix(29,7), l2_matrix(29,8));	
	
	--HA row 10,11 ; bit 30,31
	HA_10_11_30 : port map( l1_matrix(30,10), l1_matrix(30,11), l2_matrix(30,10), l2_matrix(30,11));
	HA_10_11_31 : port map( l1_matrix(31,10), l1_matrix(31,11), l2_matrix(31,10), l2_matrix(31,11));
	
	--HA row 5,6 ; bit 42
	HA_5_6_42 : port map( l1_matrix(42,5), l1_matrix(42,6), l2_matrix(42,5), l2_matrix(42,6));
	
	--HA row 7,8 ; bit 40
	HA_7_8_40 : port map( l1_matrix(40,7), l1_matrix(40,8), l2_matrix(40,7), l2_matrix(40,8));
	
	--HA row 9,10 ; bit 38
	HA_9_10_38 : port map( l1_matrix(38,9), l1_matrix(38,10), l2_matrix(38,9), l2_matrix(38,10));
	
	--HA row 11,12 ; bit 36
	HA_11_12_36 : port map( l1_matrix(36,11), l1_matrix(36,12), l2_matrix(36,11), l2_matrix(36,12));
	
	--FA row 1,2,3 ; bit 26 - 35 
	FA_1_3_26_35: for I in 26 to 35 generate
		FAI: FA port map(l1_matrix(I,1), l1_matrix(I,2), l1_matrix(I,3), l2_matrix(I,1), l2_matrix(I+1,1));
	
	--FA row 4,5,6 ; bit 28 - 35 
	FA_4_6_28_35: for I in 28 to 35 generate
		FAI: FA port map(l1_matrix(I,4), l1_matrix(I,5), l1_matrix(I,6), l2_matrix(I,1), l2_matrix(I,2));
	
	
	
	--------------------LAYER 2----------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

