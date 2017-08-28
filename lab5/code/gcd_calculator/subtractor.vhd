library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity subtractor is
    port (
        clk: in std_logic;
		  sub_i: in std_logic;
        a, b: in std_logic_vector (7 downto 0);
		  sub_o: out std_logic;
        a2, b2: out std_logic_vector (7 downto 0)
        );
end entity;

architecture behavioural of subtractor is
    begin
        process (clk, clk'event)
            begin
					if (sub_i = '1') then
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
							  sub_o <= '0';
						end if;
					end if;
    end process;
end architecture behavioural;
