library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comp_16 is
  Port ( a,b: in std_logic_vector(15 downto 0);
        c: out std_logic_vector(15 downto 0));
end comp_16;

architecture Behavioral of comp_16 is

begin
process(a,b) 
begin
    if to_integer(unsigned(a)) = to_integer(unsigned(b)) then
        c<=X"FFFF";
    else 
        c<=X"0000";
    end if;
end process;
end Behavioral;
