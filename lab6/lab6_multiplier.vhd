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
    a, b: in std_logic_vector(6 downto 0);
    ci: in std_logic;
    co: out std_logic;
    so: out std_logic_vector(6 downto 0)
    );
end entity;

architecture beh of cpa is

signal cint: std_logic_vector(5 downto 0);

component fadd
	port(
		a, b, ci: in std_logic;
        s, co: out std_logic
	);
end component;

begin
    cpa: for I in 0 to 6 generate

    lowest_adder: if I=0 generate
      uo: fadd port map(
        a => a(I),
        b => b(I),
        ci => ci,
        s => so(I),
        co => cint(I)
      );
    end generate lowest_adder;

    upper_adder: if (I>0 and I<6) generate
      ux: fadd port map(
        a => a(I),
        b => b(I),
        ci => cint(I-1),
        s => so(I),
        co => cint(I)
      );
    end generate upper_adder;
    
    top_adder: if I=6 generate
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