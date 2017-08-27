library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity operand_valid is
    port (
        clk, sub: in bit;
        a, b: in std_logic_vector (0 downto 7);
        a2, b2: out std_logic_vector (0 downto 7)
        );
end entity;

architecture behavioural of operand_valid is
    -- IMP no sense of equality of a and b
    -- signal a_greater_than_b : boolean;
    -- if a (4 downto 7) > b (4 downto 7) and a (0 downto 3) > b (0 downto 3)
    begin
        process (clk, clk'event, sub)
            begin
                if (a > b) then
                    if a (0 downto 3) < b (0 downto 3) then
                        a2 <= a(0 downto 3) - b(0 downto 3) + "1010" & a(4 downto 7) - b(4 downto 7) - "0001";
                        b2 <= b;
                    else
                        a2 <= a(0 downto 3) - b(0 downto 3) & a(4 downto 7) - b(4 downto 7);
                        b2 <= b;
                    end if;
                elsif (b > a) then
                    if (a (0 downto 3) > b (0 downto 3)) then
                        b2 <= b(0 downto 3) - a(0 downto 3) + "1010" & b(4 downto 7) - a(4 downto 7) - "0001";
                        a2 <= a;
                    else
                        b2 <= b(0 downto 3) - a(0 downto 3) & b(4 downto 7) - a(4 downto 7);
                        a2 <= a;
                    end if;
                end if;
    end process;
end architecture behavioural;
