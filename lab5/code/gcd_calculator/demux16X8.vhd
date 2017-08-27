library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity demux16X8 is
    port (
            l: in bit;
            i0, i1: in std_logic_vector (0 to 7);
            o: out std_logic_vector (0 to 7)
    );
end entity;

architecture casestatement of demux16X8 is
begin
    with l select
        o <= i0 when '0',
             i1 when others;
end architecture casestatement;
