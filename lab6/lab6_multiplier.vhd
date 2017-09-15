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

-- no carry adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ncadd is
	port(
		a, b, ci: in std_logic;
		s: out std_logic
	);
end entity;

architecture beh of ncadd is
begin
    s <= a xor b xor ci;
end architecture;


-- full adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fadd is
	port(
		a, b, ci: in std_logic;
		s, co: out std_logic
	);
end entity;

architecture beh of fadd is
begin
    s <= a xor b xor ci;
    co <= (a and b) or ((a or b) and ci);
end architecture;

-- carry propagate adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cpa is
    port(
    a, b: in std_logic_vector(7 downto 0);
    ci: in std_logic;
    co: out std_logic;
    so: out std_logic_vector(7 downto 0)
    );
end entity;

architecture beh of cpa is

signal cint: std_logic_vector(6 downto 0);

component fadd
	port(
		a, b, ci: in std_logic;
        s, co: out std_logic
	);
end component;

begin
    cpa: for I in 0 to 7 generate

    lowest_adder: if I=0 generate
      uo: fadd port map(
        a => a(I),
        b => b(I),
        ci => ci,
        s => so(I),
        co => cint(I)
      );
    end generate lowest_adder;

    upper_adder: if (I>0 and I<7) generate
      ux: fadd port map(
        a => a(I),
        b => b(I),
        ci => cint(I-1),
        s => so(I),
        co => cint(I)
      );
    end generate upper_adder;
    
    top_adder: if I=7 generate
          ut: fadd port map(
            a => a(I),
            b => b(I),
            ci => cint(I-1),
            s => so(I),
            co => co
          );
        end generate top_adder;
  end generate cpa;

end architecture;

-- carry save adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity csa is
    port(
    a, b, ci: in std_logic_vector(7 downto 0);
    co, so: out std_logic_vector(7 downto 0)
    );
end entity;

architecture beh of csa is

component fadd
	port(
		a, b, ci: in std_logic;
        s, co: out std_logic
	);
end component;

begin
    csa: for I in 0 to 7 generate
      uo: fadd port map(
        a => a(I),
        b => b(I),
        ci => ci(I),
        s => so(I),
        co => co(I)
      );
  end generate csa;
end architecture;


-- carry lookahead adder 4bit unit
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cla is
    port (
    c0: in std_logic;
    c4: out std_logic;
    a, b: in std_logic_vector(3 downto 0);
    s: out std_logic_vector(3 downto 0)
    );
end entity;

architecture beh of cla is
signal p: std_logic_vector(3 downto 0);
signal g: std_logic_vector(3 downto 0);
signal c: std_logic_vector(4 downto 0);
component ncadd is
	port(
		a, b, ci: in std_logic;
		s: out std_logic
	);
end component;

begin
    c(0) <= c0;
    pg: for I in 0 to 3 generate
        P(I) <= a(I) and b(I);
        G(I) <= a(I) or b(I);
        C(I+1) <= (P(I) and C(I)) or G(I);
    end generate;
    sum: for J in 0 to 3 generate
        nc: ncadd port map(
        a => a(J),
        b => b(J),
        ci => C(J),
        s => s(J)
        );
    end generate;
end architecture;

-- multiplier 1

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mult1 is
    port(
    a, b: in std_logic_vector(7 downto 0);
    p: out std_logic_vector(15 downto 0)
    );
end entity;

architecture beh of mult1 is

signal coint: std_logic_vector(5 downto 0); -- 7 box (used in all except last)
signal sint: std_logic_vector(41 downto 0); -- used 1 less than bits * i less than boxes
signal zero: std_logic:= '0';
signal aint: std_logic_vector(7 downto 0); -- used in one iteration for all bits
signal bint: std_logic_vector(55 downto 0); -- used 7 time with 8 inputs

component cpa is
    port(
    a, b: in std_logic_vector(7 downto 0);
    ci: in std_logic;
    co: out std_logic;
    so: out std_logic_vector(7 downto 0)
    );
end component;

begin
    mult1: for I in 0 to 6 generate
        
    lowest_adder: if I=0 generate
      genl1: for T in 1 to 7 generate
          aint(7*I+T-1) <= a(I) and b(T);
      end generate;
      aint(7) <= '0';
      genl2: for T in 0 to 7 generate
          bint(8*I+T) <= a(I+1) and b(T);
      end generate;
      ul: cpa port map(
        a => aint(7+I*8 downto 0+I*8),
        b => bint(7+I*8 downto 0+I*8),
        ci => zero,
        so(7 downto 1) => sint(6 downto 0),
        so(0) => p(I+1),
        co => coint(I)
      );
    end generate lowest_adder;
    
    upper_adder: if (I>0 and I<6) generate
        genx2: for T in 0 to 7 generate
            bint(8*I+T) <= a(I+1) and b(T);
        end generate;
        uu: cpa port map(
        a(6 downto 0) => sint(7*(I-1)+6 downto 7*(I-1)),
        a(7) => coint(I-1),
        b => bint(7+I*8 downto 0+I*8),
        ci => zero,
        so(7 downto 1) => sint(7*I+6 downto 7*I),
        so(0) => p(I+1),
        co => coint(I)
      );
    end generate upper_adder;
    
    top_adder: if I=6 generate
        gent2: for T in 0 to 7 generate
            bint(8*I+T) <= a(I+1) and b(T);
        end generate;
        ut: cpa port map(
        a(6 downto 0) => sint(7*(I-1)+6 downto 7*(I-1)),
        a(7) => coint(I-1),
        b => bint(7+I*8 downto 0+I*8),
        ci => zero,
        so(7 downto 0) => p(14 downto 7),
        co => p(15)
          );
        end generate top_adder;
    end generate mult1;
    p(0) <= a(0) and b(0);
    
