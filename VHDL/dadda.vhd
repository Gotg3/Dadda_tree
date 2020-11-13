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
	--HA  1-8
	HA_1_8 for I in 24 to 31 generate
	HA_L1_1_8: ha port map(l1_matrix(I,0), l1_matrix(I,1), l2_matrix(I,0), l2_matrix(I+1,1));
	end generate HA_1_8;
	
	--HA  9-12
	HA_9 : port map(l1_matrix(42,0), l1_matrix(42,1), l2_matrix(42,0), l2_matrix(43,0));
	HA_10 : port map(l1_matrix(40,3), l1_matrix(40,4), l2_matrix(40,2), l2_matrix(41,2));
	HA_11 : port map(l1_matrix(38,6), l1_matrix(38,7), l2_matrix(38,4), l2_matrix(39,4));
	HA_12 : port map(l1_matrix(36,9), l1_matrix(36,10), l2_matrix(36,6), l2_matrix(37,6));
	
	--FA 1-6
	FA_1_6 : for I in 26 to 31 generate
	FA_L1_1_6: fa port map(l1_matrix(I,2), l1_matrix(I,3), l1_matrix(I,4), l2_matrix(I,2), l2_matrix(I+1,3));
	end generate FA_1_6;
	
	--FA 7-10
	FA_7_10 : for I in 28 to 31 generate
	FA_L1_7_10: fa port map(l1_matrix(I,5), l1_matrix(I,6), l1_matrix(I,7), l2_matrix(I,4), l2_matrix(I+1,5));
	end generate FA_7_10;
	
	--FA 11-12
	FA_11_12 : for I in 30 to 31 generate
	FA_L1_11_12: fa port map(l1_matrix(I,8), l1_matrix(I,9), l1_matrix(I,10), l2_matrix(I,6), l2_matrix(I+1,7));
	end generate FA_11_12;
	
	--FA 13-22
	FA_13_22 : for I in 32 to 41 generate
	FA_L1_13_22: fa port map(l1_matrix(I,0), l1_matrix(I,1), l1_matrix(I,2), l2_matrix(I,0), l2_matrix(I+1,1));
	end generate FA_13_22;
	
	--FA 23-30
	FA_23_30 : for I in 32 to 39 generate
	FA_L1_23_30: fa port map(l1_matrix(I,3), l1_matrix(I,4), l1_matrix(I,5), l2_matrix(I,3), l2_matrix(I+1,4));
	end generate FA_23_30;
	
	--FA 31-36
	FA_31_36 : for I in 32 to 37 generate
	FA_L1_31_36: fa port map(l1_matrix(I,6), l1_matrix(I,7), l1_matrix(I,8), l2_matrix(I,4), l2_matrix(I+1,5));
	end generate FA_31_36;
	
	--FA 37-40
	FA_37_40 : for I in 32 to 35 generate
	FA_L1_37_40: fa port map(l1_matrix(I,9), l1_matrix(I,10), l1_matrix(I,11), l2_matrix(I,6), l2_matrix(I+1,7));
	end generate FA_37_40;
	
	--connection dots L1 - L2
	l2_matrix(23 downto 0)(12 downto 0)<=l1_matrix(23 downto 0)(12 downto 0);
	
	l2_matrix (24)(12 downto 1)<=l1_matrix(24)(13 downto 2);
	l2_matrix (25)(12 downto 2)<=l1_matrix(25)(12 downto 2);
	l2_matrix (26)(12 downto 3)<=l1_matrix(26)(14 downto 5);
	l2_matrix (27)(12 downto 4)<=l1_matrix(27)(13 downto 5);
	l2_matrix (28)(12 downto 5)<=l1_matrix(28)(15 downto 8);
	l2_matrix (29)(12 downto 6)<=l1_matrix(29)(14 downto 8);
	l2_matrix (30)(12 downto 7)<=l1_matrix(30)(16 downto 11);
	l2_matrix (31)(12 downto 8)<=l1_matrix(31)(15 downto 11);
	
	l2_matrix (32 to 35)(8 to 12)<=l1_matrix(32 to 35)(12 to 16);
	
	l2_matrix (36)(8 to 12)<=l1_matrix(36)(11 to 15);
	l2_matrix (37)(7 to 12)<=l1_matrix(37)(9 to 14);
	l2_matrix (38)(6 to 12)<=l1_matrix(38)(8 to 14);
	l2_matrix (39)(5 to 12)<=l1_matrix(39)(6 to 13);
	l2_matrix (40)(4 to 12)<=l1_matrix(40)(5 to 13);
	l2_matrix (41)(3 to 12)<=l1_matrix(41)(3 to 12);
	l2_matrix (42)(2 to 12)<=l1_matrix(42)(2 to 12);
	l2_matrix (43)(1 to 12)<=l1_matrix(43)(0 to 11);
	
	l2_matrix (44 to 63)(0 to 11)<=l1_matrix(44 to 63)(0 to 11);

	--------------------LAYER 2----------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

