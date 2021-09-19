library ieee;
use ieee.numeric_bit.all;

entity Lab5 is 
port(clk_50, rstb : in bit;
	  key : in bit_vector(3 downto 0);
	  LEDR : out bit_vector(9 downto 0));
end Lab5;

architecture action of Lab5 is
component CNT_3 is
	port(clk, clrb, ld : in bit;
		load : in unsigned (2 downto 0);
		O : out bit_vector(2 downto 0));
end component; 

component USR_10 is
port(S1, S0, S_L, S_R, clk, clrb : in bit;
	load : in bit_vector(9 downto 0);
	O : out bit_vector(9 downto 0));
end component; 

type state_type is (idle, SIL, SIR);
signal load_CNT, S1, S0, S_L, S_R, clk_V : bit;
signal current_state, next_state : state_type;
signal LEDR_in, LEDR_vals : bit_vector(9 downto 0);
signal CNT_vals : bit_Vector(2 downto 0);
signal CNT_in : unsigned(2 downto 0);
begin
LEDR_in <= "0000000000";
CNT_in <= "000";
cnt0: CNT_3 port map (clk_50, rstb, load_cnt, CNT_in, CNT_vals);
USR0: USR_10 port map (key(3), key(2), S_L, S_R, clk_50, rstb, LEDR_in, LEDR_vals);
S_L <= LEDR_vals(9);
S_R <= LEDR_vals(0);
clk_V <= CNT_vals(2) and CNT_vals(0);
LEDR <= LEDR_vals;

--State Machine Going Forward. Grease Up Anus -- 
process(clk_50, rstb)
begin
if (rstb = '0') then
	current_state <= idle;
elsif (clk_50'event and clk_50 = '1') then
	current_state <= next_state;
end if;
end process;

--Next State --
process(current_state, key, clk_V)
begin
load_CNT <= '0';
case current_state is
	when idle =>	
		if (key(1) = '1') then
		next_state <= SIL;
		S1 <= '1';
		S0 <= '1';
		load_cnt <= '1';
		else
			next_state <= idle;
	end if;
	when SIL =>
		S0 <= '1';
		if (key(0) = '0') then
			next_state <= idle;
		else
			if((clk_V = '1') or (key(3) = '0')) then
			next_state <= SIR;
			load_cnt <= '1';
			else 
			next_state <= SIL; 
			end if;
		end if;
		when SIR =>
			S1 <= '1';
			if (key(0) = '0') then
				next_state <= idle;
			else
				if ((clk_V = '1') or (key(2) = '0')) then
				next_state <= SIL;
				load_cnt <= '1';
				else
					next_state <= SIR;
				end if;
			end if;
		when others =>
			next_state <= idle;
		end case;
end process;
end action; 