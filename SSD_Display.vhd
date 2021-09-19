library ieee;
use ieee.std_logic_1164.all

entity SSD_LEDR is
port (SW : in std_logic_vector (9 downto 0);
		HEX0, HEX1 : out std_logic_vector(6 downto 0));
end SSD_LEDR;

architecture action of SSD_LEDR is
	component SSD is
		port(S : in std_logic_vector(3 downto 0);
	  HEX : out std_logic_vector(6 downto 0));
	 end component;
begin
seg0 : SSD port map(SW(3 downto 0), HEX0);
seg1: SSD port map(SW(7 downto 4), HEX1);
end action;