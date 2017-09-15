-- full adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fadd is
	port(
		a, b, ci: in std_logic;
		s, co: out std_logic
	);
end entity;

architecture beh of fadd is
begin
    s <= a xor b xor ci;
    co <= (a and b) or ((a or b) and ci);
end architecture;






-- carry propagate adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cpa is
    port(
    a, b: in std_logic_vector(7 downto 0);
    ci: in std_logic;
    co: out std_logic;
    so: out std_logic_vector(7 downto 0)
    );
end entity;

architecture beh of cpa is

signal cint: std_logic_vector(6 downto 0);

component fadd
	port(
		a, b, ci: in std_logic;
        s, co: out std_logic
	);
end component;

begin
    cpa: for I in 0 to 7 generate

    lowest_adder: if I=0 generate
      uo: fadd port map(
        a => a(I),
        b => b(I),
        ci => ci,
        s => so(I),
        co => cint(I)
      );
    end generate lowest_adder;

    upper_adder: if (I>0 and I<7) generate
      ux: fadd port map(
        a => a(I),
        b => b(I),
        ci => cint(I-1),
        s => so(I),
        co => cint(I)
      );
    end generate upper_adder;
    
    top_adder: if I=7 generate
          ut: fadd port map(
            a => a(I),
            b => b(I),
            ci => cint(I-1),
            s => so(I),
            co => co
          );
        end generate top_adder;
  end generate cpa;

end architecture;









-- carry save adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity csa is
    port(
    a, b, ci: in std_logic_vector(7 downto 0);
    co, so: out std_logic_vector(7 downto 0)
    );
end entity;

architecture beh of csa is

component fadd
	port(
		a, b, ci: in std_logic;
        s, co: out std_logic
	);
end component;

begin
    csa: for I in 0 to 7 generate
      uo: fadd port map(
        a => a(I),
        b => b(I),
        ci => ci(I),
        s => so(I),
        co => co(I)
      );
  end generate csa;

end architecture;








-- multiplier 1

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mult1 is
    port(
    a, b: in std_logic_vector(7 downto 0);
    p: out std_logic_vector(15 downto 0)
    );
end entity;

architecture beh of mult1 is

signal coint: std_logic_vector(5 downto 0); -- 7 box (used in all except last)
signal sint: std_logic_vector(41 downto 0); -- used 1 less than bits * i less than boxes
signal zero: std_logic:= '0';
signal aint: std_logic_vector(7 downto 0); -- used in one iteration for all bits
signal bint: std_logic_vector(55 downto 0); -- used 7 time with 8 inputs

component cpa is
    port(
    a, b: in std_logic_vector(7 downto 0);
    ci: in std_logic;
    co: out std_logic;
    so: out std_logic_vector(7 downto 0)
    );
end component;

begin
    mult1: for I in 0 to 6 generate
        
    lowest_adder: if I=0 generate
      genl1: for T in 1 to 7 generate
          aint(7*I+T-1) <= a(I) and b(T);
      end generate;
      aint(7) <= '0';
      genl2: for T in 0 to 7 generate
          bint(8*I+T) <= a(I+1) and b(T);
      end generate;
      ul: cpa port map(
        a => aint(7+I*8 downto 0+I*8),
        b => bint(7+I*8 downto 0+I*8),
        ci => zero,
        so(7 downto 1) => sint(6 downto 0),
        so(0) => p(I+1),
        co => coint(I)
      );
    end generate lowest_adder;
    
    upper_adder: if (I>0 and I<6) generate
        genx2: for T in 0 to 7 generate
            bint(8*I+T) <= a(I+1) and b(T);
        end generate;
        uu: cpa port map(
        a(6 downto 0) => sint(7*(I-1)+6 downto 7*(I-1)),
        a(7) => coint(I-1),
        b => bint(7+I*8 downto 0+I*8),
        ci => zero,
        so(7 downto 1) => sint(7*I+6 downto 7*I),
        so(0) => p(I+1),
        co => coint(I)
      );
    end generate upper_adder;
    
    top_adder: if I=6 generate
        gent2: for T in 0 to 7 generate
            bint(8*I+T) <= a(I+1) and b(T);
        end generate;
        ut: cpa port map(
        a(6 downto 0) => sint(7*(I-1)+6 downto 7*(I-1)),
        a(7) => coint(I-1),
        b => bint(7+I*8 downto 0+I*8),
        ci => zero,
        so(7 downto 0) => p(14 downto 7),
        co => p(15)
          );
        end generate top_adder;
    end generate mult1;
    p(0) <= a(0) and b(0);
    
