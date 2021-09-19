entity SM is 
	port (x, clk : in bit;
			y, QA, QB : out bit);
end SM;

architecture action of SM is
	component FF_JK is 
	port (J, K, clk: in bit;
			Q, Qn : out bit);
	end component;
	
signal J1, K1, Q1, Qn1, J0, K0, Q0, Qn0 : bit;

begin
J1 <= Q0;
K1 <= Qn0;
J0 <= Q1 xnor x;
K0 <= Q1 xnor x;
y <= Q1 xnor Q0 xnor x;
QA <= Q1;
QB <= Q0;

JKA: FF_JK port map (J1, K1, clk, Q1, Qn1);
JKB: FF_JK port map (J0, K0, clk, Q0, Qn0);
end action;  
