entity FF_JK is 
	port (J, K, clk: in bit;
			Q, Qn : out bit);
end FF_JK;

architecture action of FF_JK is 
signal TMP, Qe, QNe : bit;
begin
Q <= Qe;
Qn <= QNe;
process (clk)
begin
	if clk'event and clk = '1' then
		TMP <= (J and not Qe) or (not K and Qe);
	elsif clk'event and clk ='0' then
		Qe <= TMP;
		QNe <= not TMP;
end if;
end process;
end action;