end architecture;





-- multiplier 2

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mult2 is
    port(
    a, b: in std_logic_vector(7 downto 0);
    p: out std_logic_vector(15 downto 0)
    );
end entity;



architecture beh of mult2 is

signal sint: std_logic_vector(41 downto 0); -- used 1 less than bits * i less than boxes
signal zero: std_logic:= '0';
signal aint: std_logic_vector(7 downto 0); -- used in one iteration for all bits
signal bint: std_logic_vector(55 downto 0); -- used 7 time with 8 inputs

--check if this length is really required
signal carry: std_logic_vector(41 downto 0):= "00000000000000000000000000000000000000000";
signal coint: std_logic_vector(41 downto 0):= "00000000000000000000000000000000000000000";
signal f_bit: std_logic;


component cpa is
    port(
    a, b: in std_logic_vector(7 downto 0);
    ci: in std_logic;
    co: out std_logic;
    so: out std_logic_vector(7 downto 0)
    );
end component;

component csa is
    port(
    a, b, ci: in std_logic_vector(7 downto 0);
    co, so: out std_logic_vector(7 downto 0)
    );
end component;

begin
    mult2: for I in 0 to 6 generate
        
    lowest_adder: if I=0 generate
        genl1: for T in 1 to 7 generate
            aint(T-1) <= a(I) and b(T);
        end generate;
        aint(7) <= '0';
        genl2: for T in 0 to 7 generate
            bint(8*I+T) <= a(I+1) and b(T);
        end generate;
        genl3: for T in 1 to 7 generate
            carry(8*I+T) <= a(I+2) and b(T-1);
        end generate;
        carry(8*I+0) <= '0';
        u1: csa port map(
            a => aint(7+I*8 downto 0+I*8),
            b => bint(7+I*8 downto 0+I*8),
            ci => carry(7 downto 0),
            so(7 downto 1) => sint(7+I*8 downto 1+I*8),
            so(0) => p(I+1),
            co(7 downto 0) => coint(7+I*8 downto 0+I*8)
        );
     end generate lowest_adder;
     
     sint(8*I)<= b(7) and a(I+2);
     
     upper_adder: if (I>0 and I<6) generate
        genx3: for T in 1 to 7 generate
            carry(8*I+T) <= a(I+2) and b(T-1);
        end generate;
        carry(8*I+0) <='0';
        ux: csa port map(
            a => coint(7+(I-1)*8 downto 0+(I-1)*8),
            b(6 downto 0) => sint(7+(I-1)*8 downto 1+(I-1)*8),
            b(7) => sint(8*(I-1)),
            ci => carry(7+I*8 downto 0+I*8),
            so(7 downto 1) => sint(7+I*8 downto 1+I*8),
            so(0) => p(I+1),
            co(7 downto 0) => coint(7+I*8 downto 0+I*8)
         );
      end generate upper_adder;
         
      end_adder: if (I=6) generate
        ue: cpa port map(
            a => coint(7+(I-1)*8 downto 0+(I-1)*8),
            b(6 downto 0) => sint(7+(I-1)*8 downto 1+(I-1)*8),
            b(7) => sint(8*(I-1)),
            ci => '0',
            so(7 downto 0) => p(14 downto 7),
            so(15) => p(15)
         );
      end generate end_adder; 
     end generate mult2;
     p(0) <= a(0) and b(0);

end architecture;


