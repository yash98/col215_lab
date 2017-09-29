-- seven segment

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB16CE_HXILINX_lab4_seven_segment_display is
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(15 downto 0);
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC
    );
end CB16CE_HXILINX_lab4_seven_segment_display;

architecture Behavioral of CB16CE_HXILINX_lab4_seven_segment_display is

  signal COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '1');

begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC  <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';
Q   <= COUNT;

end Behavioral;

----- CELL M4_1E_HXILINX_lab4_seven_segment_display -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M4_1E_HXILINX_lab4_seven_segment_display is

port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    D2  : in std_logic;
    D3  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic;
    S1  : in std_logic
  );
end M4_1E_HXILINX_lab4_seven_segment_display;

architecture M4_1E_HXILINX_lab4_seven_segment_display_V of M4_1E_HXILINX_lab4_seven_segment_display is
begin
  process (D0, D1, D2, D3, E, S0, S1)
  variable sel : std_logic_vector(1 downto 0);
  begin
    sel := S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "00" => O <= D0;
      when "01" => O <= D1;
      when "10" => O <= D2;
      when "11" => O <= D3;
      when others => NULL;
      end case;
    end if;
    end process;
end M4_1E_HXILINX_lab4_seven_segment_display_V;
----- CELL D2_4E_HXILINX_lab4_seven_segment_display -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D2_4E_HXILINX_lab4_seven_segment_display is

port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    E   : in std_logic
  );
end D2_4E_HXILINX_lab4_seven_segment_display;

architecture D2_4E_HXILINX_lab4_seven_segment_display_V of D2_4E_HXILINX_lab4_seven_segment_display is
  signal d_tmp : std_logic_vector(3 downto 0);
begin
  process (A0, A1, E)
  variable sel   : std_logic_vector(1 downto 0);
  begin
    sel := A1&A0;
    if( E = '0') then
    d_tmp <= "0000";
    else
      case sel is
      when "00" => d_tmp <= "0001";
      when "01" => d_tmp <= "0010";
      when "10" => d_tmp <= "0100";
      when "11" => d_tmp <= "1000";
      when others => NULL;
      end case;
    end if;
  end process;

    D3 <= d_tmp(3);
    D2 <= d_tmp(2);
    D1 <= d_tmp(1);
    D0 <= d_tmp(0);

end D2_4E_HXILINX_lab4_seven_segment_display_V;
----- CELL M2_1_HXILINX_lab4_seven_segment_display -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_lab4_seven_segment_display is

port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_lab4_seven_segment_display;

architecture M2_1_HXILINX_lab4_seven_segment_display_V of M2_1_HXILINX_lab4_seven_segment_display is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process;
end M2_1_HXILINX_lab4_seven_segment_display_V;
----- CELL CB2CE_HXILINX_lab4_seven_segment_display -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB2CE_HXILINX_lab4_seven_segment_display is

port (
    CEO  : out STD_LOGIC;
    Q0   : out STD_LOGIC;
    Q1   : out STD_LOGIC;
    TC   : out STD_LOGIC;
    C    : in STD_LOGIC;
    CE   : in STD_LOGIC;
    CLR  : in STD_LOGIC
    );
end CB2CE_HXILINX_lab4_seven_segment_display;

architecture Behavioral of CB2CE_HXILINX_lab4_seven_segment_display is

  signal COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '1');

begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC   <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO  <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';

Q1 <= COUNT(1);
Q0 <= COUNT(0);

end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity clocker_MUSER_lab4_seven_segment_display is
   port ( c         : in    std_logic;
          pb        : in    std_logic;
          an_notinv : out   std_logic_vector (3 downto 0));
