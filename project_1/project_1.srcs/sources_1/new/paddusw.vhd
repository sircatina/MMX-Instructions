library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity paddusw is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end paddusw;

architecture Behavioral of paddusw is
component paddusw_16 is
  Port (a16,b16: in std_logic_vector(15 downto 0);
        c16: out std_logic_vector(15 downto 0));
end component;
begin
--word1
paddusw64_inst0 : paddusw_16 port map (a16=> a64(15  downto 0),b16=> b64(15  downto 0),c16=> c64(15  downto 0) );
--word2
paddusw64_inst1 : paddusw_16 port map (a16=> a64(31 downto 16),b16=> b64(31 downto 16),c16=> c64(31 downto 16) );
--word3
paddusw64_inst2 : paddusw_16 port map (a16=> a64(47  downto 32),b16=> b64(47  downto 32),c16=> c64(47  downto 32) );
--word4
paddusw64_inst3 : paddusw_16 port map (a16=> a64(63 downto 48),b16=> b64(63 downto 48),c16=> c64(63 downto 48) );

end Behavioral;
