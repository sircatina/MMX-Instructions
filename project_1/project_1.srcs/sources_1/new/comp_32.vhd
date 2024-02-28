library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comp_32 is
  Port ( a,b: in std_logic_vector(31 downto 0);
        c: out std_logic_vector(31 downto 0));
end comp_32;

architecture Behavioral of comp_32 is

begin
process(a,b)
begin
    if to_integer(unsigned(a)) = to_integer(unsigned(b)) then
        c<=X"FFFFFFFF";
    else 
        c<=X"00000000";
    end if;
end process;

end Behavioral;
