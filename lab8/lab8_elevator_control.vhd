library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity request_handler is
port (
    clk: in std_logic;
    up_req: in std_logic_vector(3 downto 0);
    down_req: in std_logic_vector(3 downto 0);
    reset: in std_logic;
    l_dir1: in std_logic_vector(1 downto 0);
    l_dir2: in std_logic_vector(1 downto 0);
    l_floor1: in std_logic_vector(3 downto 0);
    l_floor2: in std_logic_vector(3 downto 0);
    t_done1: in std_logic_vector(3 downto 0);
    t_done2: in std_logic_vector(3 downto 0);
    t_out1: out std_logic_vector(3 downto 0);
    t_out2: out std_logic_vector(3 downto 0);
    up_req_ind: out std_logic_vector(3 downto 0);
    down_req_ind: out std_logic_vector(3 downto 0)
);
end entity;

architecture beh of request_handler is
-- two sets of register
signal r_up: std_logic_vector(3 downto 0);
signal p_up: std_logic_vector(3 downto 0);

signal r_down: std_logic_vector(3 downto 0);
signal p_down: std_logic_vector(3 downto 0);

signal zero: std_logic_vector(3 downto 0):= "0000";


begin
process(clk)
begin
    if rising_edge(clk) then
        -- t_out out to default
        t_out1 <= "0000";
        t_out2 <= "0000";

        -- r_ and p_ updating
        
        for i in 0 to 3 loop
            if (up_req(i)='1') then
                r_up(i) <= '1';
                p_up(i) <= '1';
            end if;
            if (down_req(i)='1') then
                r_down(i) <= '1';
                p_down(i) <= '1';
            end if;
            if ((t_done1(i)='1') and (l_dir1="01")) then
                r_up(i) <= '0';
            end if;
            if ((t_done1(i)='1') and (l_dir1="10")) then
                r_down(i) <= '0';
            end if;
            if ((t_done2(i)='1') and (l_dir2="01")) then
                r_up(i) <= '0';
            end if;
            if ((t_done2(i)='1') and (l_dir2="10")) then
                r_down(i) <= '0';
            end if;
        end loop;
        
        -- idle satae task assign
        if (l_dir1="00") then
            for i in 0 to 3 loop
                if (p_up(i) = '1') and (((l_floor1(3 downto i) <= p_up(3 downto i)))) then
                    t_out1(i) <= '1';
                    p_up(i) <= '0';
                elsif ((p_down(i) = '1') and ((l_floor1(3 downto i) <= p_down(3 downto i)))) then
                    t_out1(i) <= '1';
                    p_down(i) <= '0';
                 elsif ((p_up(i) = '1') and (l_floor1(3 downto i) >= p_up(3 downto i))) then
                    t_out1(i) <= '1';
                    p_up(i) <= '0';
                elsif ((p_down(i) = '1') and (l_floor1(3 downto i) >= p_down(3 downto i))) then
                    t_out1(i) <= '1';
                    p_down(i) <= '0';
                end if;
            end loop;
        end if;
        
        if (l_dir2="00") then
            for i in 0 to 3 loop
                if ((p_up(i) = '1') and (l_floor2(3 downto i) <= p_up(3 downto i))) then
                    t_out2(i) <= '1';
                    p_up(i) <= '0';
                elsif ((p_down(i) = '1') and (l_floor2(3 downto i) <= p_down(3 downto i))) then
                    t_out2(i) <= '1';
                    p_down(i) <= '0';
                 elsif ((p_up(i) = '1') and (l_floor2(3 downto i) >= p_up(3 downto i))) then
                    t_out2(i) <= '1';
                    p_up(i) <= '0';
                elsif ((p_down(i) = '1') and (l_floor2(3 downto i) >= p_down(3 downto i))) then
                    t_out2(i) <= '1';
                    p_down(i) <= '0';
                end if;
            end loop;
        end if;
        
        for i in 0 to 3 loop
        -- non idle states task assignment
            if (l_floor1(i) = '1') then
                if ((l_floor1(3 downto i) <= up_req(3 downto i)) and (l_dir1 = "01")) then
                    t_out1(3 downto i) <= up_req(3 downto i);
                    p_up(3 downto i) <= zero(3 downto i);
                elsif ((l_floor1(i downto 0) >= down_req(i downto 0)) and (l_dir1 = "10")) then
                    t_out1(i downto 0) <= down_req(i downto 0);
                    p_down(i downto 0) <= zero(i downto 0);
                end if;
            elsif (l_floor2(i) = '1') then
                if ((l_floor2(3 downto i) <= up_req(3 downto i)) and (l_dir2 = "01")) then
                    t_out2(3 downto i) <= up_req(3 downto i);
                    p_up(3 downto i) <= zero(3 downto i);
                elsif ((l_floor2(i downto 0) <= down_req(i downto 0)) and (l_dir2 = "10")) then
                    t_out2(i downto 0) <= down_req(i downto 0);
                    p_down(i downto 0) <= zero(i downto 0);
                end if;
            end if;
        end loop;
    end if;
    
    -- reset
    if (reset = '1') then
        r_up <= "0000";
        p_up <= "0000";
        r_down <= "0000";
        p_down <= "0000";
        t_out1 <= "0000";
        t_out2 <= "0000";
    end if;
    
end process;

end architecture;

-------------------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lift_controller is
port (
    rest: in std_logic;
    clk: in std_logic;
    door_open: in std_logic;
    door_close: in std_logic;
    reset: in std_logic_vector;
    t_in: in std_logic_vector(3 downto 0);
    l_floor: out std_logic_vector(3 downto 0);
    t_done: out std_logic_vector(3 downto 0);
    l_dir: out std_logic_vector(1 downto 0)
);
end entity;

architecture beh of lift_controller is

signal task: std_logic_vector(3 downto 0);
signal dir: std_logic_vector(1 downto 0); -- up down open close
signal oc: std_logic_vector(1 downto 0); -- 2 states

begin

process(clk)
begin
if rising_edge(clk) then

    for i in 0 to 3 loop
        if (t_in(i) = '1') then
            task(i) <=  '1';
        end if;
    end loop;

end if;
end process;

end architecture;

--------------------------------------------------------------------------------------------------------
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
signal req1: std_logic_vector (0 to 27) := "0000000000011000011010100000"; --binary for 100,000
signal mod_clk: std_logic_vector (0 to 27) := "0000000000000000000000000000";
 
begin
    process(clk)
        begin
            if (clk = '1' and clk'event) then
                
                if (c = req1) then
                    c <= "0000000000000000000000000000";
                    mod_clk <= mod_clk + "0000000000000000000000000001";
                    
                    if mod_clk = "0000000000000000001111101000" then --1000
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