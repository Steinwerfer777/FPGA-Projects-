library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DD is
port(clk, rst : in std_logic; 
	  H1 : in std_logic_vector(1 downto 0);
	  H0, M1, M0 : in std_logic_vector(3 downto 0);
		H1o, H0o, M1o, M0o : out std_logic_vector(6 downto 0));
end DD;

architecture action of DD is
signal clk_1 : std_logic; 
signal CNT_H, CNT_M, CNT_S : integer;
signal H1b, H0b, M1b, M0b : std_logic_vector (3 downto 0);
begin
process(clk_1, rst)
begin
if (rst = '0') then
CNT_H <= to_integer(unsigned(H1))*10 + to_integer(unsigned(H0));
CNT_M <= to_integer(unsigned(M1))*10 + to_integer(unsigned(M0));
CNT_S <= 0;
elsif(rising_edge(clk_1)) then
then CNT_S <= CNT_S + 1;
	if (CNT_S >= 59 or TOG_M = 0) then
	CNT_M <= CNT_M + 1;
	CNT_S <= 0;
	if (CNT_M >= 59 or TOG_H = 0) then
	CNT_M <= 0;
	CNT_S <= 0;
	CNT_H <= CNT_H + 1;
	if (CNT_H >= 24) then
	CNT_H <= 0;
end if;
end if;
end if;
end if;
end process;
H1b <= x"2" when CNT_H >= 20 else
		 x"1" when CNT_H >= 10 else
		 x"0";
Hour_1: SSD_LEDR port map(H1b, H1o);
H0b <= std_logic_vector(to_unsigned((CNT_H - to_integer(unsigned(H1b))*10),4));
Hour_2: SSD_LEDR port map(H0b, H0o);
M1b <= x"5" when CNT_M >= 50 else
		 x"4" when CNT_M >= 40 else
		 x"3" when CNT_M >= 30 else
		 x"2" when CNT_M >= 20 else
		 x"1" when CNT_M >= 10 else
		 x"0";
Min_1: SSD_LEDR port map(M1b, M1o);
M0b <= std_logic_vector(to_unsigned((CNT_M - to_integer(unsigned(M1b))*10),4));
Min_0: SSD_LEDR port map (M0b, M0o);
end action; 
 