end clocker_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of clocker_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   signal slow_clock : std_logic_vector (15 downto 0);
   signal XLXN_4     : std_logic;
   signal XLXN_5     : std_logic;
   signal XLXN_9     : std_logic;
   signal XLXN_10    : std_logic;
   signal XLXN_11    : std_logic;
   signal XLXN_12    : std_logic;
   signal XLXN_13    : std_logic;
   signal XLXN_14    : std_logic;
   component M2_1_HXILINX_lab4_seven_segment_display
      port ( D0 : in    std_logic;
             D1 : in    std_logic;
             S0 : in    std_logic;
             O  : out   std_logic);
   end component;

   component CB16CE_HXILINX_lab4_seven_segment_display
      port ( C   : in    std_logic;
             CE  : in    std_logic;
             CLR : in    std_logic;
             CEO : out   std_logic;
             Q   : out   std_logic_vector (15 downto 0);
             TC  : out   std_logic);
   end component;

   component CB2CE_HXILINX_lab4_seven_segment_display
      port ( C   : in    std_logic;
             CE  : in    std_logic;
             CLR : in    std_logic;
             CEO : out   std_logic;
             Q0  : out   std_logic;
             Q1  : out   std_logic;
             TC  : out   std_logic);
   end component;

   component D2_4E_HXILINX_lab4_seven_segment_display
      port ( A0 : in    std_logic;
             A1 : in    std_logic;
             E  : in    std_logic;
             D0 : out   std_logic;
             D1 : out   std_logic;
             D2 : out   std_logic;
             D3 : out   std_logic);
   end component;

   attribute HU_SET of XLXI_2 : label is "XLXI_2_0";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_1";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_2";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_3";
begin
   XLXN_4 <= '0';
   XLXN_5 <= '1';
   XLXN_10 <= '1';
   XLXN_11 <= '0';
   XLXN_14 <= '1';
   XLXI_2 : M2_1_HXILINX_lab4_seven_segment_display
      port map (D0=>slow_clock(15),
                D1=>c,
                S0=>pb,
                O=>XLXN_9);

   XLXI_4 : CB16CE_HXILINX_lab4_seven_segment_display
      port map (C=>c,
                CE=>XLXN_5,
                CLR=>XLXN_4,
                CEO=>open,
                Q(15 downto 0)=>slow_clock(15 downto 0),
                TC=>open);

   XLXI_7 : CB2CE_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_9,
                CE=>XLXN_10,
                CLR=>XLXN_11,
                CEO=>open,
                Q0=>XLXN_12,
                Q1=>XLXN_13,
                TC=>open);

   XLXI_10 : D2_4E_HXILINX_lab4_seven_segment_display
      port map (A0=>XLXN_12,
                A1=>XLXN_13,
                E=>XLXN_14,
                D0=>an_notinv(3),
                D1=>an_notinv(2),
                D2=>an_notinv(1),
                D3=>an_notinv(0));

end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity c6_MUSER_lab4_seven_segment_display is
   port ( bin : in    std_logic_vector (3 downto 0);
          c6  : out   std_logic);
end c6_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of c6_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   component OR3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";

   component AND4B1
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";

   component AND4B2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";

   component AND3B3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B3 : component is "BLACK_BOX";

begin
   XLXI_1 : OR3
      port map (I0=>XLXN_16,
                I1=>XLXN_15,
                I2=>XLXN_14,
                O=>c6);

   XLXI_2 : AND4B1
      port map (I0=>bin(3),
                I1=>bin(2),
                I2=>bin(1),
                I3=>bin(0),
                O=>XLXN_14);

   XLXI_3 : AND4B2
      port map (I0=>bin(0),
                I1=>bin(1),
                I2=>bin(2),
                I3=>bin(3),
                O=>XLXN_15);

   XLXI_4 : AND3B3
      port map (I0=>bin(3),
                I1=>bin(2),
                I2=>bin(1),
                O=>XLXN_16);

end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity c5_MUSER_lab4_seven_segment_display is
   port ( bin : in    std_logic_vector (3 downto 0);
          c5  : out   std_logic);
end c5_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of c5_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   component OR4
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";

   component AND4B3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";

   component AND4B1
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";

   component AND3B2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";

begin
   XLXI_1 : OR4
      port map (I0=>XLXN_19,
                I1=>XLXN_20,
                I2=>XLXN_21,
                I3=>XLXN_22,
                O=>c5);

   XLXI_2 : AND4B3
      port map (I0=>bin(0),
                I1=>bin(3),
                I2=>bin(2),
                I3=>bin(1),
                O=>XLXN_22);

   XLXI_3 : AND4B1
      port map (I0=>bin(3),
                I1=>bin(2),
                I2=>bin(1),
                I3=>bin(0),
                O=>XLXN_21);

   XLXI_4 : AND4B1
      port map (I0=>bin(1),
                I1=>bin(2),
                I2=>bin(3),
                I3=>bin(0),
                O=>XLXN_20);

   XLXI_5 : AND3B2
      port map (I0=>bin(3),
                I1=>bin(2),
                I2=>bin(0),
                O=>XLXN_19);

