entity counter_2 is 
port (E, x, clk : in bit;
		Y : out bit_vector (1 downto 0));
end entity;

architecture action of counter_2 is
	component FF_JK is
		port (J, K, clk: in bit;
			Q, Qn : out bit);
		end component;
		
signal J1, K1, Q1, Qn1, J0, K0, Q0, Qn0 : bit;

begin
J1 <= E and (Q0 xnor x);
K1 <= E and (Q0 xnor x);
J0 <= E;
K0 <= E;
Y(1) <= Q1;
Y(0) <= Q0;

JK1: FF_JK port map (J1, K1, clk, Q1, Qn1);
JK2: FF_JK port map (J0, K0, clk, Q0, Qn0);
end action;