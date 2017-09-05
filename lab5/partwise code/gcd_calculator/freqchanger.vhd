library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity freqchanger is
    port (
        clk: in bit;
        pushbutton: in bit;
        modified_clk: out bit
    );
end entity;

architecture beh of freqchanger is
    signal t: bit := '0';
    signal eoc: std_logic_vector (0 to 15) := "1111111111111111";
    signal c: std_logic_vector (0 to 15) := "0000000000000000";
    begin
        process(clk, clk'event)
            begin
                if (pushbutton = '1') then
                    if c = eoc then
                        c <= "0000000000000000";
                        t <= not t;
                    else c <= c + "0000000000000001";
                    end if;
                    modified_clk <= t;
            else
                modified_clk <= clk;
            end if;
        end process;
end architecture beh;