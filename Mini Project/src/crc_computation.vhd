library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BRAM_wrapper is
  port (
    BRAM_PORTA_0_addr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_PORTA_0_clk : in STD_LOGIC;
    BRAM_PORTA_0_din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    BRAM_PORTA_0_dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    BRAM_PORTA_0_en : in STD_LOGIC;
    BRAM_PORTA_0_we : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end BRAM_wrapper;

architecture STRUCTURE of BRAM_wrapper is
  component BRAM is
  port (
    BRAM_PORTA_0_addr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    BRAM_PORTA_0_clk : in STD_LOGIC;
    BRAM_PORTA_0_din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    BRAM_PORTA_0_dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    BRAM_PORTA_0_en : in STD_LOGIC;
    BRAM_PORTA_0_we : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component BRAM;
begin
BRAM_i: component BRAM
     port map (
      BRAM_PORTA_0_addr(3 downto 0) => BRAM_PORTA_0_addr(3 downto 0),
      BRAM_PORTA_0_clk => BRAM_PORTA_0_clk,
      BRAM_PORTA_0_din(15 downto 0) => BRAM_PORTA_0_din(15 downto 0),
      BRAM_PORTA_0_dout(15 downto 0) => BRAM_PORTA_0_dout(15 downto 0),
      BRAM_PORTA_0_en => BRAM_PORTA_0_en,
      BRAM_PORTA_0_we(0) => BRAM_PORTA_0_we(0)
    );
end STRUCTURE;

-----------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity crc is
port (
        clk: in std_logic;
        load: in std_logic;
        reset: in std_logic;
        start: in std_logic;
        done: out std_logic;
        crc_disp: in std_logic_vector(15 downto 0); -- display calculated crc on ssd from bram 2
        data_inp: in std_logic_vector(15 downto 0); -- write to
        we_inp: out std_logic;
        we_crc: out std_logic;
        addr_inp: out std_logic_vector(15 downto 0);
        addr_crc: out std_logic_vector(15 downto 0)
    );
end crc;

architecture beh of crc is

signal int_inp: std_logic_vector(47 downto 0);
signal crc: std_logic_vector(15 downto 0);
signal poly: std_logic_vector(15 downto 0):="0001000000100001"; -- 1021


begin

process(clk)
begin
    if rising_edge(clk) then
        
    end if;
end process;

end architecture;