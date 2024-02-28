library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_gate is
  Port (a,b: in std_logic;
        c: out std_logic );
end nand_gate;

architecture Behavioral of nand_gate is

begin

c<= a nand b;

end Behavioral;
