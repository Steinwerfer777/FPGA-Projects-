library ieee;
use ieee.numeric_bit.all;

entity NAND_simp is
port(A, B, C, D : in bit;
	  Z : out bit);
end NAND_simp;

architecture action of NAND_simp is
component NAND1 is
	port(A, B : in bit;
		  Y : out bit);
end component;
signal An, Bn, Cn, Dn : bit; -- Inverter 
signal AND1, AND2, AND3, AND4, AND5, AND6 : bit; -- AND gate from NAND 
signal OR1, OR2, OR3, OR4, OR5 : bit; -- OR gate from NAND
begin
not_A: NAND1 port map(A, A, An);
not_B: NAND1 port map(B, B, Bn);
not_C: NAND1 port map(C, C, Cn);
not_D: NAND1 port map(D, D, Dn);
AC1: NAND1 port map(An, Cn, AND1);
AC2: NAND1 port map(AND1, AND1, AND2); -- not A and not C 
BC1: NAND1 port map(B, C, AND3); 
BC2: NAND1 port map(AND3, AND3, AND4); -- BC
BD1: NAND1 port map(Bn, Dn, AND5);
BD2: NAND1 port map(AND5, AND5, AND6); -- Not B and not D
AC_BC1: NAND1 port map(AND2, AND2, OR1);
AC_BC2: NAND1 port map(AND4, AND4, OR2);
AC_BC3: NAND1 port map(OR1, OR2, OR3); -- not A and not C OR B and C
F_1: NAND1 port map(OR3, OR3, OR4); 
F_2: NAND1 port map(AND6, AND6, OR5); 
F: NAND1 port map(OR4, OR5, Z); -- F = not A and not C OR B and C OR not B and not D

end action; 
