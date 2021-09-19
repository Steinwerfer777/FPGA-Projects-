library ieee;
use ieee.std_logic_1164.all;

entity seven_sdd_2 is
port (SW : in std_logic_vector (9 downto 0);
	HEX0, HEX1 : out std_logic_vector (6 downto 0));
end seven_sdd_2;

architecture action of seven_sdd_2 is
	component seven_sd is
		port (S : in std_logic_vector (3 downto 0);
		HEX : out std_logic_vector (6 downto 0));
	end component;
begin
s1: seven_sd port map (SW(3 downto 0), HEX0);
s2: seven_sd port map (SW(7 downto 4), HEX1);
end action;