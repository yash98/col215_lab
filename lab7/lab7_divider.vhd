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



--subtractor bit component

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fsub is
	port(
		a, b, ci: in std_logic;
		s, co: out std_logic
	);
end entity;

architecture beh of fsub is
begin
    s <= a xor b xor ci;
    co <= ((not a) and b) or ((not a) and ci) or (b and ci);
    
end architecture;



--subtractor

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity subtractor is
    port(
    a, b: in std_logic_vector(7 downto 0);
    so: out std_logic_vector(7 downto 0)
    );
end entity;

architecture beh of subtractor is

signal cint: std_logic_vector(6 downto 0);
signal zero: std_logic:= '0';
signal dummy: std_logic;

component fsub
    port(
        a,b,ci: in std_logic;
        s,co: out std_logic
    );
end component;

begin
    subtractor: for I in 0 to 7 generate
    
        lowest_subtractor: if I=0 generate
            s0: fsub port map(
                a => a(I),
                b => b(I),
                ci => zero,
                s => so(I),
                co => cint(I)
             );
         end generate lowest_subtractor;
         
         upper_subtractor: if (I>0 and I<7) generate
            sx: fsub port map(
                a => a(I),
                b => b(I),
                ci => cint(I-1),
                s => so(I),
                co => cint(I)
             );
          end generate upper_subtractor;
             
          top_subtractor: if I=7 generate
            st: fsub port map(
                a => a(I),
                b => b(I),
                ci => cint(I-1),
                s => so(I),
                co => dummy
            ); 
          end generate top_subtractor;
      end generate subtractor;
 
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
signal a: std_logic_vector(7 downto 0);
signal r: std_logic_vector(15 downto 0) := "0000000000000000";
signal b: std_logic_vector(7 downto 0);
signal i1: std_logic_vector(7 downto 0);
signal i2: std_logic_vector(7 downto 0);
signal o: std_logic_vector(7 downto 0);

component twoc is
    port (
    e: in std_logic;
    i: in std_logic_vector(7 downto 0);
    c: out std_logic_vector(7 downto 0)
    );
end component;

component subtractor is
    port(
    a, b: in std_logic_vector(7 downto 0);
    so: out std_logic_vector(7 downto 0)
    );
end component;

begin
    sign <= dividend(7) & divisor(7);
    firstcompdividend: twoc port map (
        e => dividend(7),
        i => dividend,
        c => a
    );
    
    firstcompdivisor: twoc port map (
        e => divisor(7),
        i => divisor,
        c => b
    );
    
    sub: subtractor port map(
        a => i1,
        b => i2,
        so => o
        );
    
    
    process(load)
    begin
        if (load = '1') then
            r(7 downto 0) <= a;
        end if;
        for i in 0 to 6 loop
            r(15 downto 0) <= r(14 downto 0) & "0";
            if (b<=r(15 downto 8)) then
                i1 <= r(15 downto 8);
                i2 <= b;
                r(15 downto 8) <= o;
                r(0) <= '1';
            end if;
        end loop;
    end process;
    
    qoutient <= r(7 downto 0);
    remainder <= r(15 downto 8);
    
end architecture;
    