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
signal s_up: std_logic_vector(3 downto 0);

signal r_down: std_logic_vector(3 downto 0);
signal s_down: std_logic_vector(3 downto 0);

begin
-- r_ stores requests to be handled
-- s_ 1 denotes request is assigned to lift or not type - upup downdown
process(clk)
begin
if rising_edge(clk) then
    -- r_ register updating
    for i in 0 to 3 loop
        if (up_req(i)='1') then
            r_up(i) <= '1';
        end if;
        if (down_req(i)='1') then
            r_down(i) <= '1';
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
    
    
    -- priority task assignment
    if (((l_floor1 < up_req) or (l_floor1 = up_req)) and (l_dir1 = "01")) then
        t_out1 <= up_req;
    elsif (((l_floor1 < down_req) or (l_floor1 = down_req)) and (l_dir1 = "10")) then
        t_out1 <= up_req;
    
    elsif (((l_floor2 < up_req) or (l_floor2 = up_req)) and (l_dir2 = "01")) then
        t_out2 <= up_req;
    elsif (((l_floor2 < down_req) or (l_floor2 = down_req)) and (l_dir2 = "10")) then
        t_out2 <= up_req;
    else
        for i in 0 to 3 loop
            if (up_req(i)='1') then
                s_up(i) <= '1';
            end if;
            if (down_req(i)='1') then
                s_down(i) <= '1';
            end if;
        end loop;
    end if;

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