library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity gcd is
    port (
        a_i: in std_logic_vector(7 downto 0);
        b_i: in std_logic_vector(7 downto 0);
        push_i: in std_logic;
        pushbutton: in std_logic;
        clk: in std_logic;
        load: out std_logic;
        sub: out std_logic;
        op_valid: out std_logic;
        d_o: out std_logic_vector(15 downto 0)
        );
end entity;

architecture beh of gcd is
signal ten: std_logic_vector (3 downto 0) := "1010";

signal t: std_logic:= '0';
signal eoc: std_logic_vector (0 to 27) := "1011111010111100000111111111";
signal c: std_logic_vector (0 to 27) := "0000000000000000000000000000";

signal a: std_logic_vector (7 downto 0);
signal b: std_logic_vector (7 downto 0);

signal op_valid_i: std_logic := '0';
signal load_i: std_logic := '0';
signal sub_i: std_logic := '0';
signal load_i1: std_logic := '0';
signal sub_i1: std_logic := '0';
signal mod_clk: std_logic := '0';
begin
    process(clk, pushbutton)
            begin
                if (pushbutton = '1') then
                      mod_clk <= clk;
                      c <= "0000000000000000000000000000";
                      t <= '0';
                else
                    if (clk = '1' and clk'event) then
                        if c = eoc then
                            c <= "0000000000000000000000000000";
                            t <= not t;
                        else c <= c + "0000000000000000000000000000";
                        end if;
                        mod_clk <= t;
                   end if;
                end if;
        end process;

    process (push_i, a_i, b_i)
    begin
        if (a_i(3 downto 0) < ten and a_i(7 downto 4) < ten and b_i(3 downto 0) < ten and b_i(7 downto 4) < ten) then
            op_valid_i <= '1';
            if (push_i = '1') then
                load_i1 <= '1';
                sub_i1 <= '0';
            else load_i <= '0';
            end if;
        else
            op_valid_i <= '0';
            load_i1 <= '0';
            sub_i1 <= '0';
        end if;
    end process;
    
    process (mod_clk, push_i, a_i, b_i, op_valid_i)
    begin
        if (op_valid_i = '1') then
                if (push_i = '1') then
                    load_i <= '1';
                    sub_i <= '0';
                else load_i <= '0';
                end if;
        else
            load_i <= '0';
            sub_i <= '0';
        end if;
        if (mod_clk = '1' and mod_clk'event) then
            if (load_i = '1') then
                a <= a_i;
                b <= b_i;
                sub_i <= '1';
                load_i <= '0';
            end if;
            if (sub_i = '1') then
                if (a > b) then
                    if a (3 downto 0) < b (3 downto 0) then
                        a <= a(7 downto 4) - b(7 downto 4) - "0001" & a(3 downto 0) - b(3 downto 0) + "1010";
                        b <= b;
                      else
                          a <= a(7 downto 4) - b(7 downto 4) & a(3 downto 0) - b(3 downto 0);
                          b <= b;
                      end if;
                 elsif (b > a) then
                      if (a (3 downto 0) > b (3 downto 0)) then
                            b <= b(7 downto 4) - a(7 downto 4) - "0001" & b(3 downto 0) - a(3 downto 0) + "1010";
                            a <= a;
                      else
                            b <= b(7 downto 4) - a(7 downto 4) & b(3 downto 0) - a(3 downto 0);
                            a <= a;
                      end if;
                 elsif (b = a) then
                      sub_i <= '0';
                end if;
            end if;
        end if;
    end process;
    
    sub <= sub_i1;
    load <= load_i1;
    op_valid <= op_valid_i;
    d_o <= a & b;

end architecture;
        
        
    
