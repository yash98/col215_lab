library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity halfhertz is
    port (
        clk: in std_logic;
		  pb: in std_logic;
        mod_clk: out std_logic
    );
end entity;

architecture beh of halfhertz is
    signal t1: bit:= '0';
	 signal t2: bit:= '0';
    signal eoc2: std_logic_vector (0 to 27) := "1011111010111100001000000000";
	 signal eoc1: std_logic_vector (0 to 27) := "0000000000001111111111111111";
    signal c1: std_logic_vector (0 to 27) := "0000000000000000000000000000";
	 signal c2: std_logic_vector (0 to 27) := "0000000000000000000000000000";
    begin
        process(clk, clk'event, pb)
            begin
					if (pushbutton = '1') then
						  mod_clk <= clk;
					else
						 if c2 = eoc2 then
							  c2 <= "0000000000000000000000000001";
							  t2 <= not t2;
						 else c2 <= c2 + "0000000000000000000000000001";
						 end if;
						 mod_clk <= t2;
					end if;
        end process;
end architecture beh;
        