end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity c4_MUSER_lab4_seven_segment_display is
   port ( bin : in    std_logic_vector (3 downto 0);
          c4  : out   std_logic);
end c4_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of c4_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   component OR3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";

   component AND4B3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";

   component AND4B2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";

   component AND2B1
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";

begin
   XLXI_1 : OR3
      port map (I0=>XLXN_15,
                I1=>XLXN_14,
                I2=>XLXN_13,
                O=>c4);

   XLXI_2 : AND4B3
      port map (I0=>bin(0),
                I1=>bin(1),
                I2=>bin(3),
                I3=>bin(2),
                O=>XLXN_13);

   XLXI_3 : AND4B2
      port map (I0=>bin(1),
                I1=>bin(2),
                I2=>bin(3),
                I3=>bin(0),
                O=>XLXN_14);

   XLXI_4 : AND2B1
      port map (I0=>bin(3),
                I1=>bin(0),
                O=>XLXN_15);

end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity c3_MUSER_lab4_seven_segment_display is
   port ( bin : in    std_logic_vector (3 downto 0);
          c3  : out   std_logic);
end c3_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of c3_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   component OR4
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";

   component AND4B3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";

   component AND4B2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";

   component AND3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";

begin
   XLXI_1 : OR4
      port map (I0=>XLXN_22,
                I1=>XLXN_21,
                I2=>XLXN_20,
                I3=>XLXN_19,
                O=>c3);

   XLXI_2 : AND4B3
      port map (I0=>bin(0),
                I1=>bin(1),
                I2=>bin(3),
                I3=>bin(2),
                O=>XLXN_19);

   XLXI_3 : AND4B3
      port map (I0=>bin(3),
                I1=>bin(2),
                I2=>bin(1),
                I3=>bin(0),
                O=>XLXN_20);

   XLXI_4 : AND4B2
      port map (I0=>bin(0),
                I1=>bin(2),
                I2=>bin(3),
                I3=>bin(1),
                O=>XLXN_21);

   XLXI_5 : AND3
      port map (I0=>bin(2),
                I1=>bin(1),
                I2=>bin(0),
                O=>XLXN_22);

end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity c2_MUSER_lab4_seven_segment_display is
   port ( bin : in    std_logic_vector (3 downto 0);
          c2  : out   std_logic);
end c2_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of c2_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   component OR3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";

   component AND4B2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";

   component AND4B3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";

   component AND3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";

begin
   XLXI_1 : OR3
      port map (I0=>XLXN_16,
                I1=>XLXN_15,
                I2=>XLXN_14,
                O=>c2);

   XLXI_2 : AND4B2
      port map (I0=>bin(0),
                I1=>bin(1),
                I2=>bin(2),
                I3=>bin(3),
                O=>XLXN_14);

   XLXI_3 : AND4B3
      port map (I0=>bin(0),
                I1=>bin(2),
                I2=>bin(3),
                I3=>bin(1),
                O=>XLXN_15);

   XLXI_4 : AND3
      port map (I0=>bin(3),
                I1=>bin(1),
                I2=>bin(2),
                O=>XLXN_16);

end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity c1_MUSER_lab4_seven_segment_display is
   port ( bin : in    std_logic_vector (3 downto 0);
          c1  : out   std_logic);
end c1_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of c1_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   component AND4B2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";

   component AND3B1
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";

   component AND3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";

   component OR4
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";

begin
   XLXI_2 : AND4B2
      port map (I0=>bin(0),
                I1=>bin(1),
                I2=>bin(2),
                I3=>bin(3),
                O=>XLXN_19);

   XLXI_3 : AND4B2
      port map (I0=>bin(3),
                I1=>bin(1),
                I2=>bin(2),
                I3=>bin(0),
                O=>XLXN_20);

   XLXI_5 : AND3B1
      port map (I0=>bin(0),
                I1=>bin(1),
                I2=>bin(2),
                O=>XLXN_22);

   XLXI_8 : AND3
      port map (I0=>bin(3),
                I1=>bin(1),
                I2=>bin(0),
                O=>XLXN_21);

   XLXI_9 : OR4
      port map (I0=>XLXN_22,
                I1=>XLXN_21,
                I2=>XLXN_20,
                I3=>XLXN_19,
                O=>c1);

end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity c0_MUSER_lab4_seven_segment_display is
   port ( bin : in    std_logic_vector (3 downto 0);
          c0  : out   std_logic);
end c0_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of c0_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   component OR4
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";

   component AND4B3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";

   component AND4B1
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";