end architecture;


-- multiplier 2

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mult2 is
    port(
    a, b: in std_logic_vector(7 downto 0);
    p: out std_logic_vector(15 downto 0)
    );
end entity;



architecture beh of mult2 is

signal sint: std_logic_vector(54 downto 0); -- 7*8 - 1 eight for each loop except for last loop special con
signal zero: std_logic:= '0';
signal aint: std_logic_vector(7 downto 0); -- used in one iteration for all bits
signal bint: std_logic_vector(47 downto 0); -- used one less than 7 (not in last) time with 8 inputs

--check if this length is really required
signal carry: std_logic_vector(48 downto 0); -- (8-1 bits) 7 times
signal coint: std_logic_vector(55 downto 0); -- 8 bits for output (8-1(last)) times
signal f_bit: std_logic;


component cpa is
    port(
    a, b: in std_logic_vector(7 downto 0);
    ci: in std_logic;
    co: out std_logic;
    so: out std_logic_vector(7 downto 0)
    );
end component;

component csa is
    port(
    a, b, ci: in std_logic_vector(7 downto 0);
    co, so: out std_logic_vector(7 downto 0)
    );
end component;

begin
    mult2: for I in 0 to 6 generate
        
    lowest_adder: if I=0 generate
        genl1: for T in 1 to 7 generate
            aint(T-1) <= a(I) and b(T);
        end generate;
        aint(7) <= '0';
        genl2: for T in 0 to 7 generate
            bint(8*I+T) <= a(I+1) and b(T);
        end generate;
        genl3: for T in 1 to 7 generate
            carry(8*I+T) <= a(I+2) and b(T-1);
        end generate;
        carry(8*I+0) <= '0';
        u1: csa port map(
            a => aint(7+I*8 downto 0+I*8),
            b => bint(7+I*8 downto 0+I*8),
            ci => carry(7 downto 0),
            so(7 downto 1) => sint(7+I*8 downto 1+I*8),
            so(0) => p(I+1),
            co(7 downto 0) => coint(7+I*8 downto 0+I*8)
        );
     end generate lowest_adder;
     
     over: if I<6 generate
         sint(I*8) <= b(7) and a(I+2);
     end generate;
     
     upper_adder: if (I>0 and I<6) generate
        genx3: for T in 1 to 7 generate
            carry(8*I+T) <= a(I+2) and b(T-1);
        end generate;
        carry(8*I+0) <='0';
        ux: csa port map(
            a => coint(7+(I-1)*8 downto 0+(I-1)*8),
            b(6 downto 0) => sint(7+(I-1)*8 downto 1+(I-1)*8),
            b(7) => sint(8*(I-1)),
            ci => carry(7+I*8 downto 0+I*8),
            so(7 downto 1) => sint(7+I*8 downto 1+I*8),
            so(0) => p(I+1),
            co(7 downto 0) => coint(7+I*8 downto 0+I*8)
         );
      end generate upper_adder;
         
      end_adder: if (I=6) generate
        ue: cpa port map(
            a => coint(7+(I-1)*8 downto 0+(I-1)*8),
            b(6 downto 0) => sint(7+(I-1)*8 downto 1+(I-1)*8),
            b(7) => sint(8*(I-1)),
            ci => '0',
            so(7 downto 0) => p(14 downto 7),
            so(15) => p(15)
         );
      end generate end_adder; 
     end generate mult2;
     p(0) <= a(0) and b(0);

end architecture;


-- multiplier 3


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mult3 is
    port(
    a, b: in std_logic_vector(7 downto 0);
    p: out std_logic_vector(15 downto 0)
    );
end entity;

architecture beh of mult3 is
signal c4: std_logic;
signal sint: std_logic_vector(41 downto 0); -- used 1 less than bits * i less than boxes
signal zero: std_logic:= '0';
signal aint: std_logic_vector(7 downto 0); -- used in one iteration for all bits
signal bint: std_logic_vector(55 downto 0); -- used 7 time with 8 inputs

--check if this length is really required
signal carry: std_logic_vector(41 downto 0);
signal coint: std_logic_vector(41 downto 0);

component cla is
    port (
    c0: in std_logic;
    c4: out std_logic;
    a, b: in std_logic_vector(3 downto 0);
    s: out std_logic_vector(3 downto 0)
    );
end component;

component csa is
    port(
    a, b, ci: in std_logic_vector(7 downto 0);
    co, so: out std_logic_vector(7 downto 0)
    );
