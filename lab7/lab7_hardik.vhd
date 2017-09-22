-- 2s complement
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


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
    ci: in std_logic;
    co: out std_logic;
    so: out std_logic_vector(7 downto 0)
    );
end entity;

architecture beh of subtractor is

signal cint: std_logic_vector(6 downto 0);
signal zero: std_logic:= '0';

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
                co => co 
            ); 
          end generate top_subtractor;
      end generate subtractor;
 
 end architecture;
