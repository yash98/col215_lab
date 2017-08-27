library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity operand_valid is
    port ( 
        a, b: in std_logic_vector (0 to 7)
        op_valid: out bit
        );
end entity;

architecture behavioural of operand_valid is
    signal nine std_logic_vector (0 to 3) := "1001";
begin
    if (a(0 to 3) = nine and a(4 to 7) = nine and b(0 to 3) = nine and b(4 to 7) = nine) then
        op_valid <= '1';
    else op_valid <= '0';
    end if;
end architecture behavioural; 