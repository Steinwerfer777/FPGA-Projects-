library ieee;
use ieee.numeric_std.all;

entity CNT_4 is
port(clk, clrb, ld : in std_logic;
	  I : in std_logic_vector (3 downto 0);
	  O : out std_logic_vector (3 downto 0));
end CNT_4;

architecture action of CNT_4 is
signal cnt : unsigned (3 downto 0);
begin
	process (clk, clrb)
	if (clrb = '0') then
		cnt <= "0000"
	elsif (clk'event and clk = '1') then
		if (ld = '1') then
				cnt <= unsigned(I);
		else
				cnt <= cnt + "1";
		end if;
	end if;
end process;
		
O <= std_logic_vector(cnt);
end action; 
	  
