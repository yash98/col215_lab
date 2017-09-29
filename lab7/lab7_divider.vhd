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
    a: in std_logic_vector(7 downto 0);
    b: in std_logic_vector(7 downto 0);
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


-- division

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity div is
    port (
    clock: in std_logic;
    load: in std_logic;
    opvalid: out std_logic;
    inpinvalid: out std_logic;
    dividend: in std_logic_vector(7 downto 0);
    divisor: in std_logic_vector(7 downto 0);
    qoutient: out std_logic_vector(7 downto 0);
    remainder: out std_logic_vector(7 downto 0)
    );
end entity;

architecture beh of div is

signal signin: std_logic_vector(1 downto 0);
signal signout: std_logic_vector(1 downto 0);
signal a: std_logic_vector(7 downto 0);
signal b: std_logic_vector(7 downto 0);
signal ipvint: std_logic;

shared variable r: std_logic_vector(13 downto 0):= "00000000000000";

component twoc is
    port (
    e: in std_logic;
    i: in std_logic_vector(7 downto 0);
    c: out std_logic_vector(7 downto 0)
    );
end component;

begin
    signin <= dividend(7) & divisor(7);
    
    first2cdividend: twoc port map (
        e => dividend(7),
        i => dividend,
        c => a
    );
    
    first2cdivisor: twoc port map (
        e => divisor(7),
        i => divisor,
        c => b
    );
    
    ipvint <= '0' when divisor = "00000000" else
                '1';
                
   
    
    process(clock, load, ipvint)
    variable state: std_logic_vector(1 downto 0):= "11";
    variable c: std_logic_vector(2 downto 0);
    begin
        if ((clock = '1') and clock'event) then
            if (state = "11") then
                if (load = '1' and ipvint = '1') then
                    state := "00";
                end if;
            end if;
            if (state = "00") then
                if (load ='1' and ipvint = '1') then
                    r(13 downto 0) := "0000000" & a(6 downto 0);
                elsif (load ='0') then
                    state := "01";
                elsif (load ='1' and ipvint = '0') then
                    state := "11";
                end if;
                c := "000";
            end if;
            if (state = "01") then
                if (load ='0' or ((load = '1') and (ipvint = '0'))) then
                    if ((("000" < c) or ("000" = c)) and (c < "111")) then
                        r(13 downto 0) := r(12 downto 0) & "0";
                        if (r(13 downto 7) > b(6 downto 0)) then
                            r(13 downto 7) := r(13 downto 7) - b(6 downto 0);
                            r(0) := '1';
                        end if;
                        c := c + "001";
                    end if;
                    if (c = "111") then
                        opvalid <= '1';
                    end if;
                elsif ((load = '1') and (ipvint = '1')) then
                    state := "00";
                end if;
            end if;
        end if;
    end process;
    
    signout <= "00" when signin ="00" else
                "11" when signin ="10" else
                "01" when signin ="01" else
                "10" when signin ="11";
    
    remainder <= signout(1) & r(13 downto 7);
    qoutient <= signout(0) & r(6 downto 0);
    inpinvalid <= not ipvint;
    
end architecture;
    