begin
   XLXI_1 : OR4
      port map (I0=>XLXN_21,
                I1=>XLXN_20,
                I2=>XLXN_19,
                I3=>XLXN_18,
                O=>c0);

   XLXI_2 : AND4B3
      port map (I0=>bin(3),
                I1=>bin(2),
                I2=>bin(1),
                I3=>bin(0),
                O=>XLXN_18);

   XLXI_3 : AND4B3
      port map (I0=>bin(0),
                I1=>bin(1),
                I2=>bin(3),
                I3=>bin(2),
                O=>XLXN_19);

   XLXI_4 : AND4B1
      port map (I0=>bin(1),
                I1=>bin(2),
                I2=>bin(3),
                I3=>bin(0),
                O=>XLXN_20);

   XLXI_5 : AND4B1
      port map (I0=>bin(2),
                I1=>bin(3),
                I2=>bin(1),
                I3=>bin(0),
                O=>XLXN_21);

end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity binto7_MUSER_lab4_seven_segment_display is
   port ( binary : in    std_logic_vector (3 downto 0);
          cat    : out   std_logic_vector (6 downto 0));
end binto7_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of binto7_MUSER_lab4_seven_segment_display is
   component c0_MUSER_lab4_seven_segment_display
      port ( bin : in    std_logic_vector (3 downto 0);
             c0  : out   std_logic);
   end component;

   component c1_MUSER_lab4_seven_segment_display
      port ( bin : in    std_logic_vector (3 downto 0);
             c1  : out   std_logic);
   end component;

   component c2_MUSER_lab4_seven_segment_display
      port ( bin : in    std_logic_vector (3 downto 0);
             c2  : out   std_logic);
   end component;

   component c3_MUSER_lab4_seven_segment_display
      port ( bin : in    std_logic_vector (3 downto 0);
             c3  : out   std_logic);
   end component;

   component c4_MUSER_lab4_seven_segment_display
      port ( bin : in    std_logic_vector (3 downto 0);
             c4  : out   std_logic);
   end component;

   component c5_MUSER_lab4_seven_segment_display
      port ( bin : in    std_logic_vector (3 downto 0);
             c5  : out   std_logic);
   end component;

   component c6_MUSER_lab4_seven_segment_display
      port ( bin : in    std_logic_vector (3 downto 0);
             c6  : out   std_logic);
   end component;

begin
   XLXI_1 : c0_MUSER_lab4_seven_segment_display
      port map (bin(3 downto 0)=>binary(3 downto 0),
                c0=>cat(0));

   XLXI_2 : c1_MUSER_lab4_seven_segment_display
      port map (bin(3 downto 0)=>binary(3 downto 0),
                c1=>cat(1));

   XLXI_3 : c2_MUSER_lab4_seven_segment_display
      port map (bin(3 downto 0)=>binary(3 downto 0),
                c2=>cat(2));

   XLXI_4 : c3_MUSER_lab4_seven_segment_display
      port map (bin(3 downto 0)=>binary(3 downto 0),
                c3=>cat(3));

   XLXI_5 : c4_MUSER_lab4_seven_segment_display
      port map (bin(3 downto 0)=>binary(3 downto 0),
                c4=>cat(4));

   XLXI_6 : c5_MUSER_lab4_seven_segment_display
      port map (bin(3 downto 0)=>binary(3 downto 0),
                c5=>cat(5));

   XLXI_7 : c6_MUSER_lab4_seven_segment_display
      port map (bin(3 downto 0)=>binary(3 downto 0),
                c6=>cat(6));

end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity encoder_MUSER_lab4_seven_segment_display is
   port ( x : in    std_logic_vector (3 downto 0);
          s : out   std_logic_vector (1 downto 0));
end encoder_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of encoder_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_4 : std_logic;
   signal XLXN_5 : std_logic;
   signal XLXN_7 : std_logic;
   signal XLXN_8 : std_logic;
   component OR2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";

   component AND4B3
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             I2 : in    std_logic;
             I3 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";

