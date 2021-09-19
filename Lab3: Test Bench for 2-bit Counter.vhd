library ieee;
use ieee.numeric_bit.all;

entity test_cnt is
end test_cnt;

architecture test of test_cnt is
	component counter_2 is
		port(E, x, clk : in bit;
			  Y : out bit_vector (1 downto 0));
	end component;
	
signal clk, Ei, xi : bit;
signal Yo : bit_vector (1 downto 0);
begin
count: counter_2 port map (Ei, xi, clk, Yo);

clk <= not clk after 10 ns; 
Ei <= '0' after 0 ns,
		'1' after 50 ns,
		'0' after 100 ns,
		'1' after 120 ns,
		'0' after 200ns;
xi <= '1' after 0 ns,
		'0' after 75 ns,
		'1' after 150 ns;
end test; 
