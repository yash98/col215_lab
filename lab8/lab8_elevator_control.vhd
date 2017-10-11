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
-- r_ stores requests to be handled
-- s_ 1 denotes request is assigned to lift or not type - upup downdown
process(clk)
begin
    if rising_edge(clk) then
        -- r_ register updating
        t_out1 <= "0000";
        t_out2 <= "0000";

        
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
        
        if (l_dir1="00") then
            for i in 0 to 3 loop
                if ((p_up(i) = '1') and (((l_floor1(3 downto i) < p_up(3 downto i)) or (l_floor1(3 downto i) = p_up(3 downto i))))) then
                    t_out1(i) <= '1';
                    p_up(i) <= '0';
                elsif ((p_down(i) = '1') and (((l_floor1(3 downto i) < p_down(3 downto i)) or (l_floor1(3 downto i) = p_down(3 downto i))))) then
                    t_out1(i) <= '1';
                    p_down(i) <= '0';
                 elsif ((p_up(i) = '1') and (((l_floor1(3 downto i) > p_up(3 downto i)) or (l_floor1(3 downto i) = p_up(3 downto i))))) then
                    t_out1(i) <= '1';
                    p_up(i) <= '0';
                elsif ((p_down(i) = '1') and (((l_floor1(3 downto i) > p_down(3 downto i)) or (l_floor1(3 downto i) = p_down(3 downto i))))) then
                    t_out1(i) <= '1';
                    p_down(i) <= '0';
                end if;
            end loop;
        end if;
        
        if (l_dir2="00") then
            for i in 0 to 3 loop
                if ((p_up(i) = '1') and (((l_floor2(3 downto i) < p_up(3 downto i)) or (l_floor2(3 downto i) = p_up(3 downto i))))) then
                    t_out2(i) <= '1';
                    p_up(i) <= '0';
                elsif ((p_down(i) = '1') and (((l_floor2(3 downto i) < p_down(3 downto i)) or (l_floor2(3 downto i) = p_down(3 downto i))))) then
                    t_out2(i) <= '1';
                    p_down(i) <= '0';
                 elsif ((p_up(i) = '1') and (((l_floor2(3 downto i) > p_up(3 downto i)) or (l_floor2(3 downto i) = p_up(3 downto i))))) then
                    t_out2(i) <= '1';
                    p_up(i) <= '0';
                elsif ((p_down(i) = '1') and (((l_floor2(3 downto i) > p_down(3 downto i)) or (l_floor2(3 downto i) = p_down(3 downto i))))) then
                    t_out2(i) <= '1';
                    p_down(i) <= '0';
                end if;
            end loop;
        end if;
        
        for i in 0 to 3 loop
        -- non idle states task assignment
            if (l_floor1(i) = '1') then
                if (((l_floor1(3 downto i) < up_req(3 downto i)) or (l_floor1(3 downto i) = up_req(3 downto i))) and (l_dir1 = "01")) then
                    t_out1(3 downto i) <= up_req(3 downto i);
                    p_up(3 downto i) <= zero(3 downto i);
                elsif (((l_floor1(i downto 0) > down_req(i downto 0)) or (l_floor1(i downto 0) = down_req(i downto 0))) and (l_dir1 = "10")) then
                    t_out1(i downto 0) <= down_req(i downto 0);
                    p_down(i downto 0) <= zero(i downto 0);
                end if;
            elsif (l_floor2(i) = '1') then
                if (((l_floor2(3 downto i) < up_req(3 downto i)) or (l_floor2(3 downto i) = up_req(3 downto i))) and (l_dir2 = "01")) then
                    t_out2(3 downto i) <= up_req(3 downto i);
                    p_up(3 downto i) <= zero(3 downto i);
                elsif (((l_floor2(i downto 0) < down_req(i downto 0)) or (l_floor2(i downto 0) = down_req(i downto 0))) and (l_dir2 = "10")) then
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lift_controller is
port (
    lift_floor: in std_logic_vector(3 downto 0);
    door_open: in std_logic;
    reset: in std_logic_vector;
    task_in: in std_logic_vector(3 downto 0); -- input from request_handler
    door_close: in std_logic;
    lift_status: out std_logic_vector()
);
end entity;

architecture beh of lift_controller is
signal task: std_logic_vector(3 downto 0);
signal floorno: std_logic_vector(1 downto 0);
signal state: std_logic_vector(1 downto 0); -- up down open close
signal idle: std_logic; -- 2 states
begin
-- lift opens one every task
-- task is edited when lift reaches a floor or task sent from request_handler
-- open close changed internally
end architecture;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity status_display is
port(
    clock in std_logic;
    liftstat1: in std_logic_vector();
    liftstat2:in std_logic_vector();
    up_request_ind: in std_logic_vector(3 downto 0);
    down_request_ind: in std_logic_vector(3 downto 0);
    led_output: out std_logic_vector(15 downto 0);
    cathode: out std_logic_vector(6 downto 0);
    anode: out std_logic_vector(3 downto 0)
);

end entity;
architecture status_display of status_display is
begin
-- floor and lift status display
-- ledoutput request indicators and lift floor button press
end architecture;