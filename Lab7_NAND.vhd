library ieee;
use ieee.numeric_bit.all;

entity NAND1 is 
port(A, B : in bit;
	  Y : out bit);
end NAND1; 

architecture action of NAND1 is
begin
Y <= A nand B after 10 ns;
end action;