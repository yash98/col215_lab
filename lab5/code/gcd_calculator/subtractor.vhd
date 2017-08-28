library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity operand_valid is
    port (
        clk: in std_logic;
        sub_i: in std_logic;
        a, b: in std_logic_vector (7 downto 0);
        sub_o: in std_logic;
        a2, b2: out std_logic_vector (7 downto 0)
        );
end entity;

architecture behavioural of operand_valid is
    -- IMP no sense of equality of a and b
    -- signal a_greater_than_b : boolean;
    -- if a (4 downto 7) > b (4 downto 7) and a (0 downto 3) > b (0 downto 3)
    begin
        process (clk, clk'event)
            begin
                if (a > b) then
                    if a (3 downto 0) < b (3 downto 0) then
                        a2 <= a(7 downto 4) - b(7 downto 4) - "0001" & a(3 downto 0) - b(3 downto 0) + "1010";
                        b2 <= b;
                    else
                        a2 <= a(7 downto 4) - b(7 downto 4) & a(3 downto 0) - b(3 downto 0);
                        b2 <= b;
                    end if;
                elsif (b > a) then
                    if (a (3 downto 0) > b (3 downto 0)) then
                        b2 <= b(7 downto 4) - a(7 downto 4) - "0001" & b(3 downto 0) - a(3 downto 0) + "1010";
                        a2 <= a;
                    else
                        b2 <= b(7 downto 4) - a(7 downto 4) & b(3 downto 0) - a(3 downto 0);
                        a2 <= a;
                    end if;
                elsif (b = a) then
                    sub_o <= '0'; -- keep
                end if;
    end process;
end architecture behavioural;
