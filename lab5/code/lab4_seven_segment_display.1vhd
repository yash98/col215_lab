--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab4_seven_segment_display.vhf
-- /___/   /\     Timestamp : 08/18/2017 19:50:28
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: /opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl lab4_seven_segment_display.vhf -w /home/dual/cs5160403/Documents/lab_col215/lab4/lab4_seven_segment_display/lab4_seven_segment_display.sch
--Design Name: lab4_seven_segment_display
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FTC_HXILINX_lab4_seven_segment_display -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FTC_HXILINX_lab4_seven_segment_display is
generic(
    INIT : bit := '0'
    );

  port (
    Q   : out STD_LOGIC := '0';
    C   : in STD_LOGIC;
    CLR : in STD_LOGIC;
    T   : in STD_LOGIC
    );
end FTC_HXILINX_lab4_seven_segment_display;

architecture Behavioral of FTC_HXILINX_lab4_seven_segment_display is
signal q_tmp : std_logic := TO_X01(INIT);
begin

process(C, CLR)
begin
  if (CLR='1') then
    q_tmp <= '0';
  elsif (C'event and C = '1') then
    if(T='1') then
      q_tmp <= not q_tmp;
    end if;
  end if;  
end process;

Q <= q_tmp;

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

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity countto3_MUSER_lab4_seven_segment_display is
   port ( clo  : in    std_logic; 
          bit0 : out   std_logic; 
          bit1 : out   std_logic);
end countto3_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of countto3_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_3     : std_logic;
   signal XLXN_4     : std_logic;
   signal XLXN_5     : std_logic;
   signal XLXN_6     : std_logic;
   signal XLXN_7     : std_logic;
   signal bit0_DUMMY : std_logic;
   component FTC_HXILINX_lab4_seven_segment_display
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_1";
begin
   XLXN_3 <= '1';
   XLXN_5 <= '1';
   XLXN_6 <= '1';
   XLXN_7 <= '1';
   bit0 <= bit0_DUMMY;
   XLXI_1 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>clo,
                CLR=>XLXN_6,
                T=>XLXN_5,
                Q=>bit0_DUMMY);
   
   XLXI_2 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_4,
                CLR=>XLXN_7,
                T=>XLXN_3,
                Q=>bit1);
   
   XLXI_17 : INV
      port map (I=>bit0_DUMMY,
                O=>XLXN_4);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity counter_MUSER_lab4_seven_segment_display is
   port ( cl      : in    std_logic; 
          cldiv16 : out   std_logic);
end counter_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of counter_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal XLXN_4   : std_logic;
   signal XLXN_5   : std_logic;
   signal XLXN_6   : std_logic;
   signal XLXN_7   : std_logic;
   signal XLXN_8   : std_logic;
   signal XLXN_9   : std_logic;
   signal XLXN_10  : std_logic;
   signal XLXN_11  : std_logic;
   signal XLXN_12  : std_logic;
   signal XLXN_13  : std_logic;
   signal XLXN_14  : std_logic;
   signal XLXN_15  : std_logic;
   signal XLXN_16  : std_logic;
   signal XLXN_17  : std_logic;
   signal XLXN_18  : std_logic;
   signal XLXN_34  : std_logic;
   signal XLXN_35  : std_logic;
   signal XLXN_36  : std_logic;
   signal XLXN_37  : std_logic;
   signal XLXN_38  : std_logic;
   signal XLXN_39  : std_logic;
   signal XLXN_40  : std_logic;
   signal XLXN_65  : std_logic;
   signal XLXN_66  : std_logic;
   signal XLXN_67  : std_logic;
   signal XLXN_68  : std_logic;
   signal XLXN_69  : std_logic;
   signal XLXN_70  : std_logic;
   signal XLXN_71  : std_logic;
   signal XLXN_72  : std_logic;
   signal XLXN_73  : std_logic;
   signal XLXN_74  : std_logic;
   signal XLXN_75  : std_logic;
   signal XLXN_76  : std_logic;
   signal XLXN_77  : std_logic;
   signal XLXN_78  : std_logic;
   signal XLXN_79  : std_logic;
   signal XLXN_80  : std_logic;
   signal XLXN_81  : std_logic;
   signal XLXN_82  : std_logic;
   signal XLXN_83  : std_logic;
   signal XLXN_84  : std_logic;
   signal XLXN_85  : std_logic;
   signal XLXN_86  : std_logic;
   signal XLXN_87  : std_logic;
   signal XLXN_88  : std_logic;
   signal XLXN_89  : std_logic;
   signal XLXN_90  : std_logic;
   signal XLXN_91  : std_logic;
   signal XLXN_92  : std_logic;
   signal XLXN_93  : std_logic;
   signal XLXN_94  : std_logic;
   signal XLXN_95  : std_logic;
   signal XLXN_96  : std_logic;
   signal XLXN_97  : std_logic;
   signal XLXN_98  : std_logic;
   signal XLXN_99  : std_logic;
   signal XLXN_100 : std_logic;
   signal XLXN_101 : std_logic;
   signal XLXN_102 : std_logic;
   component FTC_HXILINX_lab4_seven_segment_display
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_3";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_2";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_16";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_12";
   attribute HU_SET of XLXI_9 : label is "XLXI_9_17";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_13";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_15";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_14";
   attribute HU_SET of XLXI_27 : label is "XLXI_27_5";
   attribute HU_SET of XLXI_29 : label is "XLXI_29_6";
   attribute HU_SET of XLXI_30 : label is "XLXI_30_7";
   attribute HU_SET of XLXI_31 : label is "XLXI_31_4";
   attribute HU_SET of XLXI_35 : label is "XLXI_35_8";
   attribute HU_SET of XLXI_36 : label is "XLXI_36_9";
   attribute HU_SET of XLXI_37 : label is "XLXI_37_10";
   attribute HU_SET of XLXI_38 : label is "XLXI_38_11";
