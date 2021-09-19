library ieee;
use ieee.numeric_bit.all;
use ieee.numeric_std.all;

entity test_lab5 is
end test_lab5;

architecture tb of test_lab5 is
component Lab5 is 
port(clk_50, rstb : in bit;
	  key : in bit_vector(3 downto 0);
	  LEDR : out bit_vector(9 downto 0));
end component;

signal clki, rstbi : bit;
signal keyi : bit_vector (3 downto 0);
signal LEDRi : bit_vector (9 downto 0);
begin
t1: Lab5 port map (clki, rstbi, keyi, LEDRi);

clki <= not clki after 1 ns,
		  clki after 3 ns;
rstbi <= '0' after 0 ns,
			'1' after 0.7 ns;
keyi(1) <= '1' after 0 ns,
				'0' after 0.5 ns;
keyi(3) <= '1' after 0 ns,
				'0' after 4 ns;
keyi(2) <= '0' after 0 ns,
				'1' after 4.2 ns;
keyi(0) <= '1' after 0 ns,
				'0' after 5 ns;

end tb; 
