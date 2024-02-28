library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Ensure this library is used for arithmetic operations

entity comp_8 is
    Port (
        a, b: in std_logic_vector(7 downto 0);
        c: out std_logic_vector(7 downto 0)
    );
end comp_8;

architecture Behavioral of comp_8 is
begin
    process(a, b) -- Ensuring sensitivity to changes in 'a' and 'b'
    begin
        if to_integer(unsigned(a)) = to_integer(unsigned(b)) then
            c <= X"FF";
        else 
            c <= X"00";
        end if;
    end process;
end Behavioral;
