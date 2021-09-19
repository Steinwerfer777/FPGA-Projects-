library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity CNT_3 is
	port(clk, clrb, ld : in std_logic;
		load : in unsigned(2 downto 0);
		O : out std_logic_vector(2 downto 0));
end CNT_3;

architecture action of CNT_3 is
signal cnt : unsigned(2 downto 0);
begin
process (clk, clrb)
begin
if (clrb = '0') then
	cnt <= "000";
elsif (clk'event and clk = '1') then
	if (ld = '1') then
		cnt <= load;
	else
		cnt <= cnt + "1";
	end if;
end if;
end process;

O <= std_logic_vector(cnt);
end action; 