end component;

begin
    mult3: for I in 0 to 6 generate
    
    over: if I<6 generate
        sint(I*8) <= b(7) and a(I+2);
    end generate;
    
    lowest_adder: if I=0 generate
        genl1: for T in 1 to 7 generate
            aint(T-1) <= a(I) and b(T);
        end generate;
        aint(7) <= '0';
        genl2: for T in 0 to 7 generate
            bint(8*I+T) <= a(I+1) and b(T);
        end generate;
        genl3: for T in 1 to 7 generate
            carry(8*I+T) <= a(I+2) and b(T-1);
        end generate;
        carry(8*I+0) <= '0';
        u1: csa port map(
            a => aint(7+I*8 downto 0+I*8),
            b => bint(7+I*8 downto 0+I*8),
            ci => carry(7 downto 0),
            so(7 downto 1) => sint(7+I*8 downto 1+I*8),
            so(0) => p(I+1),
            co(7 downto 0) => coint(7+I*8 downto 0+I*8)
        );
     end generate lowest_adder;
     
     upper_adder: if (I>0 and I<6) generate
        genx3: for T in 1 to 7 generate
            carry(8*I+T) <= a(I+2) and b(T-1);
        end generate;
        carry(8*I+0) <='0';
        ux: csa port map(
            a => coint(7+(I-1)*8 downto 0+(I-1)*8),
            b(6 downto 0) => sint(7+(I-1)*8 downto 1+(I-1)*8),
            b(7) => sint(8*(I-1)),
            ci => carry(7+I*8 downto 0+I*8),
            so(7 downto 1) => sint(7+I*8 downto 1+I*8),
            so(0) => p(I+1),
            co(7 downto 0) => coint(7+I*8 downto 0+I*8)
         );
         end generate upper_adder;
    
    top_adder: if (I = 6) generate
        cla1: cla port map (
            a => coint(4+(I-1)*8 downto 1+(I-1)*8),
            b => sint(3+(I-1)*8 downto 0+(I-1)*8),
            c0 => zero,
            c4 => c4,
            s => p(10 downto 7)
        );
        cla2: cla port map (
            a(2 downto 0) => coint(7+(I-1)*8 downto 5+(I-1)*8),
            a(3) => sint(8*(I-1)),
            b => sint(7+(I-1)*8 downto 4+(I-1)*8),
            c0 => c4,
            c4 => p(15),
            s => p(15 downto 11)
        );
        
    end generate top_adder;
     end generate mult3;
     p(0) <= a(0) and b(0);


end architecture;


-- multiplier chooser

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multchoose is
    port (
    in1, in2: in std_logic_vector(7 downto 0);
    multiplier_select: in std_logic_vector(1 downto 0);
    product: out std_logic_vector(15 downto 0)
    );
end entity;

architecture beh of multchoose is

component mult1 is
    port(
    a, b: in std_logic_vector(7 downto 0);
    p: out std_logic_vector(15 downto 0)
    );
end component;

component mult2 is
    port(
    a, b: in std_logic_vector(7 downto 0);
    p: out std_logic_vector(15 downto 0)
    );
end component;

component mult3 is
    port(
    a, b: in std_logic_vector(7 downto 0);
    p: out std_logic_vector(15 downto 0)
    );
end component;

signal p1: std_logic_vector(15 downto 0);
signal p2: std_logic_vector(15 downto 0);
signal p3: std_logic_vector(15 downto 0);

begin

m1: mult1 port map (
    a => in1,
    b => in2,
    p => p1
);

m2: mult2 port map (
    a => in1,
    b => in2,
    p => p2
);

m3: mult3 port map (
    a => in1,
    b => in2,
    p => p3
);

product <= p1 when multiplier_select = "00" else
           p2 when multiplier_select = "01" else
           p3 when multiplier_select = "10" else
           p3 when multiplier_select = "11";

end architecture;


-- lab6_multiplier

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lab6_multiplier is
    port(
        clk: in std_logic;
        in1: in std_logic_vector(7 downto 0);
        in2: in std_logic_vector(7 downto 0);
        display_button: in std_logic;
        multiplier_select: in std_logic_vector(1 downto 0);
        product: out std_logic_vector(7 downto 0);
        anode: out std_logic_vector(3 downto 0);
        cathode: out std_logic_vector(6 downto 0)
    );
end entity;

architecture beh of lab6_multiplier is
signal p: std_logic_vector(15 downto 0);

component multchoose is
    port (
        in1, in2: in std_logic_vector(7 downto 0);
        multiplier_select: in std_logic_vector(1 downto 0);
        product: out std_logic_vector(15 downto 0)
    );
end component;
component lab4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0); 
          clk        : in    std_logic; 
          pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0));
end component;

begin
    mc: multchoose port map (
    in1 => in1,
    in2 => in2,
    multiplier_select => multiplier_select,
    product => product
    );
    
    ss: lab4_seven_segment_display  port map ( 
        b => p,
        clk => clk,
        pushbutton => display_button,
        anode => anode,
        cathode => cathode
    );
    
end architecture;

