library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY bit8_register IS
	PORT (Clk: IN bit;
		 write: IN std_logic_vector (0 TO 7);
		 read: OUT std_logic_vector(0 TO 7)
		  );
END ENTITY;

ARCHITECTURE beh OF bit8_register IS

	SIGNAL t: std_logic_vector (0 downto 7) := "00000000";
BEGIN
	PROCESS (Clk)
	   BEGIN
		IF (Clk = '1') AND (clk'EVENT) THEN
			t <= write;
		END IF;
	END PROCESS;
	read <= t;
END ARCHITECTURE beh;


