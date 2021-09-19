library ieee;
use ieee.std_logic_1164.all;

-- Segment Display Decoder for Hexidecimal Units --
entity seven_sd is 
port (S : in std_logic_vector (3 downto 0);
		HEX : out std_logic_vector (6 downto 0));
end seven_sd;

architecture action of seven_sd is
begin
HEX(6) <= (S(3) and not S(1)) or (S(3) and S(0)) or (not S(2) and S(1)) or 
			(S(2) and S(0)) or (not S(3) and S(1) and not S(0)) or (S(2) and not S(1) and S(0));
HEX(4) <= (S(1) and S(0)) or (S(2) xor S(0)) or (not S(3) and S(2)) or (S(3) nand S(1));

HEX(5) <= (S(1) nand S(2)) or (S(0) nand S(1)) or (S(3) and S(1) and S(0)) or not S(3);

HEX(3) <= (not S(3) and S(2)) or (not S(2) and not S(1) and not S(0)) or (S(2) xor S(3) xor S(0));

HEX(2) <= (S(3) and not S(2)) or (S(1) and S(0)) or (S(2) and S(1)) or (not S(2) and S(1)) 
				or (S(2) nand S(0));
HEX(1) <= (S(3) nand S(2)) or (S(1) and not S(0)) or (S(3) and S(1)) or (not S(2) and S(0)) or 
				(not S(3) and not S(1) and S(0));
HEX(0) <= (S(2) and not S(0)) or (S(1) and not S(0)) or (S(2) and S(1)) or (S(3) and not S(0)) or
				(not S(3) and not S(1) and S(0));
end action;
			  
