library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
  Port (a,b: in std_logic;
        c: out std_logic );
end and_gate;

architecture Behavioral of and_gate is

begin

c<= a and b;

end Behavioral;
