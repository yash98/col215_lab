library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY bit8_register IS
	PORT (
		clk: IN std_logic;
		sub_o: out std_logic;
		write1: IN std_logic_vector (7 downto 0);
		read1: OUT std_logic_vector (7 downto 0)
		  );
END ENTITY;

ARCHITECTURE beh OF bit8_register IS
	SIGNAL t: std_logic_vector (7 downto 0) := "00000000";
BEGIN
	PROCESS (clk, load_i)
	   BEGIN
		IF (clk = '1') AND (clk'EVENT) THEN
			t <= write1;
			sub_o <= '1';
		END IF;
	END PROCESS;
	read1 <= t;
END ARCHITECTURE beh;


