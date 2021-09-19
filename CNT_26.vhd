library ieee;
use ieee.numeric_std.all;

entity CNT_26 is
port(clk, clrb, ld : in std_logic;
	  I : in std_logic_vector (25 downto 0);
	  O : out std_logic_vector (25 downto 0);
	  clk_1 : out std_logic_vector);
end CNT_26;

architecture action of CNT_26 is
signal cnt : unsigned (25 downto 0);
begin
	process (clk, clrb)
	if (clrb = '0') then
		cnt <= "00000000000000000000000000"
		elsif (clk'event and clk = '1') then
			if (ld = '1') then
				cnt <= unsigned(I);
			else
				cnt <= cnt + "1";
			end if;
		end if;
		end process;
		
		O <= std_logic_vector(cnt);
		clk_1 <= '0' when cnt >= "10111110101111000001111111" else '1';
		end action; 
	  