library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity paddd_32 is
  Port (a32,b32: in std_logic_vector(31 downto 0);
        c32: out std_logic_vector(31 downto 0));
end paddd_32;

architecture Behavioral of paddd_32 is
component full_adder_8 is
  Port (a8,b8: in std_logic_vector(7 downto 0);
        cin8: in std_logic;
        s8: out std_logic_vector(7 downto 0 );
        cout8: out std_logic);
end component;
signal cin_signal: std_logic_vector( 4 downto 0):=(others => '0');

begin
paddd32_inst0 : full_adder_8 port map (a8=> a32(7 downto 0),b8=> b32(7 downto 0),cin8=> cin_signal(0),s8=> c32(7 downto 0),cout8 => cin_signal(1) );
paddd32_inst1 : full_adder_8 port map (a8=> a32(15 downto 8),b8=> b32(15 downto 8),cin8=> cin_signal(1),s8=> c32(15 downto 8),cout8 => cin_signal(2) );
paddd32_inst2 : full_adder_8 port map (a8=> a32(23 downto 16),b8=> b32(23 downto 16),cin8=> cin_signal(2),s8=> c32(23 downto 16),cout8 => cin_signal(3) );
paddd32_inst3 : full_adder_8 port map (a8=> a32(31 downto 24),b8=> b32(31 downto 24),cin8=> cin_signal(3),s8=> c32(31 downto 24),cout8 => cin_signal(4) );


end Behavioral;
