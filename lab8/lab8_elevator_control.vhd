entity request_handler is
port (
    up_request: in std_logic_vector(3 downto 0);
    down_request: in std_logic_vector(3 downto 0);
    reset: in std_logic_vector;
    task_out1: out std_logic_vector(3 downto 0);
    task_out2: out std_logic_vector(3 downto 0);
    up_request_ind: out std_logic_vector(3 downto 0);
    down_request_ind: out std_logic_vector(3 downto 0);
    liftstat1: in std_logic_vector();
    liftstat2: in std_logic_vector()
);
end entity;

architecture beh of request_handler is
-- two sets of register
signal r_up: std_logic_vector(3 downto 0);
signal s_up: std_logic_vector(3 downto 0); 

signal r_down: std_logic_vector(3 downto 0);
signal s_donw: std_logic_vector(3 downto 0); 

begin

-- r_ stores requests to be handled
-- s_ 1 denotes request is assigned to lift or not type - upup downdown


end architecture;

entity lift_controller is
port (
    lift_floor: in std_logic_vector(3 downto 0);
    door_open: in std_logic;
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