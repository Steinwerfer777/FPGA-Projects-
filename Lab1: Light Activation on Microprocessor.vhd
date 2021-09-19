library ieee;
use ieee.std_logic_1164.all;

entity light is
	port(SW : in std_logic_vector (9 downto 0);
			LEDR : out std_logic_vector(9 downto 0));
end light;

architecture action of light is
begin
	LEDR (0) <= (SW(0) and not SW(1)) or (not SW(0) and SW(1));
end action;
