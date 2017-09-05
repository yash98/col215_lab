library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY subtract IS
	PORT (subinput: IN 
		  num1: IN std_logic_vector (0 TO 7);
		  num2: IN std_logic_vector (0 TO 7);
		  ret1: OUT std_logic_vector (0 TO 7);
		  ret2: OUT std_logic_vector (0 TO 7);
		 );
END ENTITY;
ARCHITECHTURE wubalubadubdub OF subtract IS
	SIGNAL t1 std_logic_vector (0 TO 7) := "00000000";
	SIGNAL t2 std_logic_vector (0 TO 7) := "00000000";
BEGIN
	PROCESS
	IF (num1>num2) THEN 
		IF(num1(0 downto 3) > num2(0 downto 3)) THEN
			t1(0 downto 3) <= num1(0 downto 3) - num2(3 downto 0);
			t1(4 downto 7) <= num1(4 downto 7) - num2(4 downto 7);
		ELSE
			t1(0 downto 3) <= num1(0 downto 3) - num2(3 downto 0) + "1010";
			t1(4 downto 7) <= num1(4 downto 7) - num2(4 downto 7) - "0001";
		END IF
		t2 <= num2;
		
	ELSE 
		IF(num1(0 downto 3) > num2(0 downto 3)) THEN
			t2(0 downto 3) <= num2(0 downto 3) - num1(3 downto 0) + "1010";
			t2(4 downto 7) <= num2(4 downto 7) - num1(4 downto 7) - "0001";
		ELSE
			t2(0 downto 3) <= num2(0 downto 3) - num1(3 downto 0);
			t2(4 downto 7) <= num2(4 downto 7) - num1(4 downto 7);
		END IF
		t1 <= num1;
		
	END IF
	ret1 <= t1;
	ret2 <= t2;
	
END ARCHITECTURE wubalubadubdub;