begin
   XLXN_71 <= '1';
   XLXN_72 <= '1';
   XLXN_73 <= '1';
   XLXN_74 <= '1';
   XLXN_75 <= '1';
   XLXN_76 <= '1';
   XLXN_77 <= '1';
   XLXN_78 <= '1';
   XLXN_79 <= '1';
   XLXN_80 <= '1';
   XLXN_81 <= '1';
   XLXN_82 <= '1';
   XLXN_83 <= '1';
   XLXN_84 <= '1';
   XLXN_85 <= '1';
   XLXN_86 <= '1';
   XLXN_87 <= '1';
   XLXN_88 <= '1';
   XLXN_89 <= '1';
   XLXN_90 <= '1';
   XLXN_91 <= '1';
   XLXN_92 <= '1';
   XLXN_93 <= '1';
   XLXN_94 <= '1';
   XLXN_95 <= '1';
   XLXN_96 <= '1';
   XLXN_97 <= '1';
   XLXN_98 <= '1';
   XLXN_99 <= '1';
   XLXN_100 <= '1';
   XLXN_101 <= '1';
   XLXN_102 <= '1';
   XLXI_1 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>cl,
                CLR=>XLXN_87,
                T=>XLXN_71,
                Q=>XLXN_2);
   
   XLXI_2 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_1,
                CLR=>XLXN_88,
                T=>XLXN_72,
                Q=>XLXN_18);
   
   XLXI_5 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_65,
                CLR=>XLXN_91,
                T=>XLXN_75,
                Q=>XLXN_4);
   
   XLXI_6 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_9,
                CLR=>XLXN_92,
                T=>XLXN_76,
                Q=>XLXN_36);
   
   XLXI_9 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_66,
                CLR=>XLXN_98,
                T=>XLXN_82,
                Q=>XLXN_5);
   
   XLXI_10 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_8,
                CLR=>XLXN_97,
                T=>XLXN_81,
                Q=>XLXN_38);
   
   XLXI_13 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_67,
                CLR=>XLXN_99,
                T=>XLXN_83,
                Q=>XLXN_6);
   
   XLXI_14 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_7,
                CLR=>XLXN_100,
                T=>XLXN_84,
                Q=>XLXN_40);
   
   XLXI_17 : INV
      port map (I=>XLXN_2,
                O=>XLXN_1);
   
   XLXI_23 : INV
      port map (I=>XLXN_4,
                O=>XLXN_9);
   
   XLXI_24 : INV
      port map (I=>XLXN_5,
                O=>XLXN_8);
   
   XLXI_25 : INV
      port map (I=>XLXN_6,
                O=>XLXN_7);
   
   XLXI_27 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_10,
                CLR=>XLXN_89,
                T=>XLXN_74,
                Q=>XLXN_68);
   
   XLXI_28 : INV
      port map (I=>XLXN_11,
                O=>XLXN_10);
   
   XLXI_29 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_37,
                CLR=>XLXN_96,
                T=>XLXN_80,
                Q=>XLXN_13);
   
   XLXI_30 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_35,
                CLR=>XLXN_93,
                T=>XLXN_77,
                Q=>XLXN_12);
   
   XLXI_31 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_34,
                CLR=>XLXN_90,
                T=>XLXN_73,
                Q=>XLXN_11);
   
   XLXI_32 : INV
      port map (I=>XLXN_12,
                O=>XLXN_17);
   
   XLXI_33 : INV
      port map (I=>XLXN_13,
                O=>XLXN_16);
   
   XLXI_34 : INV
      port map (I=>XLXN_14,
                O=>XLXN_15);
   
   XLXI_35 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_39,
                CLR=>XLXN_101,
                T=>XLXN_85,
                Q=>XLXN_14);
   
   XLXI_36 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_15,
                CLR=>XLXN_102,
                T=>XLXN_86,
                Q=>cldiv16);
   
   XLXI_37 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_16,
                CLR=>XLXN_95,
                T=>XLXN_79,
                Q=>XLXN_70);
   
   XLXI_38 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_17,
                CLR=>XLXN_94,
                T=>XLXN_78,
                Q=>XLXN_69);
   
   XLXI_39 : INV
      port map (I=>XLXN_18,
                O=>XLXN_34);
   
   XLXI_80 : INV
      port map (I=>XLXN_36,
                O=>XLXN_35);
   
   XLXI_81 : INV
      port map (I=>XLXN_38,
                O=>XLXN_37);
   
   XLXI_82 : INV
      port map (I=>XLXN_40,
                O=>XLXN_39);
   
   XLXI_111 : INV
      port map (I=>XLXN_68,
                O=>XLXN_65);
   
   XLXI_112 : INV
      port map (I=>XLXN_69,
                O=>XLXN_66);
   
   XLXI_113 : INV
      port map (I=>XLXN_70,
                O=>XLXN_67);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity clocking_MUSER_lab4_seven_segment_display is
   port ( c             : in    std_logic; 
          pb            : in    std_logic; 
          anode_not_inv : out   std_logic_vector (3 downto 0));
