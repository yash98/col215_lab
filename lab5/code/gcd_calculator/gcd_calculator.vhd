-- half hertz

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity halfhertz is
    port (
        clk: in bit;
        half_hertz: out bit
    );
end entity;

architecture beh of halfhertz is
    signal t: bit:= '0';
    signal eoc: std_logic_vector (0 to 27) := "1011111010111100001000000000";
    signal c: std_logic_vector (0 to 27) := "0000000000000000000000000000";
    begin
        process(clk, clk'event)
            begin
                if c = eoc then
                    c <= "0000000000000000000000000000";
                    t <= not t;
                else c <= c + "0000000000000000000000000001";
                end if;
                half_hertz <= t;
        end process;
end architecture beh;
        
-- opernad validator

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity operand_valid is
    port ( 
        a, b: in std_logic_vector (7 downto 0);
        sub_i: in std_logic := '0'; -- possible wrong default of
        op_valid, load_o: out std_logic
        );
end entity;

architecture behavioural of operand_valid is
    signal ten: std_logic_vector (3 downto 0) := "1010";
begin
    process (a, b, sub_i)
        begin
        if (a(3 downto 0) < ten and a(7 downto 4) < ten and b(3 downto 0) < ten and b(7 downto 4) < ten) then
            op_valid <= '1';
            -- if (sub_i = '0') then
            --     load <= '1';
            -- end if;
        else op_valid <= '0';
        end if;
    end process;
end architecture behavioural; 

-- subtractor

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

-- 8bit register

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY bit8_register IS
	PORT (
		clk: IN std_logic;
		sub_o: out std_logic;
		load_i: in std_logic;
		write: IN std_logic_vector (7 downto 0);
		read: OUT std_logic_vector (7 downto 0)
		  );
END ENTITY;

ARCHITECTURE beh OF bit8_register IS
	SIGNAL t: std_logic_vector (7 downto 0) := "00000000";
BEGIN
	PROCESS (clk, load_i)
	   BEGIN
		IF (clk = '1') AND (clk'EVENT) AND (load_i = '1') THEN
			t <= write;
			sub_o <= '1';
		END IF;
	END PROCESS;
	read <= t;
END ARCHITECTURE beh;

-- demux 16X8

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity demux16X8 is
    port (
            load_i, opv: in bit;
            sw, outofsub: in std_logic_vector (0 to 7);
            o: out std_logic_vector (0 to 7)
    );
end entity;

architecture casestatement of demux16X8 is
begin
    process(load_i, opv)
        begin
            if (load_i = '1') and (opv = '1') then
                o <= sw;
            else
                o <= outofsub;
            end if;
    end process;
end architecture casestatement;

-- frequency changer

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity freqchanger is
    port (
        clk: in bit;
        pushbutton: in bit;
        modified_clk: out bit
    );
end entity;

architecture beh of freqchanger is
    signal t: bit := '0';
    signal eoc: std_logic_vector (0 to 15) := "1111111111111111";
    signal c: std_logic_vector (0 to 15) := "0000000000000000";
    begin
        process(clk, clk'event)
            begin
                if (pushbutton = '1') then
                    if c = eoc then
                        c <= "0000000000000000";
                        t <= not t;
                    else c <= c + "0000000000000001";
                    end if;
                    modified_clk <= t;
            else
                modified_clk <= clk;
            end if;
        end process;
end architecture beh;

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

