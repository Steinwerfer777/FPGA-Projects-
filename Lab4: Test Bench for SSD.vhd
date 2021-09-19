library ieee;
use ieee.std_logic_1164.all;

entity test_s_ssd1 is
end test_s_ssd1;

architecture test of test_s_ssd1 is
	component seven_sdd_1 is
		port(SW: in std_logic_vector(9 downto 0);
			 HEX0 : out std_logic_vector(6 downto 0));
	end component;
	
signal SWi : std_logic_vector(9 downto 0) := "0000000000";
signal HEX0o : std_logic_vector(6 downto 0);

begin

t1: seven_sdd_1 port map(SWi, HEX0o);

SWi(0) <= not SWi(0) after 10 ns;
SWi(1) <= not SWi(1) after 20 ns;
SWi(2) <= not SWi(2) after 40 ns;
SWi(3) <= not SWi(3) after 100 ns;
end;
