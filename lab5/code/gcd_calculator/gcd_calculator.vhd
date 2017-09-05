-- subtractor

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

-- operand_valid

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity operand_valid is
    port ( 
        a, b: in std_logic_vector (7 downto 0);
		  pb: in std_logic;
        op_valid, load_o: out std_logic
        );
end entity;

architecture behavioural of operand_valid is
    signal ten: std_logic_vector (3 downto 0) := "1010";
begin
    process (a, b, pb)
        begin
        if (a(3 downto 0) < ten and a(7 downto 4) < ten and b(3 downto 0) < ten and b(7 downto 4) < ten) then
            op_valid <= '1';
				if (pb = '1') then
					load_o <= '1';
				end if;
        else op_valid <= '0';
        end if;
    end process;
end architecture behavioural; 

-- halfhertz

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
    signal t1: std_logic:= '0';
	 signal t2: std_logic:= '0';
    signal eoc2: std_logic_vector (0 to 27) := "1011111010111100001000000000";
	 signal eoc1: std_logic_vector (0 to 27) := "0000000000001111111111111111";
    signal c1: std_logic_vector (0 to 27) := "0000000000000000000000000000";
	 signal c2: std_logic_vector (0 to 27) := "0000000000000000000000000000";
    begin
        process(clk, clk'event, pb)
            begin
					if (pb = '1') then
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

-- demux16X8

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity demux16X8 is
    port (
            load_i : in std_logic;
            sw: in std_logic_vector (0 to 7);
            outofsub: in std_logic_vector (0 to 7);
            o: out std_logic_vector (0 to 7)
    );
end entity;

architecture casestatement of demux16X8 is
begin
    process(load_i)
        begin
            if (load_i = '1') then
                o <= sw;
            else
                o <= outofsub;
            end if;
    end process;
end architecture casestatement;

-- bit8_register

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY bit8_register IS
	PORT (
		clk: IN std_logic;
		sub_o: out std_logic;
		write1: IN std_logic_vector (7 downto 0);
		read1: OUT std_logic_vector (7 downto 0)
		  );
END ENTITY;

ARCHITECTURE beh OF bit8_register IS
	SIGNAL t: std_logic_vector (7 downto 0) := "00000000";
BEGIN
	PROCESS (clk)
	   BEGIN
		IF (clk = '1') AND (clk'EVENT) THEN
			t <= write1;
			sub_o <= '1';
		END IF;
	END PROCESS;
	read1 <= t;
END ARCHITECTURE beh;

-- gcd

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity gcd_calculator is
   port ( a_i      : in    std_logic_vector (7 downto 0); 
          b_i      : in    std_logic_vector (7 downto 0); 
          clk      : in    std_logic; 
          pb       : in    std_logic; 
          push_i   : in    std_logic; 
          d_o      : out   std_logic_vector (15 downto 8); 
          d_0      : out   std_logic_vector (7 downto 0); 
          load     : out   std_logic; 
          op_valid : out   std_logic; 
          sub      : out   std_logic);
end gcd_calculator;

architecture BEHAVIORAL of gcd_calculator is
   signal XLXN_3     : std_logic;
   signal XLXN_16    : std_logic_vector (0 to 7);
   signal XLXN_17    : std_logic_vector (0 to 7);
   signal XLXN_40    : std_logic;
   signal XLXN_50    : std_logic_vector (0 to 7);
   signal XLXN_51    : std_logic_vector (0 to 7);
   signal d_0_DUMMY  : std_logic_vector (7 downto 0);
   signal load_DUMMY : std_logic;
   signal d_o_DUMMY  : std_logic_vector (15 downto 8);
   component bit8_register
      port ( clk    : in    std_logic; 
             write1 : in    std_logic_vector (7 downto 0); 
             sub_o  : out   std_logic; 
             read1  : out   std_logic_vector (7 downto 0));
   end component;
   
   component demux16X8
      port ( load_i   : in    std_logic; 
             sw       : in    std_logic_vector (0 to 7); 
             outofsub : in    std_logic_vector (0 to 7); 
             o        : out   std_logic_vector (0 to 7));
   end component;
   
   component halfhertz
      port ( clk     : in    std_logic; 
             pb      : in    std_logic; 
             mod_clk : out   std_logic);
   end component;
   
   component operand_valid
      port ( a        : in    std_logic_vector (7 downto 0); 
             b        : in    std_logic_vector (7 downto 0); 
             op_valid : out   std_logic; 
             load_o   : out   std_logic; 
             pb       : in    std_logic);
   end component;
   
   component subtractor
      port ( clk   : in    std_logic; 
             sub_i : in    std_logic; 
             a     : in    std_logic_vector (7 downto 0); 
             b     : in    std_logic_vector (7 downto 0); 
             a2    : out   std_logic_vector (7 downto 0); 
             b2    : out   std_logic_vector (7 downto 0); 
             sub_o : out   std_logic);
   end component;
   
begin
   d_o(15 downto 8) <= d_o_DUMMY(15 downto 8);
   d_0(7 downto 0) <= d_0_DUMMY(7 downto 0);
   load <= load_DUMMY;
   XLXI_2 : bit8_register
      port map (clk=>clk,
                write1(7 downto 0)=>XLXN_51(0 to 7),
                read1(7 downto 0)=>d_o_DUMMY(15 downto 8),
                sub_o=>XLXN_40);
   
   XLXI_3 : bit8_register
      port map (clk=>clk,
                write1(7 downto 0)=>XLXN_50(0 to 7),
                read1(7 downto 0)=>d_0_DUMMY(7 downto 0),
                sub_o=>open);
   
   XLXI_4 : demux16X8
      port map (load_i=>load_DUMMY,
                outofsub(0 to 7)=>XLXN_16(0 to 7),
                sw(0 to 7)=>a_i(7 downto 0),
                o(0 to 7)=>XLXN_51(0 to 7));
   
   XLXI_5 : demux16X8
      port map (load_i=>load_DUMMY,
                outofsub(0 to 7)=>XLXN_17(0 to 7),
                sw(0 to 7)=>b_i(7 downto 0),
                o(0 to 7)=>XLXN_50(0 to 7));
   
   XLXI_6 : halfhertz
      port map (clk=>clk,
                pb=>pb,
                mod_clk=>XLXN_3);
   
   XLXI_7 : operand_valid
      port map (a(7 downto 0)=>a_i(7 downto 0),
                b(7 downto 0)=>b_i(7 downto 0),
                pb=>push_i,
                load_o=>load_DUMMY,
                op_valid=>op_valid);
   
   XLXI_10 : subtractor
      port map (a(7 downto 0)=>d_o_DUMMY(15 downto 8),
                b(7 downto 0)=>d_0_DUMMY(7 downto 0),
                clk=>XLXN_3,
                sub_i=>XLXN_40,
                a2(7 downto 0)=>XLXN_16(0 to 7),
                b2(7 downto 0)=>XLXN_17(0 to 7),
                sub_o=>sub);
   
end BEHAVIORAL;


