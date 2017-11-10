-- ssd display

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


-----------------------------------------------------------------------
-- single port atand alone bram controller
-- 16 breath 16 depth
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bram_wrapper is
  port (
    BRAM_PORTA_addr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_PORTA_clk : in STD_LOGIC;
    BRAM_PORTA_din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    BRAM_PORTA_dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    BRAM_PORTA_en : in STD_LOGIC;
    BRAM_PORTA_we : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end bram_wrapper;

architecture STRUCTURE of bram_wrapper is
  component bram is
  port (
    BRAM_PORTA_addr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_PORTA_clk : in STD_LOGIC;
    BRAM_PORTA_din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    BRAM_PORTA_dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    BRAM_PORTA_en : in STD_LOGIC;
    BRAM_PORTA_we : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component bram;
begin
bram_i: component bram
     port map (
      BRAM_PORTA_addr(3 downto 0) => BRAM_PORTA_addr(3 downto 0),
      BRAM_PORTA_clk => BRAM_PORTA_clk,
      BRAM_PORTA_din(15 downto 0) => BRAM_PORTA_din(15 downto 0),
      BRAM_PORTA_dout(15 downto 0) => BRAM_PORTA_dout(15 downto 0),
      BRAM_PORTA_en => BRAM_PORTA_en,
      BRAM_PORTA_we(0) => BRAM_PORTA_we(0)
    );
end STRUCTURE;
---------------------------------------------------------------------
-- crc computation

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity crc is
port (
        clk: in std_logic;
        pb1: in std_logic; --load
        pb2: in std_logic; --reset
        pb3: in std_logic; --start
        pb4: in std_logic; --5th word 7th bit
        pb5: in std_logic; --3rd word 12th bit
        
        -- dout of brams
        inp_bram_data: in std_logic_vector(15 downto 0);
        crc_bram_data: in std_logic_vector(15 downto 0);
        
        -- misc
        data_inp: in std_logic_vector(15 downto 0); -- input from switches
        crc_disp: out std_logic_vector(15 downto 0); -- display calculated crc on ssd from bram 2
        
        --din of bram / write this in brams
        wr_crc:out std_logic_vector(15 downto 0);
        wr_inp: out std_logic_vector(15 downto 0);
        

        done: out std_logic;
        reseting: out std_logic;
        started: out std_logic;
        reading: out std_logic;
        
        -- write enable
        we_inp: out std_logic_vector(0 downto 0);
        we_crc: out std_logic_vector(0 downto 0);
        
        --addr of brams
        addr_inp: out std_logic_vector(3 downto 0);
        addr_crc: out std_logic_vector(3 downto 0);
        
        -- special show case
        w_addr_inp_o: out std_logic_vector(3 downto 0);
        r_addr_inp_o: out std_logic_vector(3 downto 0);
        w_addr_crc_o: out std_logic_vector(3 downto 0)
    );
end crc;

architecture beh of crc is

signal int_inp: std_logic_vector(47 downto 0):="000000000000000000000000000000000000000000000000"; -- local storage for inp
signal crc: std_logic_vector(15 downto 0):="1111111111111111"; -- final value calculated
signal poly: std_logic_vector(15 downto 0):="0001000000100001"; -- 1021

signal w_inp_addr: std_logic_vector(3 downto 0):="0000"; -- write to inpit addr maintainer
signal w_crc_addr: std_logic_vector(3 downto 0):="0000"; -- write crc addr maintainer
signal r_inp_addr: std_logic_vector(3 downto 0):="0000"; -- read crc addr maintainer

signal start: std_logic:='0'; -- start crc comp
signal wait_read: std_logic:='0'; -- waiting indicator for reading delay

signal one: std_logic_vector(15 downto 0):="1111111111111111";
signal zero: std_logic_vector(15 downto 0):="0000000000000000";

signal c: std_logic_vector(1 downto 0):="00"; -- reading count
signal n: std_logic_vector(4 downto 0):="00000"; -- shifting cont(during crc comp)
signal shift: std_logic:='0'; -- to shift indicator
signal rsting: std_logic:='0'; -- indicator of reseting
signal rst_c: std_logic_vector(3 downto 0):="0000"; -- count of rsting

signal calc_pb: std_logic_vector(1 downto 0):="00"; -- calc triggerd through pb 3 or 4 or 5; 3=>"00" 4=>"01" 5=>"10"

begin

process(clk)
begin
    if rising_edge(clk) then
        we_inp <= "0";
        we_crc <= "0";
        
        if (rsting='1') then
            we_inp <= "1";
            we_crc <= "1";
            wr_crc <= "1111111111111111";
            wr_inp <= "1111111111111111";
            addr_inp <= rst_c;
            addr_crc <= rst_c;
            rst_c <= rst_c+"0001";
            if (rst_c="1111") then
                rsting <= '0';
            end if;
        else
            -- load inputs on ech press
            if (pb1='1' and wait_read='0') then
               addr_inp <= w_inp_addr;
               wr_inp <= data_inp;
               we_inp <= "1";
               w_inp_addr <= w_inp_addr+"0001";
            end if;
            
            -- reset 
            if (pb2='1') then
            
                w_inp_addr <= "0000";
                we_inp <= "0";
                
                w_crc_addr <= "0000";
                we_crc <= "0";
                
                r_inp_addr <= "0000";
                
                done <= '0';
                wait_read <= '0';
                start <= '0';
                shift <= '0';
                c <= "00";
                n <= "00000";
                crc <= "1111111111111111";
                
                rst_c <= "0000";
                rsting <= '1';
                -- check int signal settings
            end if;
            
            -- start crc comp of next addr
            if ((pb3='1' or pb4='1' or pb5='1') and start='0' and wait_read='0') then
            
                if (pb3='1') then
                addr_inp <= r_inp_addr;
                r_inp_addr <= r_inp_addr+"0001";
                calc_pb <= "00";
                
                elsif (pb4='1') then
                addr_inp <= "0100"; -- 11 index is 12 th word
                calc_pb <= "01";
                
                elsif (pb5='1') then
                addr_inp <= "0010"; -- 2 index is 3 rd word
                calc_pb <= "10";
                
                end if;
                
                we_inp <= "0";
                wait_read<='1';
                done <= '0';
            end if;
            
            -- read into local memory
            if (wait_read='1') then
                if (c<"10") then
                    c <= c+"01";
                else
                    start <= '1';
                    shift <= '0';
                    n <= "00000";
                    c <= "00";
                    wait_read <= '0';
                    
                    if (calc_pb="00") then
                        int_inp <= one & inp_bram_data & zero;
                        
                    elsif (calc_pb="01") then
                        int_inp <= one & inp_bram_data(15 downto 10) & not inp_bram_data(9) & inp_bram_data(8 downto 0) & zero;
                        -- modify 16-7=9 index 1st bit index 15
                    elsif (calc_pb="10") then
                        int_inp <= one & inp_bram_data(15 downto 5) & inp_bram_data(4) & inp_bram_data(3 downto 0) & zero;
                        -- modify 16-12=4 index 1st bit index 15
                    end if;
                end if;
            end if;
            
            -- start calculation
            if (start='1') then
                if (shift='1') then
                    int_inp <= int_inp(46 downto 0) & "0";
                    shift <= '0';
                else
                    if (int_inp(47)='1') then
                        int_inp <= (int_inp(47 downto 32) xor poly) & int_inp(31 downto 0);
                    end if;
                    shift <= '1';
                    n <= n + "00001";
                    -- 33rd xor has no shift sart to 0 crc displayed
                    if (n="10000") then
                        start <= '0';
                        crc <= int_inp(47 downto 32);
                        done <= '1';
                        wr_crc <= crc;
                        we_crc <= "1";
                        addr_crc <= w_crc_addr;
                        w_crc_addr <= w_crc_addr + "0001";
                    end if;
                end if;
            end if;
            
        end if;
    end if;
end process;

reseting <= rsting;
started <= start;
reading <= wait_read;
crc_disp <= crc;


w_addr_inp_o <= w_inp_addr;
r_addr_inp_o <= r_inp_addr;
w_addr_crc_o <= w_crc_addr;

end architecture;

-----------------------------------------
-- all combined crc_computation

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity crc_computation is
    port (
            switches: in std_logic_vector(15 downto 0);
            pb: in std_logic_vector(4 downto 0);
            clk: in std_logic;
            w_addr_inp: out std_logic_vector(3 downto 0);
            r_addr_inp: out std_logic_vector(3 downto 0);
            w_addr_crc: out std_logic_vector(3 downto 0);
            done: out std_logic;
            rsting: out std_logic;
            started: out std_logic;
            reading: out std_logic;
            
            anode: out std_logic_vector(3 downto 0);
            cathode: out std_logic_vector(6 downto 0)
    );
end crc_computation;

architecture beh of crc_computation is



component lab4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0); 
          clk        : in    std_logic; 
          pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0));
