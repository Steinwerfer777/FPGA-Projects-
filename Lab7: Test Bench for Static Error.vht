library ieee;
use ieee.numeric_bit.all;

entity test_static is
end test_static;

architecture tb of test_static is
component s_a is
	port(A,B,C,D : in bit;
		 O : out bit);
end component;

signal Ai, Bi, Ci, Di, Oi : bit; 
begin
t1: s_a port map(Ai, Bi, Ci, Di, Oi);



Ai <= '1' after 0 ns,
		'0' after 200 ns,
		'1' after 400 ns;

Bi <= '0' after 0 ns,
		'1' after 100 ns,
		'0' after 300 ns,
		'1' after 500 ns;

Ci <= '0' after 0 ns,
		'1' after 250 ns,
		'0' after 600 ns;

Di <= '0' after 0 ns,
		'1' after 350 ns,
		'0' after 800 ns;

end tb;