begin
   XLXI_3 : OR2
      port map (I0=>XLXN_5,
                I1=>XLXN_4,
                O=>s(0));

   XLXI_4 : OR2
      port map (I0=>XLXN_8,
                I1=>XLXN_7,
                O=>s(1));

   XLXI_7 : AND4B3
      port map (I0=>x(0),
                I1=>x(3),
                I2=>x(2),
                I3=>x(1),
                O=>XLXN_4);

   XLXI_8 : AND4B3
      port map (I0=>x(0),
                I1=>x(1),
                I2=>x(2),
                I3=>x(3),
                O=>XLXN_5);

   XLXI_9 : AND4B3
      port map (I0=>x(0),
                I1=>x(1),
                I2=>x(3),
                I3=>x(2),
                O=>XLXN_7);

   XLXI_10 : AND4B3
      port map (I0=>x(0),
                I1=>x(1),
                I2=>x(2),
                I3=>x(3),
                O=>XLXN_8);

end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux16X4_MUSER_lab4_seven_segment_display is
   port ( an : in    std_logic_vector (3 downto 0);
          be : in    std_logic_vector (15 downto 0);
          c  : out   std_logic_vector (3 downto 0));
end mux16X4_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of mux16X4_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   signal XLXN_38 : std_logic;
   signal XLXN_42 : std_logic_vector (1 downto 0);
   component M4_1E_HXILINX_lab4_seven_segment_display
      port ( D0 : in    std_logic;
             D1 : in    std_logic;
             D2 : in    std_logic;
             D3 : in    std_logic;
             E  : in    std_logic;
             S0 : in    std_logic;
             S1 : in    std_logic;
             O  : out   std_logic);
   end component;

   component encoder_MUSER_lab4_seven_segment_display
      port ( s : out   std_logic_vector (1 downto 0);
             x : in    std_logic_vector (3 downto 0));
   end component;

   attribute HU_SET of XLXI_1 : label is "XLXI_1_4";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_5";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_6";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_7";
begin
   XLXN_38 <= '1';
   XLXI_1 : M4_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>be(3),
                D1=>be(7),
                D2=>be(11),
                D3=>be(15),
                E=>XLXN_38,
                S0=>XLXN_42(0),
                S1=>XLXN_42(1),
                O=>c(3));

   XLXI_2 : M4_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>be(2),
                D1=>be(6),
                D2=>be(10),
                D3=>be(14),
                E=>XLXN_38,
                S0=>XLXN_42(0),
                S1=>XLXN_42(1),
                O=>c(2));

   XLXI_3 : M4_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>be(1),
                D1=>be(5),
                D2=>be(9),
                D3=>be(13),
                E=>XLXN_38,
                S0=>XLXN_42(0),
                S1=>XLXN_42(1),
                O=>c(1));

   XLXI_4 : M4_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>be(0),
                D1=>be(4),
                D2=>be(8),
                D3=>be(12),
                E=>XLXN_38,
                S0=>XLXN_42(0),
                S1=>XLXN_42(1),
                O=>c(0));

   XLXI_5 : encoder_MUSER_lab4_seven_segment_display
      port map (x(3 downto 0)=>an(3 downto 0),
                s(1 downto 0)=>XLXN_42(1 downto 0));

end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0);
          clk        : in    std_logic;
          pushbutton : in    std_logic;
          anode      : out   std_logic_vector (3 downto 0);
          cathode    : out   std_logic_vector (6 downto 0));
end lab4_seven_segment_display;