end component;


component bram_wrapper is
  port (
      BRAM_PORTA_addr : in STD_LOGIC_VECTOR ( 3 downto 0 );
      BRAM_PORTA_clk : in STD_LOGIC;
      BRAM_PORTA_din : in STD_LOGIC_VECTOR ( 15 downto 0 );
      BRAM_PORTA_dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
      BRAM_PORTA_en : in STD_LOGIC;
      BRAM_PORTA_we : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end component;

component crc is
port (
        clk: in std_logic;
        pb1: in std_logic; --load
        pb2: in std_logic; --reset
        pb3: in std_logic; --start
        pb4: in std_logic; --5th word 7th bit
        pb5: in std_logic; --3rd word 12th bit
        
        -- dout of brams
        inp_bram_data: in std_logic_vector(15 downto 0);
        crc_bram_data: in std_logic_vector(15 downto 0);
        
        -- misc
        data_inp: in std_logic_vector(15 downto 0); -- input from switches
        crc_disp: out std_logic_vector(15 downto 0); -- display calculated crc on ssd from bram 2
        
        --din of bram / write this in brams
        wr_crc:out std_logic_vector(15 downto 0);
        wr_inp: out std_logic_vector(15 downto 0);
        

        done: out std_logic;
        reseting: out std_logic;
        started: out std_logic;
        reading: out std_logic;
        
        -- write enable
        we_inp: out std_logic_vector(0 downto 0);
        we_crc: out std_logic_vector(0 downto 0);
        
        --addr of brams
        addr_inp: out std_logic_vector(3 downto 0);
        addr_crc: out std_logic_vector(3 downto 0);
        
        -- special show case
        w_addr_inp_o: out std_logic_vector(3 downto 0);
        r_addr_inp_o: out std_logic_vector(3 downto 0);
        w_addr_crc_o: out std_logic_vector(3 downto 0)
    );
end component;


signal one: std_logic_vector(0 downto 0):="1";
signal zero: std_logic_vector(0 downto 0):="0";

signal addr_inp_i: std_logic_vector(3 downto 0);
signal wr_inp_i: std_logic_vector(15 downto 0);
signal inp_bram_data_i: std_logic_vector(15 downto 0);
signal we_inp_i: std_logic_vector(0 downto 0);

signal addr_crc_i: std_logic_vector(3 downto 0);
signal wr_crc_i: std_logic_vector(15 downto 0);
signal crc_bram_data_i: std_logic_vector(15 downto 0);
signal we_crc_i: std_logic_vector(0 downto 0);

signal disp: std_logic_vector(15 downto 0);


begin

  bram_inp: bram_wrapper
      port map (
        BRAM_PORTA_addr  => addr_inp_i,
        BRAM_PORTA_clk => clk,
        BRAM_PORTA_din => wr_inp_i,
        BRAM_PORTA_dout => inp_bram_data_i,
        BRAM_PORTA_en => one(0),
        BRAM_PORTA_we => we_inp_i
      );

  bram_crc: bram_wrapper
      port map (
        BRAM_PORTA_addr  => addr_crc_i,
        BRAM_PORTA_clk => clk,
        BRAM_PORTA_din => wr_crc_i,
        BRAM_PORTA_dout => crc_bram_data_i,
        BRAM_PORTA_en => one(0),
        BRAM_PORTA_we => we_crc_i
      );

    crc_comp: crc
        port map (
            clk=> clk,
            pb1=> pb(0), --load
            pb2=> pb(1), --reset
            pb3=> pb(2), --start
            pb4=> pb(3), --5th word 7th bit
            pb5=> pb(4), --3rd word 12th bit
            
            -- dout of brams
            inp_bram_data=> inp_bram_data_i,
            crc_bram_data=> crc_bram_data_i,
            
            -- misc
            data_inp=> switches, -- input from switches
            crc_disp=> disp, -- display calculated crc on ssd from bram 2
            
            --din of bram / write this in brams
            wr_crc=> wr_crc_i,
            wr_inp=> wr_inp_i,
            
    
            done=> done,
            reseting=> rsting,
            started=> started,
            reading=> reading,
            
            -- write enable
            we_inp=> we_inp_i,
            we_crc=> we_crc_i,
            
            --addr of brams
            addr_inp=> addr_inp_i,
            addr_crc=> addr_crc_i,
            
            -- special show case
            w_addr_inp_o => w_addr_inp,
            r_addr_inp_o => r_addr_inp,
            w_addr_crc_o => w_addr_crc
        );
        
    display: lab4_seven_segment_display
        port map ( b  => disp, 
                  clk  => clk,
                  pushbutton => zero(0),
                  anode  => anode,
                  cathode => cathode
                  );

end architecture;