library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mbe_test is
end mbe_test;

architecture dut of mbe_test is

	signal pp1:  std_logic_vector(32 downto 0):=(others=>'0');
    signal pp2:  std_logic_vector(32 downto 0):=(others=>'0');
    signal pp3:  std_logic_vector(32 downto 0):=(others=>'0');
	signal pp4:  std_logic_vector(32 downto 0):=(others=>'0');
	signal pp5:  std_logic_vector(32 downto 0):=(others=>'0');
	signal pp6:  std_logic_vector(32 downto 0):=(others=>'0');
	signal pp7:  std_logic_vector(32 downto 0):=(others=>'0');
	signal pp8:  std_logic_vector(32 downto 0):=(others=>'0');
	signal pp9:  std_logic_vector(32 downto 0):=(others=>'0');
	signal pp10: std_logic_vector(32 downto 0):=(others=>'0');
	signal pp11: std_logic_vector(32 downto 0):=(others=>'0');
	signal pp12: std_logic_vector(32 downto 0):=(others=>'0');
	signal pp13: std_logic_vector(32 downto 0):=(others=>'0');
	signal pp14: std_logic_vector(32 downto 0):=(others=>'0');
	signal pp15: std_logic_vector(32 downto 0):=(others=>'0');
	signal pp16: std_logic_vector(32 downto 0):=(others=>'0');
	signal pp17: std_logic_vector(32-1 downto 0):=(others=>'0');
	
	signal s1:   std_logic:='0'; 
	signal s2:   std_logic:='0';
	signal s3:   std_logic:='0';
	signal s4:   std_logic:='0';
	signal s5:   std_logic:='0';
	signal s6:   std_logic:='0';
	signal s7:   std_logic:='0';
	signal s8:   std_logic:='0';
	signal s9:   std_logic:='0';
	signal s10:  std_logic:='0';
	signal s11:  std_logic:='0';
	signal s12:  std_logic:='0';
	signal s13:  std_logic:='0';
	signal s14:  std_logic:='0';
	signal s15:  std_logic:='0';
	signal s16:  std_logic:='0';
	signal s17:  std_logic:='0'; -- sign pp17s11: in std_logic;
	signal prod: std_logic_vector(32*2-1 downto 0); -- 64 
	signal a: std_logic_vector(3 downto 0):="0101";
	signal anegato: std_logic_vector(3 downto 0):="0000";
	
	component MBE
	port 
	(
	
	pp1: in std_logic_vector(32 downto 0); --33 bit input, row 1
	pp2: in std_logic_vector(32 downto 0); --33 bit input
	pp3: in std_logic_vector(32 downto 0); --33 bit input
	pp4: in std_logic_vector(32 downto 0); --33 bit input
	pp5: in std_logic_vector(32 downto 0); --33 bit input
	pp6: in std_logic_vector(32 downto 0); --33 bit input
	pp7: in std_logic_vector(32 downto 0); --33 bit input
	pp8: in std_logic_vector(32 downto 0); --33 bit input
	pp9: in std_logic_vector(32 downto 0); --33 bit input
	pp10: in std_logic_vector(32 downto 0); --33 bit input
	pp11: in std_logic_vector(32 downto 0); --33 bit input
	pp12: in std_logic_vector(32 downto 0); --33 bit input
	pp13: in std_logic_vector(32 downto 0); --33 bit input
	pp14: in std_logic_vector(32 downto 0); --33 bit input
	pp15: in std_logic_vector(32 downto 0); --33 bit input
	pp16: in std_logic_vector(32 downto 0); --33 bit input
	pp17: in std_logic_vector(32-1 downto 0); --32 bit input row 17
	
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
		
	prod: out std_logic_vector(32*2-1 downto 0) -- 64 
	);
	end component;
	
	begin
	
	mbe_mult: component MBE
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
	
	prod=>prod
	
	
	
	);
	
	anegato<=std_logic_vector(unsigned(not(a)) + 1); --2's complement
	
	stimuli: process
	
	
	
	begin 
	
	wait for 100 ns;
	--9*9
	--pp1<=   "000000000000000000000000000001001";
	--pp2<=   "111111111111111111111111111101101"; --1's complement
	----pp2<= "111111111111111111111111111101110" ; -- 2's complement
	--pp3<=   "000000000000000000000000000001001" ;
	--pp4<=   "000000000000000000000000000000000" ;
	--pp5<=   "000000000000000000000000000000000" ;
	--pp6<=   "000000000000000000000000000000000" ;
	--pp7<=   "000000000000000000000000000000000" ;
	--pp8<=   "000000000000000000000000000000000" ;
	--pp9<=   "000000000000000000000000000000000" ;
	--pp10<=  "000000000000000000000000000000000";
	--pp11<=  "000000000000000000000000000000000";
	--pp12<=  "000000000000000000000000000000000";
	--pp13<=  "000000000000000000000000000000000";
	--pp14<=  "000000000000000000000000000000000";
	--pp15<=  "000000000000000000000000000000000";
	--pp16<= "000000000000000000000000000000000";
   	--pp17<= "00000000000000000000000000000000";
	--
	--s1<=   '0';
	--s2<=   '1';
	--s3<=   '0';
	--s4<=   '0';
	--s5<=   '0';
	--s6<=   '0';
	--s7<=   '0';
	--s8<=   '0';
	--s9<=   '0';
	--s10<=  '0';
	--s11<=  '0';
	--s12<=  '0';
	--s13<=  '0';
	--s14<=  '0';
	--s15<=  '0';
	--s16<=  '0';
	--s17<=  '0';
	-- 9*1
	pp1<=   "000000000000000000000000000001001";
	pp2<=   "000000000000000000000000000000000" ;
	pp3<=   "000000000000000000000000000000000" ;
	pp4<=   "000000000000000000000000000000000" ;
	pp5<=   "000000000000000000000000000000000" ;
	pp6<=   "000000000000000000000000000000000" ;
	pp7<=   "000000000000000000000000000000000" ;
	pp8<=   "000000000000000000000000000000000" ;
	pp9<=   "000000000000000000000000000000000" ;
	pp10<=  "000000000000000000000000000000000";
	pp11<=  "000000000000000000000000000000000";
	pp12<=  "000000000000000000000000000000000";
	pp13<=  "000000000000000000000000000000000";
	pp14<=  "000000000000000000000000000000000";
	pp15<=  "000000000000000000000000000000000";
	pp16<=  "000000000000000000000000000000000";
	pp17<=  "00000000000000000000000000000000";
	
	s1<=   '0';
	s2<=   '0';
	s3<=   '0';
	s4<=   '0';
	s5<=   '0';
	s6<=   '0';
	s7<=   '0';
	s8<=   '0';
	s9<=   '0';
	s10<=  '0';
	s11<=  '0';
	s12<=  '0';
	s13<=  '0';
	s14<=  '0';
	s15<=  '0';
	s16<=  '0';
	s17<=  '0';
	
	
	
	wait;

	end process;

end architecture;