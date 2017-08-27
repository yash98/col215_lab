library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity halfhertz is
    port (
        clk: in bit;
        half_hertz: out bit
    );
end entity;

architecture beh of halfhertz is
    signal t: bit:= '0';
    signal eoc: std_logic_vector (0 to 27) := "0101111101011110000100000000";
    signal c: std_logic_vector (0 to 27) := "0000000000000000000000000000";
    begin
        process(clk, clk'event)
            begin
                if c = eoc then
                    c <= "0000000000000000000000000000";
                    t <= not t;
                else c <= c + "0000000000000000000000000001";
                end if;
                half_hertz <= t;
        end process;
end architecture beh;
        
