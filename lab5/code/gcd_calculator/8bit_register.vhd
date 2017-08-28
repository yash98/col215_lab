library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY bit8_register IS
	PORT (
		Clk: IN std_logic;
		load_i: in std_logic;
		load_o: out std_logic;
		write: IN std_logic_vector (7 downto 0);
		read: OUT std_logic_vector (7 downto 0)
		  );
END ENTITY;

ARCHITECTURE beh OF bit8_register IS
	SIGNAL t: std_logic_vector (7 downto 0) := "00000000";
BEGIN
	PROCESS (Clk, load_i)
	   BEGIN
		IF (Clk = '1') AND (Clk'EVENT) AND (load_i = '1') THEN
			t <= write;
			load_o <= '0';
		END IF;
	END PROCESS;
	read <= t;
END ARCHITECTURE beh;


