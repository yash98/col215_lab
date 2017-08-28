library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity operand_valid is
    port ( 
        a, b: in std_logic_vector (7 downto 0);
        op_valid: out std_logic
        );
end entity;

architecture behavioural of operand_valid is
    signal ten: std_logic_vector (3 downto 0) := "1010";
begin
    process (a, b)
        begin
        if (a(3 downto 0) < ten and a(7 downto 4) < ten and b(3 downto 0) < ten and b(7 downto 4) < ten) then
            op_valid <= '1';
        else op_valid <= '0';
        end if;
    end process;
end architecture behavioural; 