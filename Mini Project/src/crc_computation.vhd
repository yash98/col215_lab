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
        
        -- write enable
        we_inp: out std_logic;
        we_crc: out std_logic;
        
        -- reset
        rst_inp: out std_logic;
        rst_crc: out std_logic;
        
        --addr of brams
        addr_inp: out std_logic_vector(3 downto 0);
        addr_crc: out std_logic_vector(3 downto 0)
    );
end crc;

architecture beh of crc is

signal int_inp: std_logic_vector(47 downto 0); -- local storage for inp
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
signal n: std_logic_vector(3 downto 0):="00000"; -- shifting cont(during crc comp)
signal shift: std_logic:='0'; -- to shift indicator
signal rsting: std_logic:='0';
signal rst_c: std_logic_vector(3 downto 0):="0000";

begin

process(clk)
begin
    if rising_edge(clk) then
        we_inp <= '0';
        we_crc <= '0';
        
        if (rsting='1') then
                we_inp <= '1';
                we_crc <= '1';
                wr_crc <= "1111111111111111";
                wr_inp <= "1111111111111111";
                addr_inp <= c;
                addr_crc <= c;
                c <= c+"0001";
            if (rst_c="1111") then
                rsting <= '0';
            end if;
        else
            -- load inputs on ech press
            if (pb1='1' and wait_read='0') then
               addr_inp <= w_inp_addr;
               wr_inp <= data_inp;
               we_inp <= '1';
               w_inp_addr <= w_inp_addr+"0001";
            end if;
            
            -- reset 
            if (pb2='1') then
            
                w_inp_addr <= "0000";
                we_inp <= '0';
                rst_inp <= '1';
                
                w_crc_addr <= "0000";
                we_crc <= '0';
                rst_crc <= '1';
                
                r_inp_addr <= "0000";
                
                done <= '0';
                wait_read <= '0';
                start <= '0';
                shift <= '0';
                c <= "00";
                n <= "0000";
                crc <= "1111111111111111";
                
                rst_c <= "0000";
                rsting <= '1';
                -- check int signal settings
            end if;
            
            -- start crc comp of next addr
            if (pb3='1' and start='0' and wait_read='0') then
                we_inp <= '0';
                addr_inp <= r_inp_addr;
                wait_read<='1';
                r_inp_addr <= r_inp_addr+"0001";
                done <= '0';
            end if;
            
            -- read into local memory
            if (wait_read='1') then
                if (c<"10") then
                    c <= c+"01";
                else
                    start <= '1';
                    shift <= '0';
                    n <= "0000";
                    c <= "00";
                    wait_read <= '0';
                    int_inp <= one & inp_bram_data & zero;
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
                    n <= n + "0001";
                    -- 33rd xor has no shift sart to 0 crc displayed
                    if (n="10000") then
                        start <= '0';
                        crc <= int_inp(47 to 32);
                        done <= '1';
                    end if;
                end if;
            end if;
            
        end if;
    end if;
end process;


end architecture;