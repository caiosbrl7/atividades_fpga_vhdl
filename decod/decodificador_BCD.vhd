----------------------------------------------------------
entity decodificador_BCD is
    Port ( A, B, C, D : in bit;
           SA, SB, SC, SD, SE, SF, SG : out bit);
end decodificador_BCD;
----------------------------------------------------------
architecture arquitetura of decodificador_BCD is
begin
    SA <= not (A or C or (B xnor D));
    SB <= not ((not B) or (C xnor D));
    SC <= not (B or (not C) or D);
    SD <= not (A or ((not B) and (not D)) or ((not B) and C) or 
               (C and (not D)) or (B and (not C) and D));
    SE <= not (((not B) and (not D)) or (C and (not D)));
    SF <= not (A or ((not C) and (not D)) or (B and (not C)) or (B and (not D)));
    SG <= not (A or (B xor C) or (C and (not D)));
end arquitetura;
