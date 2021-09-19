entity test_SM is
end test_SM;

architecture test of test_SM is
	component SM is
	   port (x, clk : in bit;
			y, QA, QB : out bit);
	end component;
	
signal xi, clk, yo, QAo, QBo : bit;

begin
t2: SM port map (xi, clk, yo, QAo, QBo);

clk <= not clk after 5 ns;
xi <= QBo; 
end;
