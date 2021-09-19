library ieee;
use ieee.std_logic_1164.all;

entity seven_sdd_1 is
port (SW : in std_logic_vector (9 downto 0);
	HEX0 : out std_logic_vector (6 downto 0));
end seven_sdd_1;

architecture action of seven_sdd_1 is
	component seven_sd is
		port (S : in std_logic_vector (3 downto 0);
		HEX : out std_logic_vector (6 downto 0));
	end component;
begin
s1: seven_sd port map (SW(3 downto 0), HEX0);
end action;