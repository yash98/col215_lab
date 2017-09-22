-- 2s complement

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity twoc is
    port (
    e: in std_logic;
    i: in std_logic_vector(7 downto 0);
    c: out std_logic_vector(7 downto 0)
    );
end entity;

architecture beh of twoc is
begin
c <= i when e = '0' else
    "11111111" - i + "00000001" when e = '1';
end architecture;

-- division

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity div is
    port (
    load: in std_logic;
    dividend: in std_logic_vector(7 downto 0);
    divisor: in std_logic_vector(7 downto 0);
    qoutient: out std_logic_vector(7 downto 0);
    remainder: out std_logic_vector(7 downto 0)
    );
end entity;

architecture beh of div is

signal sign: std_logic_vector(1 downto 0);
signal a:

component twoc is
    port (
    e: in std_logic;
    i: in std_logic_vector(7 downto 0);
    c: out std_logic_vector(7 downto 0)
    );
end component;
begin
    sign <= dividend(7) & divisor(7);
    firstcompdividend: twoc port map (
    e => i(7);
    i => dividend;
    c => 
    );
    