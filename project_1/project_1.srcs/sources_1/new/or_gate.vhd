library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is
  Port (a,b: in std_logic;
        c: out std_logic );
end or_gate;

architecture Behavioral of or_gate is

begin

c<= a or b;

end Behavioral;
