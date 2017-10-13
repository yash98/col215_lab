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
            
            -- delete done requests from r_
            -- deletes all kind of done external requests
            if ((t_done1(i)='1') and (l_dir1="01")) then
                if (r_up(i)='1') then
                    -- up up handled
                    r_up(i) <= '0';
                else
                    -- up down handled
                    r_down(i) <= '0';
                end if;
            elsif ((t_done1(i)='1') and (l_dir1="10")) then
                if (r_down(i)='1') then
                    r_down(i) <= '0';
                else
                    r_up(i) <= '0';
                end if;
            end if;
            if ((t_done2(i)='1') and (l_dir2="01")) then
                if (r_up(i)='1') then
                    r_up(i) <= '0';
                else
                    r_down(i) <= '0';
                end if;
            end if;
            if ((t_done2(i)='1') and (l_dir2="10")) then
               if (r_down(i)='1') then
                    r_down(i) <= '0';
                else
                    r_up(i) <= '0';
                end if;
            end if;
        end loop;
        
        -- idle state task assign
        if (l_dir1="00") then
            for i in 0 to 3 loop
                if (p_up(3-i) = '1') and (((l_floor1(3 downto 3-i) <= p_up(3 downto 3-i)))) then
                    t_out1(3-i) <= '1';
                    p_up(3-i) <= '0';
                    exit;
                elsif ((p_down(3-i) = '1') and ((l_floor1(3 downto 3-i) <= p_down(3 downto 3-i)))) then
                    t_out1(3-i) <= '1';
                    p_down(3-i) <= '0';
                    exit;
                elsif ((p_up(3-i) = '1') and (l_floor1(3 downto 3-i) >= p_up(3 downto 3-i))) then
                    t_out1(3-i) <= '1';
                    p_up(3-i) <= '0';
                    exit;
                elsif ((p_down(3-i) = '1') and (l_floor1(3 downto i) >= p_down(3 downto i))) then
                    t_out1(3-i) <= '1';
                    p_down(3-i) <= '0';
                    exit;
                end if;
            end loop;
        elsif (l_dir2="00") then
            for i in 0 to 3 loop
                if ((p_up(3-i) = '1') and (l_floor2(3 downto 3-i) <= p_up(3 downto 3-i))) then
                    t_out2(3-i) <= '1';
                    p_up(3-i) <= '0';
                    exit;
                elsif ((p_down(3-i) = '1') and (l_floor2(3 downto 3-i) <= p_down(3 downto 3-i))) then
                    t_out2(3-i) <= '1';
                    p_down(3-i) <= '0';
                    exit;
                 elsif ((p_up(3-i) = '1') and (l_floor2(3 downto 3-i) >= p_up(3 downto 3-i))) then
                    t_out2(3-i) <= '1';
                    p_up(3-i) <= '0';
                    exit;
                elsif ((p_down(3-i) = '1') and (l_floor2(3 downto 3-i) >= p_down(3 downto 3-i))) then
                    t_out2(3-i) <= '1';
                    p_down(3-i) <= '0';
                    exit;
                end if;
            end loop;
        end if;
        
        for i in 0 to 3 loop
        -- non idle states task assignment
            if (l_floor1(i) = '1') then
                if ((l_floor1(3 downto i) <= up_req(3 downto i)) and (l_dir1 = "01")) then
                    t_out1(3 downto i) <= up_req(3 downto i);
                    for j in 0 to 3-i loop
                        if (up_req(3-i+j)='1') then
                            p_up(3-i+j) <= '0';
                        end if;
                    end loop;
                elsif ((l_floor1(i downto 0) >= down_req(i downto 0)) and (l_dir1 = "10")) then
                    t_out1(i downto 0) <= down_req(i downto 0);
                    p_down(i downto 0) <= zero(i downto 0);
                    for j in 0 to i loop
                        if (down_req(i)='1') then
                            p_down(i) <= '0';
                        end if;
                    end loop;
                end if;
            elsif (l_floor2(i) = '1') then
                if ((l_floor2(3 downto i) <= up_req(3 downto i)) and (l_dir2 = "01")) then
                    t_out2(3 downto i) <= up_req(3 downto i);
                    for j in 0 to 3-i loop
                        if (up_req(3-i+j)='1') then
                            p_up(3-i+j) <= '0';
                        end if;
                    end loop;
                elsif ((l_floor2(i downto 0) <= down_req(i downto 0)) and (l_dir2 = "10")) then
                    t_out2(i downto 0) <= down_req(i downto 0);
                    for j in 0 to i loop
                        if (down_req(i)='1') then
                            p_down(i) <= '0';
                        end if;
                    end loop;
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

up_req_ind <= r_up;
down_req_ind <= r_down;

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
    reset: in std_logic;
    l_button: in std_logic_vector(3 downto 0);
    t_in: in std_logic_vector(3 downto 0);
    l_floor: out std_logic_vector(3 downto 0);
    t_done: out std_logic_vector(3 downto 0);
    l_dir: out std_logic_vector(1 downto 0)
);
end entity;

architecture beh of lift_controller is

signal zero: std_logic_vector(34 downto 0):= "00000000000000000000000000000000000";

signal task: std_logic_vector(3 downto 0); -- register that store whether to open door when lift reaches that floor
signal dir: std_logic_vector(1 downto 0); -- up down idle
signal lf: std_logic_vector(3 downto 0); -- floor of lift

-- counter related
signal eoc: std_logic_vector(34 downto 0);
signal c: std_logic_vector(34 downto 0);
signal t: std_logic_vector(1 downto 0); -- state of time
signal s: std_logic_vector(1 downto 0); -- "00" = movement "01" = opening "10" = closing
signal done: std_logic; -- lock
signal initial: std_logic; -- relaese lock start new counting

signal l_dir_i: std_logic_vector(1 downto 0);

begin

eoc <= "10010101000000101111100100000000000" when t = "11" else -- 2 s
        "00100101010000001011111001000000000" when t = "10" else -- 0.5 s
        "00000111011100110101100101000000000" when t = "01"; -- 0.1 s


process(clk)
begin
if rising_edge(clk) then
    
    -- counter
    if (initial = '0') then
        c <= "00000000000000000000000000000000001";
        initial <= '1';
        done <= '0';
    else
        if (c = eoc) then
            done <= '1';
        else
            c <= c + "00000000000000000000000000000000001";
        end if;
    end if;
    
    -- t_in & lift buttons registered 
    for i in 0 to 3 loop
        if (t_in(i) = '1') then
            task(i) <=  '1';
        end if;
        -- if lift going in direction dont even take request for opposite direction to lift button
        if ((l_button(i) = '1') and not (lf(i) = l_button(i))) then
            if ((lf(3 downto i)<l_button(3 downto i)) and (l_dir_i="01")) then
                task(i) <=  '1';
            elsif ((lf(i downto 0)>l_button(i downto 0)) and (l_dir_i="10")) then
                task(i) <=  '1';
            end if;
        end if;
    end loop;
    
    -- l_dir decision
    if (task="0000") then
        l_dir_i <= "00";
    elsif (lf>=task) then
        l_dir_i <= "10";
    elsif (lf<=task) then
        l_dir_i <= "01";
    end if;
    
    for i in 0 to 3 loop
        if ((task(i) = lf(i)) and (lf(i) = '1')) then
            
        end if;
    end loop;
    
    if (not (s="00")) then
        
    end if;
    
end if;
end process;

l_floor <= lf;

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