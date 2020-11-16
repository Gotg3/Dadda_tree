library ieee;
use ieee.std_logic_1164.all;
library work;
use work.dadda_package.all;

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
	
	--rows layer 1--
	signal l1_r0: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r1: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r2: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r3: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r4: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r5: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r6: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r7: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r8: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r9: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r10: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r11: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r12: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r13: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r14: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r15: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l1_r16: std_logic_vector(63 downto 0):= (others=>'0'); 
	
	
	--rows layer 2--
	signal l2_r0: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l2_r1: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l2_r2: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l2_r3: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l2_r4: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l2_r5: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l2_r6: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l2_r7: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l2_r8: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l2_r9: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l2_r10: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l2_r11: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l2_r12: std_logic_vector(63 downto 0):= (others=>'0');
	
	--rows layer 3--
	signal l3_r0: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l3_r1: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l3_r2: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l3_r3: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l3_r4: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l3_r5: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l3_r6: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l3_r7: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l3_r8: std_logic_vector(63 downto 0):= (others=>'0'); 
	
	--rows layer 4--
	signal l4_r0: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l4_r1: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l4_r2: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l4_r3: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l4_r4: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l4_r5: std_logic_vector(63 downto 0):= (others=>'0'); 
	
	--rows layer 5--
	signal l5_r0: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l5_r1: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l5_r2: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l5_r3: std_logic_vector(63 downto 0):= (others=>'0'); 
	
	--rows layer 6--
	signal l6_r0: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l6_r1: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l6_r2: std_logic_vector(63 downto 0):= (others=>'0'); 
	
	--rows layer 7--
	signal l7_r0: std_logic_vector(63 downto 0):= (others=>'0'); 
	signal l7_r1: std_logic_vector(64 downto 0):= (others=>'0'); 
		
	
	begin
	--rows layer 1 assignment

	l1_r0(35 downto 0)<=( not s1 & s1 & s1 & pp1);
	l1_r1(36 downto 2)<=( '1' & not s2 & pp2);
	l1_r1(0)<=s1;
	l1_r2(38 downto 4)<=( '1' & not s3 & pp3);
	l1_r2(2)<=s2;
	l1_r3(40 downto 6)<=( '1' & not s4 & pp4);
	l1_r3(4)<=s3;
	l1_r4(42 downto 8)<=( '1' & not s5 & pp5);
	l1_r4(6)<=s4;
	l1_r5(44 downto 10)<=( '1' & not s6 & pp6);
	l1_r5(8)<=s5;
	l1_r6(46 downto 12)<=( '1' & not s7 & pp7);
	l1_r6(10)<=s6;
	l1_r7(48 downto 14)<=( '1' & not s8 & pp8);
	l1_r7(12)<=s7;
	l1_r8(50 downto 16)<=( '1' & not s9 & pp9);
	l1_r8(14)<=s8;
	l1_r9(52 downto 18)<=( '1' & not s10 & pp10);
	l1_r9(16)<=s9;
	l1_r10(54 downto 20)<=( '1' & not s11 & pp11);
	l1_r10(18)<=s10
	l1_r11(56 downto 22)<=( '1' & not s12 & pp12);
	l1_r11(20)<=s11;
	l1_r12(58 downto 24)<=( '1' & not s13 & pp13);
	l1_r12(22)<=s12;
	l1_r13(60 downto 26)<=( '1' & not s14 & pp14);
	l1_r13(24)<=s13;
	l1_r14(62 downto 28)<=( '1' & not s15 & pp15);
	l1_r14(26)<=s14;
	l1_r15(63 downto 30)<=( not s16 & pp16);
	l1_r15(28)<=s15;
	l1_r16(63 downto 32)<=(pp17);
	l1_r16(30)<=s16;
	
	
	
	--------------------LAYER 1----------------------------
	--HA  1-8
	HA_1_8_layer1: for I in 24 to 31 generate
	HA_L1_1_8: ha port map(l1_r0(I), l1_r1(I), l2_r0(I), l2_r1(I+1));
	end generate HA_1_8_layer1;
	
	--HA  9-12
	HA_9_L1 : ha port map(l1_r0(42), l1_r1(42), l2_r0(42), l2_r0(43));
	HA_10_L1 : ha port map(l1_r3(40), l1_r4(40), l2_r2(40), l2_r2(41));
	HA_11_L1 : ha port map(l1_r6(38), l1_r7(38), l2_r4(38), l2_r4(39));
	HA_12_L1 : ha port map(l1_r9(36), l1_r10(36), l2_r6(36), l2_r6(37));
	
	--FA 1-6
	FA_1_6 : for I in 26 to 31 generate
	FA_L1_1_6: fa port map(l1_r2(I), l1_r3(I), l1_r4(I), l2_r2(I), l2_r3(I+1));
	end generate FA_1_6;
	
	--FA 7-10
	FA_7_10 : for I in 28 to 31 generate
	FA_L1_7_10: fa port map(l1_r5(I), l1_r6(I), l1_r7(I), l2_r4(I), l2_r5(I+1));
	end generate FA_7_10;
	
	--FA 11-12
	FA_11_12 : for I in 30 to 31 generate
	FA_L1_11_12: fa port map(l1_r8(I), l1_r9(I), l1_r10(I), l2_r6(I), l2_r7(I+1));
	end generate FA_11_12;
	
	--FA 13-22
	FA_13_22 : for I in 32 to 41 generate
	FA_L1_13_22: fa port map(l1_r0(I), l1_r1(I), l1_r2(I), l2_r0(I), l2_r1(I+1));
	end generate FA_13_22;
	
	--FA 23-30
	FA_23_30 : for I in 32 to 39 generate
	FA_L1_23_30: fa port map(l1_r3(I), l1_r4(I), l1_r5(I), l2_r2(I), l2_r3(I+1));
	end generate FA_23_30;
	
	--FA 31-36
	FA_31_36 : for I in 32 to 37 generate
	FA_L1_31_36: fa port map(l1_r6(I), l1_r7(I), l1_r8(I), l2_r4(I), l2_r5(I+1));
	end generate FA_31_36;
	
	--FA 37-40
	FA_37_40 : for I in 32 to 35 generate
	FA_L1_37_40: fa port map(l1_r9(I), l1_r10(I), l1_r11(I), l2_r6(I), l2_r7(I+1));
	end generate FA_37_40;
	
	--connection dots L1 - L2
	l2_r0(23 downto 0)<=l1_r0(23 downto 0);
	l2_r1(23 downto 0)<=l1_r1(23 downto 0);
	l2_r2(23 downto 2)<=l1_r2(23 downto 2);
	l2_r3(23 downto 4)<=l1_r3(23 downto 4);
	l2_r4(23 downto 6)<=l1_r4(23 downto 6);
	l2_r5(23 downto 8)<=l1_r5(23 downto 8);
	l2_r6(23 downto 10)<=l1_r6(23 downto 10);
	l2_r7(23 downto 12)<=l1_r7(23 downto 12);
	l2_r8(23 downto 14)<=l1_r8(23 downto 14);
	l2_r9(23 downto 16)<=l1_r9(23 downto 16);
	l2_r10(23 downto 18)<=l1_r10(23 downto 18);
	l2_r11(23 downto 20)<=l1_r11(23 downto 20);
	l2_r12(23 downto 22)<=l1_r12(23 downto 22);
	
    l2_r0(63 downto 44)<=l1_r0(63 downto 44);
	l2_r1(63 downto 44)<=l1_r1(63 downto 44);
	l2_r2(62 downto 44)<= l1_r2(62 downto 44);
	l2_r3(60 downto 44)<= l1_r3(60 downto 44);
	l2_r4(58 downto 44)<= l1_r4(58 downto 44);
	l2_r5(56 downto 44)<= l1_r5(56 downto 44);
	l2_r6(54 downto 44)<=l1_r6(54 downto 44);
	l2_r7(52 downto 44)<=l1_r7(52 downto 44);
	l2_r8(50 downto 44)<=l1_r8(50 downto 44);
	l2_r9(48 downto 44)<=l1_r9(48 downto 44);
	l2_r10(46 downto 44)<=l1_r10(46 downto 44);
	l2_r11(44)<=l1_r11(44);
	
	l2_r1(24)<=l1_r2(24);
	l2_r2(24)<=l1_r3(24);
	l2_r3(24)<=l1_r4(24);
	l2_r4(24)<=l1_r5(24);
	l2_r5(24)<=l1_r6(24);
	l2_r6(24)<=l1_r7(24);
	l2_r7(24)<=l1_r8(24);
	l2_r8(24)<=l1_r9(24);
	l2_r9(24)<=l1_r10(24);
	l2_r10(24)<=l1_r11(24);
	l2_r11(24)<=l1_r12(24);
	l2_r12(24)<=l1_r13(24);
	
	l2_r2(25)<=l1_r2(25);
	l2_r3(25)<=l1_r3(25);
	l2_r4(25)<=l1_r4(25);
	l2_r5(25)<=l1_r5(25);
	l2_r6(25)<=l1_r6(25);
	l2_r7(25)<=l1_r7(25);
    l2_r8(25)<=l1_r8(25);
	l2_r9(25)<=l1_r9(25);
	l2_r10(25)<=l1_r10(25);
	l2_r11(25)<=l1_r11(25);
	l2_r12(25)<=l1_r12(25);
	
	l2_r3(26)<=l1_r5(26);
	l2_r4(26)<=l1_r6(26);
	l2_r5(26)<=l1_r7(26);
	l2_r6(26)<=l1_r8(26);
	l2_r7(26)<=l1_r9(26);
	l2_r8(26)<=l1_r10(26);
	l2_r9(26)<=l1_r11(26);
	l2_r10(26)<=l1_r12(26);
	l2_r11(26)<=l1_r13(26);
	l2_r12(26)<=l1_r14(26);
	
	l2_r4(27)<=l1_r5(27);
	l2_r5(27)<=l1_r6(27);
	l2_r6(27)<=l1_r7(27);
	l2_r7(27)<=l1_r8(27);
	l2_r8(27)<=l1_r9(27);
	l2_r9(27)<=l1_r10(27);
	l2_r10(27)<=l1_r11(27);
	l2_r11(27)<=l1_r12(27);
	l2_r12(27)<=l1_r13(27);
	
	l2_r5(28)<=l1_r8(28);
	l2_r6(28)<=l1_r9(28);
	l2_r7(28)<=l1_r10(28);
	l2_r8(28)<=l1_r11(28);
	l2_r9(28)<=l1_r12(28);
	l2_r10(28)<=l1_r13(28);
	l2_r11(28)<=l1_r14(28);
	l2_r12(28)<=l1_r15(28);
	
	l2_r6(29)<=l1_r8(29);
	l2_r7(29)<=l1_r9(29);
	l2_r8(29)<=l1_r10(29);
	l2_r9(29)<=l1_r11(29);
	l2_r10(29)<=l1_r12(29);
	l2_r11(29)<=l1_r13(29);
	l2_r12(29)<=l1_r14(29);
	
	l2_r7(30)<=l1_r11(30);
	l2_r8(30)<=l1_r12(30);
	l2_r9(30)<=l1_r13(30);
	l2_r10(30)<=l1_r14(30);
	l2_r11(30)<=l1_r15(30);
	l2_r12(30)<=l1_r16(30);
	
	l2_r8(31)<=l1_r11(31);
	l2_r9(31)<=l1_r12(31);
	l2_r10(31)<=l1_r13(31);
	l2_r11(31)<=l1_r14(31);
	l2_r12(31)<=l1_r15(31);
	
	l2_r8(32)<=l1_r12(32);
	l2_r9(32)<=l1_r13(32);
	l2_r10(32)<=l1_r14(32);
	l2_r11(32)<=l1_r15(32);
	l2_r12(32)<=l1_r16(32);
	
	 l2_r8(33)<=l1_r12(33);
	 l2_r9(33)<=l1_r13(33);
	l2_r10(33)<=l1_r14(33);
	l2_r11(33)<=l1_r15(33);
	l2_r12(33)<=l1_r16(33);
	
	 l2_r8(34)<=l1_r12(34);
	 l2_r9(34)<=l1_r13(34);
	l2_r10(34)<=l1_r14(34);
	l2_r11(34)<=l1_r15(34);
	l2_r12(34)<=l1_r16(34);
	
	 l2_r8(35)<=l1_r12(35);
	 l2_r9(35)<=l1_r13(35);
	l2_r10(35)<=l1_r14(35);
	l2_r11(35)<=l1_r15(35);
	l2_r12(35)<=l1_r16(35);
	
	 l2_r8(36)<=l1_r11(36);
	 l2_r9(36)<=l1_r12(36);
	l2_r10(36)<=l1_r13(36);
	l2_r11(36)<=l1_r14(36);
	l2_r12(36)<=l1_r15(36);
	
	 l2_r7(37)<= l1_r9(37);
	 l2_r8(37)<=l1_r10(37);
	 l2_r9(37)<=l1_r11(37);
	l2_r10(37)<=l1_r12(37);
	l2_r11(37)<=l1_r13(37);
	l2_r12(37)<=l1_r14(37);
	
	 l2_r6(38)<= l1_r8(38);
	 l2_r7(38)<= l1_r9(38);
	 l2_r8(38)<=l1_r10(38);
	 l2_r9(38)<=l1_r11(38);
	l2_r10(38)<=l1_r12(38);
	l2_r11(38)<=l1_r13(38);
	l2_r12(38)<=l1_r14(38);
	
	 l2_r5(39)<= l1_r6(39);
	 l2_r6(39)<= l1_r7(39);
	 l2_r7(39)<= l1_r8(39);
	 l2_r8(39)<= l1_r9(39);
	 l2_r9(39)<=l1_r10(39);
	l2_r10(39)<=l1_r11(39);
	l2_r11(39)<=l1_r12(39);
	l2_r12(39)<=l1_r13(39);
	
	 l2_r4(40)<= l1_r5(40);
	 l2_r5(40)<= l1_r6(40);
	 l2_r6(40)<= l1_r7(40);
	 l2_r7(40)<= l1_r8(40);
	 l2_r8(40)<= l1_r9(40);
	 l2_r9(40)<=l1_r10(40);
	l2_r10(40)<=l1_r11(40);
	l2_r11(40)<=l1_r12(40);
	l2_r12(40)<=l1_r13(40);
	
	 l2_r3(41)<=l1_r3(41);
	 l2_r4(41)<=l1_r4(41);
	 l2_r5(41)<=l1_r5(41);
	 l2_r6(41)<=l1_r6(41);
	 l2_r7(41)<=l1_r7(41);
	 l2_r8(41)<=l1_r8(41);
	 l2_r9(41)<=l1_r9(41);
	l2_r10(41)<=l1_r10(41);
	l2_r11(41)<=l1_r11(41);
	l2_r12(41)<=l1_r12(41);
	
	l2_r2(42)<=l1_r2(42);
	l2_r3(42)<=l1_r3(42);
	l2_r4(42)<=l1_r4(42);
	l2_r5(42)<=l1_r5(42);
	l2_r6(42)<=l1_r6(42);
	l2_r7(42)<=l1_r7(42);
    l2_r8(42)<=l1_r8(42);
	l2_r9(42)<=l1_r9(42);
	l2_r10(42)<=l1_r10(42);
	l2_r11(42)<=l1_r11(42);
	l2_r12(42)<=l1_r12(42);
	
	l2_r1(43)<=l1_r0(43);
	l2_r2(43)<=l1_r1(43);
	l2_r3(43)<=l1_r2(43);
	l2_r4(43)<=l1_r3(43);
	l2_r5(43)<=l1_r4(43);
	l2_r6(43)<=l1_r5(43);
	l2_r7(43)<=l1_r6(43);
	l2_r8(43)<=l1_r7(43);
	l2_r9(43)<=l1_r8(43);
	l2_r10(43)<= l1_r9(43);
	l2_r11(43)<=l1_r10(43);
	l2_r12(43)<=l1_r11(43);
	
	
	
	--------------------LAYER 2----------------------------
	
	--HA  1-8
	HA_1_8_layer2: for I in 16 to 23 generate
	HA_L2_1_8: ha port map(l2_r0(I), l2_r1(I), l3_r0(I), l3_r1(I+1));
	end generate HA_1_8_layer2;
	
	--HA  9-12
	HA_9_L2: ha port map(l2_r0(50), l2_r1(50), l3_r0(50), l3_r0(51));
	HA_10_L2 : ha port map(l2_r3(48), l2_r4(48), l3_r2(48), l3_r2(49));
	HA_11_L2 : ha port map(l2_r6(46), l2_r7(46),  l3_r4(46), l3_r4(47));
	HA_12_L2 : ha port map(l2_r9(44), l2_r10(44), l3_r6(44), l3_r6(45));
	
	--FA 1-26
	FA_1_26 : for I in 24 to 49 generate
	FA_L2_1_26: fa port map(l2_r0(I), l2_r1(I), l1_r2(I), l3_r0(I), l3_r1(I+1));
	end generate FA_1_26;
	
	--FA 27-32
	FA_27_32 : for I in 18 to 23 generate
	FA_L2_27_32: fa port map(l2_r2(I), l2_r3(I), l2_r4(I), l3_r2(I), l3_r3(I+1));
	end generate FA_27_32;
	
	--FA 33-36
	FA_33_36 : for I in 20 to 23 generate
	FA_L2_33_36: fa port map(l2_r5(I), l2_r6(I), l2_r7(I), l3_r4(I), l3_r5(I+1));
	end generate FA_33_36;
	
	--FA 37-38
	FA_37_38 : for I in 22 to 23 generate
	FA_L2_37_38: fa port map(l2_r8(I), l2_r9(I), l2_r10(I), l3_r6(I), l3_r7(I+1));
	end generate FA_37_38;
	
	--FA 39-62
	FA_39_62 : for I in 24 to 47 generate
	FA_L2_39_62: fa port map(l2_r3(I), l2_r4(I), l2_r5(I), l3_r2(I), l3_r3(I+1));
	end generate FA_39_62;
	
	--FA 63-84
	FA_63_84 : for I in 24 to 45 generate
	FA_L2_63_84: fa port map(l2_r6(I), l2_r7(I), l2_r8(I), l3_r4(I), l3_r5(I+1));
	end generate FA_63_84;
	
	--FA 85-104
	FA_85_104 : for I in 24 to 43 generate
	FA_L2_85_104: fa port map(l2_r9(I), l2_r10(I), l2_r11(I), l3_r6(I), l3_r7(I+1));
	end generate FA_85_104;
	
	l3_r0(15 downto 0)<= l2_r0(15 downto 0);
	l3_r1(15 downto 0)<= l2_r1(15 downto 0);
	l3_r2(15 downto 2)<= l2_r2(15 downto 2);
	l3_r3(15 downto 4)<= l2_r3(15 downto 4);
	l3_r4(15 downto 6)<= l2_r4(15 downto 6);
	l3_r5(15 downto 8)<= l2_r5(15 downto 8);
	l3_r6(15 downto 10)<=l2_r6(15 downto 10);
	l3_r7(15 downto 12)<=l2_r7(15 downto 12);
	l3_r8(15 downto 14)<=l2_r8(15 downto 14);
	
	l3_r0(63 downto 52)<= l2_r0(63 downto 52);
	l3_r1(63 downto 52)<= l2_r1(63 downto 52);
	l3_r2(62 downto 52)<= l2_r2(62 downto 52);
	l3_r3(60 downto 52)<= l2_r3(60 downto 52);
	l3_r4(58 downto 52)<= l2_r4(58 downto 52);
	l3_r5(56 downto 52)<= l2_r5(56 downto 52);
	l3_r6(54 downto 52)<= l2_r6(54 downto 52);
	l3_r7(52)<=l2_r7(52);
	
	l3_r8(43 downto 22)<= l2_r12(43 downto 24) & l2_r11(23) & l2_r12(22);
	
	l3_r1(16)<=l2_r2(16);
	l3_r2(16)<=l2_r3(16);
	l3_r3(16)<=l2_r4(16);
	l3_r4(16)<=l2_r5(16);
	l3_r5(16)<=l2_r6(16);
	l3_r6(16)<=l2_r7(16);
	l3_r7(16)<=l2_r8(16);
	l3_r8(16)<=l2_r9(16);
	
	l3_r2(17)<=l2_r2(17);
	l3_r3(17)<=l2_r3(17);
	l3_r4(17)<=l2_r4(17);
	l3_r5(17)<=l2_r5(17);
	l3_r6(17)<=l2_r6(17);
	l3_r7(17)<=l2_r7(17);
	l3_r8(17)<=l2_r8(17);
	
    l3_r3(18)<=l2_r5(18);
	l3_r4(18)<=l2_r6(18);
	l3_r5(18)<=l2_r7(18);
	l3_r6(18)<=l2_r8(18);
	l3_r7(18)<=l2_r9(18);
	l3_r8(18)<=l2_r10(18);
	
	l3_r4(19)<=l2_r5(19);
	l3_r5(19)<=l2_r6(19);
	l3_r6(19)<=l2_r7(19);
	l3_r7(19)<=l2_r8(19);
	l3_r8(19)<=l2_r9(19);
	
	l3_r5(20)<=l2_r8(20);
	l3_r6(20)<=l2_r9(20);
	l3_r7(20)<=l2_r10(20);
	l3_r8(20)<=l2_r11(20);
	
	l3_r6(21)<=l2_r8(21);
	l3_r7(21)<=l2_r9(21);
	l3_r8(21)<=l2_r10(21);
	
	l3_r7(22)<=l2_r11(22);
	
	--l3_r8(23)<=l2_r11(23);
	
	l3_r8(44)<=l2_r11(44);
	
	l3_r7(45)<=l2_r9(45);
	l3_r8(45)<=l2_r10(45);
	
	l3_r6(46)<= l2_r8(46);
	l3_r7(46)<= l2_r9(46);
	l3_r8(46)<=l2_r10(46);
	
	l3_r5(47)<=l2_r6(47);
	l3_r6(47)<=l2_r7(47);
	l3_r7(47)<=l2_r8(47);
	l3_r8(47)<=l2_r9(47);
	
	l3_r4(48)<=l2_r5(48);
	l3_r5(48)<=l2_r6(48);
	l3_r6(48)<=l2_r7(48);
	l3_r7(48)<=l2_r8(48);
	l3_r8(48)<=l2_r9(48);
	
	l3_r3(49)<=l2_r3(49);
	l3_r4(49)<=l2_r4(49);
	l3_r5(49)<=l2_r5(49);
	l3_r6(49)<=l2_r6(49);
	l3_r7(49)<=l2_r7(49);
	l3_r8(49)<=l2_r8(49);
	
	l3_r2(50)<=l2_r2(50);
	l3_r3(50)<=l2_r3(50);
	l3_r4(50)<=l2_r4(50);
	l3_r5(50)<=l2_r5(50);
	l3_r6(50)<=l2_r6(50);
	l3_r7(50)<=l2_r7(50);
	l3_r8(50)<=l2_r8(50);
	
	l3_r1(51)<=l2_r0(51);
	l3_r2(51)<=l2_r1(51);
	l3_r3(51)<=l2_r2(51);
	l3_r4(51)<=l2_r3(51);
	l3_r5(51)<=l2_r4(51);
	l3_r6(51)<=l2_r5(51);
	l3_r7(51)<=l2_r6(51);
	l3_r8(51)<=l2_r7(51);
	
	--------------------LAYER 3----------------------------
	
	--HA  1-6
	HA_1_6_layer3: for I in 10 to 15 generate
	HA_L3_1_6: ha port map(l3_r0(I), l3_r1(I), l4_r0(I), l4_r1(I+1));
	end generate HA_1_6_layer3;
	
	--HA  7-9
	HA_7_L3: ha port map(l3_r0(56), l3_r1(56), l4_r0(56), l4_r0(57));
	HA_8_L3 : ha port map(l3_r3(54), l3_r4(54), l4_r2(54), l4_r2(55));
	HA_9_L3 : ha port map(l3_r6(52), l3_r7(52),  l4_r4(52), l4_r4(53));
	
	
	--FA 1-40
	FA_1_40 : for I in 16 to 55 generate
	FA_L3_1_40: fa port map(l3_r0(I), l3_r1(I), l3_r2(I), l4_r0(I), l4_r1(I+1));
	end generate FA_1_40;
	
	--FA 41-44
	FA_41_44 : for I in 12 to 15 generate
	FA_L3_41_44: fa port map(l3_r2(I), l3_r3(I), l3_r4(I), l4_r2(I), l4_r3(I+1));
	end generate FA_41_44;
	
	--FA 45-82
	FA_45_82 : for I in 16 to 53 generate
	FA_L3_45_82: fa port map(l3_r3(I), l3_r4(I), l3_r5(I), l4_r2(I), l4_r3(I+1));
	end generate FA_45_82;
	
	--FA 83-84
	FA_83_84 : for I in 14 to 15 generate
	FA_L3_83_84: fa port map(l3_r5(I), l3_r6(I), l3_r7(I), l4_r4(I), l4_r5(I+1));
	end generate FA_83_84;
	
	--FA 85-120
	FA_85_120 : for I in 16 to 51 generate
	FA_L3_85_120: fa port map(l3_r6(I), l3_r7(I), l3_r8(I), l4_r4(I), l4_r5(I+1));
	end generate FA_85_120;
	
	l4_r0(9 downto 0)<= l3_r0(9 downto 0);
	l4_r1(9 downto 0)<= l3_r1(9 downto 0);
	l4_r2(9 downto 2)<= l3_r2(9 downto 2);
	l4_r3(9 downto 4)<= l3_r3(9 downto 4);
	l4_r4(9 downto 6)<= l3_r4(9 downto 6);
	l4_r5(9 downto 8)<= l3_r5(9 downto 8);
	
	l4_r0(63 downto 58)<= l3_r0(63 downto 58);
	l4_r1(63 downto 58)<= l3_r1(63 downto 58);
	l4_r2(62 downto 58)<= l3_r2(62 downto 58);
	l4_r3(60 downto 58)<= l3_r3(60 downto 58);
	l4_r4(58)<= l3_r4(58);
	
	l4_r1(10)<=l3_r2(10);
	l4_r2(10)<=l3_r3(10);
	l4_r3(10)<=l3_r4(10);
	l4_r4(10)<=l3_r5(10);
	l4_r5(10)<=l3_r6(10);
	
	l4_r2(11)<=l3_r2(11);
	l4_r3(11)<=l3_r3(11);
	l4_r4(11)<=l3_r4(11);
	l4_r5(11)<=l3_r5(11);
	
	l4_r3(12)<=l3_r5(12);
	l4_r4(12)<=l3_r6(12);
	l4_r5(12)<=l3_r7(12);
	
	l4_r4(13)<=l3_r5(13);
	l4_r5(13)<=l3_r6(13);
	
	l4_r5(14)<=l3_r8(14);
	
	l4_r5(53)<=l3_r6(53);
	
	l4_r4(54)<=l3_r5(54);
	l4_r5(54)<=l3_r6(54);
	
	l4_r3(55)<=l3_r3(55);
	l4_r4(55)<=l3_r4(55);
	l4_r5(55)<=l3_r5(55);
	
	l4_r2(56)<=l3_r2(56);
	l4_r3(56)<=l3_r3(56);
	l4_r4(56)<=l3_r4(56);
	l4_r5(56)<=l3_r5(56);
	
	l4_r1(57)<=l3_r0(57);
	l4_r2(57)<=l3_r1(57);
	l4_r3(57)<=l3_r2(57);
	l4_r4(57)<=l3_r3(57);
	l4_r5(57)<=l3_r4(57);
	
		
	--------------------LAYER 4----------------------------
	
	--HA  1-4
	HA_1_4_layer4: for I in 6 to 9 generate
	HA_L4_1_4: ha port map(l4_r0(I), l4_r1(I), l5_r0(I), l5_r1(I+1));
	end generate HA_1_4_layer4;
	
	--HA  5-6
	HA_5_L4: ha port map(l4_r0(60), l4_r1(60), l5_r0(60), l5_r0(61));
	HA_6_L4 : ha port map(l4_r3(58), l4_r4(58), l5_r2(58), l5_r2(59));
	

	--FA 1-50
	FA_1_50 : for I in 10 to 59 generate
	FA_L4_1_50: fa port map(l4_r0(I), l4_r1(I), l4_r2(I), l5_r0(I), l5_r1(I+1));
	end generate FA_1_50;
	
	--FA 51-52
	FA_51_52 : for I in 8 to 9 generate
	FA_L4_51_52: fa port map(l4_r2(I), l4_r3(I), l4_r4(I), l5_r2(I), l5_r3(I+1));
	end generate FA_51_52;
	
	--FA 53-100
	FA_53_100 : for I in 10 to 57 generate
	FA_L4_53_100: fa port map(l4_r3(I), l4_r4(I), l4_r5(I), l5_r2(I), l5_r3(I+1));
	end generate FA_53_100;
	
    l5_r0(5 downto 0)<= l4_r0(5 downto 0);
	l5_r1(5 downto 0)<= l4_r1(5 downto 0);
	l5_r2(5 downto 2)<= l4_r2(5 downto 2);
	l5_r3(5 downto 4)<= l4_r3(5 downto 4);
	
	l5_r0(63 downto 62)<= l4_r0(63 downto 62);
	l5_r1(63 downto 62)<= l4_r1(63 downto 62);
	l5_r2(62)<= l4_r2(62);
	
	
    l5_r1(6)<=l4_r2(6);
	l5_r2(6)<=l4_r3(6);
	l5_r3(6)<=l4_r4(6);
	
	l5_r2(7)<=l4_r2(7);
	l5_r3(7)<=l4_r3(7);
	
	l5_r3(8)<=l4_r5(8);
	
	l5_r3(59)<=l4_r3(59);
	
	l5_r2(60)<=l4_r2(60);
	l5_r3(60)<=l4_r3(60);
	
	l5_r1(61)<=l4_r0(61);
	l5_r2(61)<=l4_r1(61);
	l5_r3(61)<=l4_r2(61);
	
	--------------------LAYER 5----------------------------
	
	--HA  1-2
	HA_1_2_layer5: for I in 4 to 5 generate
	HA_L5_1_2: ha port map(l5_r0(I), l5_r1(I), l6_r0(I), l6_r1(I+1));
	end generate HA_1_2_layer5;
	
	--HA  3
	HA_3_L5: ha port map(l5_r0(62), l5_r1(62), l6_r0(62), l6_r0(63));
	
	

	--FA 1-56
	FA_1_56 : for I in 6 to 61 generate
	FA_L5_1_56: fa port map(l5_r0(I), l5_r1(I), l5_r2(I), l6_r0(I), l6_r1(I+1));
	end generate FA_1_56;
	
	l6_r0(3 downto 0)<= l5_r0(3 downto 0);
	l6_r1(3 downto 0)<= l5_r1(3 downto 0);
	l6_r2(3 downto 2)<= l5_r2(3 downto 2);
	
	l6_r2(61 downto 4)<= l5_r3(61 downto 6) & l5_r2(5) & l5_r3(4);
	
	l6_r1(4)<= l5_r2(4);
	
	--l6_r2(5)<= l5_r2(5);
	
	l6_r2(62)<= l5_r2(62);
	
	l6_r1(63)<= l5_r0(63);
	l6_r2(63)<= l5_r1(63);


--------------------LAYER 6----------------------------
	
	
	--HA  1
	HA_1_L6: ha port map(l6_r0(0), l6_r1(0), l7_r0(0), l7_r0(1));
	
	--HA  2-3
	HA_2_3_layer6: for I in 2 to 3 generate
	HA_L6_2_3: ha port map(l6_r0(I), l6_r1(I), l7_r0(I), l7_r1(I+1));
	end generate HA_2_3_layer6;
	
	--FA 1-60
	FA_1_60 : for I in 4 to 63 generate
	FA_L6_1_60: fa port map(l6_r0(I), l6_r1(I), l6_r2(I), l7_r0(I), l7_r1(I+1));
	end generate FA_1_60;
	
	l7_r1(1)<= l6_r0(1);
	l7_r1(2)<= l6_r2(2);
	
	----------------------assign outputs------------------
	
	out1<=l7_r0;
	out2<=l7_r1(63 downto 1);
	
	end architecture; 