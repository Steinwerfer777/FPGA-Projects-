library ieee;
use ieee.numeric_bit.all;

entity s_a is
port(A,B,C,D: in bit;
	  O : out bit);
end s_a;
architecture action of s_a is
	component NAND1 is
		port(A, B : in bit;
				Y : out bit);
	end component;
signal An, Bn, Cn, Dn : bit; -- Inverter
signal AC1, AC2, BD, BC, CD, AB : bit; 
signal f, g, i, j, p, q, l, m : bit; 
begin
not_A: NAND1 port map(A, A, An);
not_B: NAND1 port map(B, B, Bn);
not_C: NAND1 port map(C, C, Cn);
not_D: NAND1 port map(D, D, Dn);
AC_1: NAND1 port map (A, C, AC1); -- AC
AC_2: NAND1 port map (An, Cn, AC2); -- A'C'
B_D: NAND1 port map(Bn, Dn, BD); -- B'D'
B_C: NAND1 port map(B, C, BC); -- BC
C_D: NAND1 port map(C, Dn, CD); -- CD'
A_B: NAND1 port map(An, B, AB); -- A'B
f_1: NAND1 port map(AC1, AC2, f); --AC + A'C'
g_1: NAND1 port map(f, f, g); 
i_1: NAND1 port map(BC, BD, i); -- BC + B'D'
j_1: NAND1 port map(i, i, j); 
p_1: NAND1 port map(CD, AB, p); -- CD' + A'B
q_1: NAND1 port map(p,p,q);
l_1: NAND1 port map(j, q, l); -- BC + B'D' + CD' + A'B
m_1: NAND1 port map(l, l, m);
R: NAND1 port map(g, m, O); -- F = AC + A'C' + BC + B'D' + CD' + A'B
end action; 