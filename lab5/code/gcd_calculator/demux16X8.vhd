library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity demux16X8 is
    port (
            load_i, opv: in bit;
            sw, outofsub: in std_logic_vector (0 to 7);
            o: out std_logic_vector (0 to 7)
    );
end entity;

architecture casestatement of demux16X8 is
begin
    process(load_i, opv)
        begin
            if (load_i = '1') and (opv = '1') then
                o <= sw;
            else
                o <= outofsub;
            end if;
    end process;
end architecture casestatement;
