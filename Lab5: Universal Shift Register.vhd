library ieee;
use ieee.numeric_bit.all;

-- Constructing 10-bit USR -- 
entity USR_10 is
port(S1, S0, S_L, S_R, clk, clrb : in bit; -- S_L = Shift Left, S_R = Shift Right --
	load : in bit_vector(9 downto 0);
	O : out bit_vector(9 downto 0));
end USR_10;

architecture action of USR_10 is
signal reg : bit_vector(9 downto 0);
signal sel : bit_vector(1 downto 0);
begin
sel <= S1 & S0;
process(clk, clrb)
begin
if (clrb = '0') then
reg <= "0000000001";
elsif (clk'event and clk = '1') then
case sel is
	when "00" => reg <= reg;
	when "01" => reg <= reg(8 downto 0) & S_L;
	when "10" => reg <= S_R & reg(9 downto 1);
	when others => reg <= load;
end case;
end if;
end process;
O <= reg;
end action; 
