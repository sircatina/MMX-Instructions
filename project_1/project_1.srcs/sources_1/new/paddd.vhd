library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity paddd is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end paddd;

architecture Behavioral of paddd is
component paddd_32 is
  Port (a32,b32: in std_logic_vector(31 downto 0);
        c32: out std_logic_vector(31 downto 0));
end component;

begin
--double word1
paddd64_inst0 : paddd_32 port map (a32=> a64(31 downto 0),b32=> b64(31 downto 0),c32=> c64(31 downto 0));
--double word2
paddd64_inst2 : paddd_32 port map (a32=> a64(63 downto 32),b32=> b64(63 downto 32),c32=> c64(63 downto 32));

end Behavioral;