end clocking_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of clocking_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   signal XLXN_1        : std_logic;
   signal XLXN_4        : std_logic;
   signal XLXN_5        : std_logic;
   signal XLXN_6        : std_logic;
   signal XLXN_7        : std_logic;
   component M2_1_HXILINX_lab4_seven_segment_display
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component counter_MUSER_lab4_seven_segment_display
      port ( cl      : in    std_logic; 
             cldiv16 : out   std_logic);
   end component;
   
   component countto3_MUSER_lab4_seven_segment_display
      port ( bit0 : out   std_logic; 
             bit1 : out   std_logic; 
             clo  : in    std_logic);
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
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_18";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_19";
begin
   XLXN_7 <= '1';
   XLXI_1 : M2_1_HXILINX_lab4_seven_segment_display
      port map (D0=>XLXN_1,
                D1=>c,
                S0=>pb,
                O=>XLXN_4);
   
   XLXI_2 : counter_MUSER_lab4_seven_segment_display
      port map (cl=>c,
                cldiv16=>XLXN_1);
   
   XLXI_3 : countto3_MUSER_lab4_seven_segment_display
      port map (clo=>XLXN_4,
                bit0=>XLXN_5,
                bit1=>XLXN_6);
   
   XLXI_4 : D2_4E_HXILINX_lab4_seven_segment_display
      port map (A0=>XLXN_5,
                A1=>XLXN_6,
                E=>XLXN_7,
                D0=>anode_not_inv(3),
                D1=>anode_not_inv(2),
                D2=>anode_not_inv(1),
                D3=>anode_not_inv(0));
   
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
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
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
   
begin
   XLXI_1 : OR4
      port map (I0=>XLXN_22,
                I1=>XLXN_21,
                I2=>XLXN_20,
                I3=>XLXN_19,
                O=>c1);
   
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
      port map (I0=>bin(2),
                I1=>bin(1),
                I2=>bin(0),
                O=>XLXN_21);
   
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
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_20";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_21";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_22";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_23";
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
          Pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0));
end lab4_seven_segment_display;

architecture BEHAVIORAL of lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_13    : std_logic_vector (3 downto 0);
   signal XLXN_26    : std_logic_vector (3 downto 0);
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
   
   component clocking_MUSER_lab4_seven_segment_display
      port ( anode_not_inv : out   std_logic_vector (3 downto 0); 
             c             : in    std_logic; 
             pb            : in    std_logic);
   end component;
   
begin
   XLXI_2 : mux16X4_MUSER_lab4_seven_segment_display
      port map (an(3 downto 0)=>XLXN_26(3 downto 0),
                be(15 downto 0)=>b(15 downto 0),
                c(3 downto 0)=>XLXN_13(3 downto 0));
   
   XLXI_4 : INV
      port map (I=>XLXN_26(0),
                O=>anode(0));
   
   XLXI_5 : INV
      port map (I=>XLXN_26(1),
                O=>anode(1));
   
   XLXI_6 : INV
      port map (I=>XLXN_26(2),
                O=>anode(2));
   
   XLXI_7 : INV
      port map (I=>XLXN_26(3),
                O=>anode(3));
   
   XLXI_8 : binto7_MUSER_lab4_seven_segment_display
      port map (binary(3 downto 0)=>XLXN_13(3 downto 0),
                cat(6 downto 0)=>cathode(6 downto 0));
   
   XLXI_9 : clocking_MUSER_lab4_seven_segment_display
      port map (c=>clk,
                pb=>Pushbutton,
                anode_not_inv(3 downto 0)=>XLXN_26(3 downto 0));
   
end BEHAVIORAL;