architecture BEHAVIORAL of lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal a_n_inv    : std_logic_vector (3 downto 0);
   signal XLXN_13    : std_logic_vector (3 downto 0);
   component mux16X4_MUSER_lab4_seven_segment_display
      port ( an : in    std_logic_vector (3 downto 0);
             be : in    std_logic_vector (15 downto 0);
             c  : out   std_logic_vector (3 downto 0));
   end component;

   component INV
      port ( I : in    std_logic;
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";

   component binto7_MUSER_lab4_seven_segment_display
      port ( binary : in    std_logic_vector (3 downto 0);
             cat    : out   std_logic_vector (6 downto 0));
   end component;

   component clocker_MUSER_lab4_seven_segment_display
      port ( an_notinv : out   std_logic_vector (3 downto 0);
             c         : in    std_logic;
             pb        : in    std_logic);
   end component;

begin
   XLXI_2 : mux16X4_MUSER_lab4_seven_segment_display
      port map (an(3 downto 0)=>a_n_inv(3 downto 0),
                be(15 downto 0)=>b(15 downto 0),
                c(3 downto 0)=>XLXN_13(3 downto 0));

   XLXI_4 : INV
      port map (I=>a_n_inv(0),
                O=>anode(0));

   XLXI_5 : INV
      port map (I=>a_n_inv(1),
                O=>anode(1));

   XLXI_6 : INV
      port map (I=>a_n_inv(2),
                O=>anode(2));

   XLXI_7 : INV
      port map (I=>a_n_inv(3),
                O=>anode(3));

   XLXI_8 : binto7_MUSER_lab4_seven_segment_display
      port map (binary(3 downto 0)=>XLXN_13(3 downto 0),
                cat(6 downto 0)=>cathode(6 downto 0));

   XLXI_10 : clocker_MUSER_lab4_seven_segment_display
      port map (c=>clk,
                pb=>pushbutton,
                an_notinv(3 downto 0)=>a_n_inv(3 downto 0));

end BEHAVIORAL;


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
signal co : std_logic_vector(7 downto 0);
begin
co <= not i + "00000001";
c <= i when e = '0' else
    co when e = '1';
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
signal a2: std_logic_vector(7 downto 0);
signal b2: std_logic_vector(7 downto 0);
signal ipvint: std_logic;

signal r: std_logic_vector(13 downto 0):= "00000000000000";
signal diff: std_logic_vector(6 downto 0);

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
    
    
    end2cdividend: twoc port map (
        e => signout(1),
        i => r(13 downto 7),
        c => a2
    );
    
    end2cdivisor: twoc port map (
        e => signout(0),
        i => r(6 downto 0),
        c => b2
    );
    
    ipvint <= '0' when divisor = "00000000" else
                '1';
        
    diff <= r(13 downto 7) - b(6 downto 0);
    
    process(clock)
    variable state: std_logic_vector(1 downto 0):= "00";
    variable c: std_logic_vector(2 downto 0);
    begin
        if ((clock = '1') and clock'event) then
            if (state = "11") then
                if (load = '1' and ipvint = '1') then
                    state := "00";
                end if;
                opvalid <= '0';
            elsif (state = "00") then
                if (load ='1' and ipvint = '1') then
                    r(13 downto 0) <= "000000" & a(6 downto 0) & "0";
                elsif (load ='0') then
                    state := "01";
                elsif (load ='1' and ipvint = '0') then
                    state := "11";
                end if;
                c := "000";
                opvalid <= '0';
            elsif (state = "01") then
                if (load ='0' or ((load = '1') and (ipvint = '0'))) then
                    if ((("000" < c) or ("000" = c)) and (c < "110")) then
                        if ((r(13 downto 7) > b(6 downto 0)) or (r(13 downto 7) = b(6 downto 0))) then
                            r(13 downto 0) <= diff(5 downto 0) & r(6 downto 0) & "0";
                            r(1) <= '1';
                        else
                            r(13 downto 0) <= r(12 downto 0) & "0";
                        end if;
                        c := c + "001";
                    elsif (c = "110") then
                        if ((r(13 downto 7) > b(6 downto 0)) or (r(13 downto 7) = b(6 downto 0))) then
                            r(13 downto 0) <= diff(6 downto 0) & r(6 downto 1) & "1";
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
                
    
    remainder <= a2;
    qoutient <= b2;
    inpinvalid <= not ipvint;
    
end architecture;

-- connection


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lab7_divider is
    port(
        clk: in std_logic;
        divisor: in std_logic_vector(7 downto 0);
        dividend: in std_logic_vector(7 downto 0);
        sim_mode: in std_logic;
        output_valid: out std_logic;
        input_invalid: out std_logic;
        load_inputs: in std_logic;
        anode: out std_logic_vector(3 downto 0);
        cathode: out std_logic_vector(6 downto 0)
    );
end entity;

architecture beh of lab7_divider is
signal p: std_logic_vector(15 downto 0);
signal r: std_logic_vector(7 downto 0);
signal q: std_logic_vector(7 downto 0);

component lab4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0);
          clk        : in    std_logic;
          pushbutton : in    std_logic;
          anode      : out   std_logic_vector (3 downto 0);
          cathode    : out   std_logic_vector (6 downto 0));
end component;

component div is
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
end component;


begin
    divide: div port map(
        clock => clk,
        divisor => divisor,
        dividend => dividend,
        load => load_inputs,
        opvalid => output_valid,
        inpinvalid => input_invalid,
        qoutient => q,
        remainder => r
    );
    
    p <= q&r;
        
    ss: lab4_seven_segment_display  port map (
        b => p,
        clk => clk,
        pushbutton => sim_mode,
        anode => anode,
        cathode => cathode
    );

end architecture;
