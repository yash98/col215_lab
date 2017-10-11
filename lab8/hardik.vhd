library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lab8_ssd is
port (
    lift1floor: in std_logic_vector(1 downto 0);
    lift2floor: in std_logic_vector(1 downto 0);
    lift1state: in std_logic_vector(2 downto 0); -- 0=goingup  1=goingdown  2=idle  3=dooropen  4=doorclose
    lift2state: in std_logic_vector(2 downto 0);
    clk: in std_logic;
    anode: out std_logic_vector (3 downto 0);
    cathode: out std_logic_vector (6 downto 0)
    );
end entity;

architecture beh of lab8_ssd is

signal c: std_logic_vector (0 to 27) := "0000000000000000000000000000";
signal req1: std_logic_vector (0 to 27) := "0000000000000000000001100100"; --binary for 100
signal mod_clk: std_logic_vector (0 to 27) := "0000000000000000000000000000";
 
begin
    process(clk)
        begin
            if (clk = '1' and clk'event) then
                
                if (c = req1) then
                    c <= "0000000000000000000000000000";
                    mod_clk <= mod_clk + "0000000000000000000000000001";
                    
                    if mod_clk = "0000000000000000001111101000" then
                        mod_clk <= "0000000000000000000000000000";
                    end if;
                        
                else
                    c <= c + "0000000000000000000000000001";
                end if;
            
            
            
                
                if (mod_clk>= "0000000000000000000000000000" and mod_clk< "0000000000000000000011111010") then
                    anode<="0001";
                    
                    if(lift2floor = "00") then
                        cathode<="1000000";
                    elsif(lift2floor = "01") then
                        cathode<="1111001";
                    elsif(lift2floor = "10") then
                        cathode<="0100100";
                    elsif(lift2floor = "11") then
                        cathode<="0110000";
                    end if;
                end if;
                
                if (mod_clk>= "0000000000000000000011111010" and mod_clk< "0000000000000000000111110100") then
                    anode<="0010";
                    
                    if(lift2state = "00") then
                        cathode<="1100011";
                    elsif(lift2state = "01") then
                        cathode<="0100001";
                    elsif(lift2state = "10") then
                        cathode<="0100011";
                    elsif(lift2state = "11") then
                        cathode<="0100111";
                    end if;
                end if;
                
                if (mod_clk>= "0000000000000000000111110100" and mod_clk< "0000000000000000001011101110") then
                    anode<="0100";
                    
                    if(lift1floor = "00") then
                        cathode<="1000000";
                    elsif(lift1floor = "01") then
                        cathode<="1111001";
                    elsif(lift1floor = "10") then
                        cathode<="0100100";
                    elsif(lift1floor = "11") then
                        cathode<="0110000";
                    end if;
                end if;
                
                
                if (mod_clk>= "0000000000000000001011101110" and mod_clk< "0000000000000000001111101000") then
                    anode<="1000";
                    
                    if(lift1state = "00") then
                        cathode<="1100011";
                    elsif(lift1state = "01") then
                        cathode<="0100001";
                    elsif(lift1state = "10") then
                        cathode<="0100011";
                    elsif(lift1state = "11") then
                        cathode<="0100111";
                    end if;
                end if;
            
            end if;
     end process;
end architecture;        