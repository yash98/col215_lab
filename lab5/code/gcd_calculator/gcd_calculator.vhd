-- gcd calculator

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity gcd_calculator is
    port (
        ai, bi: in std_logic_vector (7 downto 0);
        pushi, pb, clk: in bit;
        load, sub, op_valid: out bit;
        do: std_logic_vector (15 downto 0)
    );
end entity;

architecture beh of gcd_calculator is
    begin

