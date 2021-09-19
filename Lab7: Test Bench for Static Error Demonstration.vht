library ieee;
use ieee.numeric_bit.all;

-- It is expected that Static Errors will occur in RTL -- 
entity tb_error is
end tb_error;

architecture tb of tb_error is
component NAND_simp is 
	port(A,B,C,D : in bit;
		  Y: out bit);
end component; 

signal ai, bi, ci, di, yi : bit;

begin
t1: NAND_simp port map(ai, bi, ci, di, yi);

ai <= '0' after 0 ns,
	  '1' after 10 ns,
	  '0' after 20 ns,
	  '1' after 60 ns;
	  
bi <= '1' after 0 ns,
	  '0' after 40 ns,
	  '1' after 80 ns,
	  '0' after 160 ns;
	  
ci <= '0' after 0 ns,
     '1' after 40 ns,
	  '0' after 60 ns;

di <= '1' after 0 ns,
	  '0' after 20 ns,
	  '1' after 80 ns,
	  '0' after 120 ns;
	  
end tb;
