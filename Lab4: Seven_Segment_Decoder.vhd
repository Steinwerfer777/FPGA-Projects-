library ieee;
use ieee.numeric_std.all;

entity SSD is
port(S : in std_logic_vector(3 downto 0);
	  HEX : out std_logic_vector(6 downto 0));
end SSD;

architecture decode of SSD is
begin
HEX(6) <= (not S(3) and not S(2) and not (S(1))) or (not S(3) and S(2) and S(1) and S(0)) 
			 or (S(3) and S(2) and not S(1) and not S(0));
HEX(5) <= (not S(3) and not S(2) and (S(1) or S(0))) or (not S(3) and S(1) and S(0)) or (S(3) and S(2) and not (S1) and S(0));
HEX(4) <= (not S(3) and S(0)) or (not S(3) and S(2) and not S(1)) or (not S(2) and not S(1) and S(0));
HEX(3) <= S(0) or (not S(3) and S(2) and not S(1) and not S(0));
HEX(2) <= (S(3) nand S(2) and S(1) and not S(0)) or (S(3) and S(2) and S(1)) or (S(3) and S(2) and not S(0));
HEX(1) <= (not S(3) and S(2) and not S(1) and S(0)) or (S(3) and S(1) and S(0)) or (S(2) and S(1) and not S(0)) or (S(3) and S(2) and not S(0));
HEX(0) <= (S(3) nand S(2) nand S(1) and S(0)) or (not S(3) and S(2) and not S(1) and not S(0)) or (S(3) and S(2) and not S(1) and S(0)) or (S(3) and not S(2) and S(1) and S(0));
end decode; 
