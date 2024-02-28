library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity paddw_16 is
  Port (a16,b16: in std_logic_vector(15 downto 0);
        c16: out std_logic_vector(15 downto 0));
end paddw_16;

architecture Behavioral of paddw_16 is
component full_adder_8 is
  Port (a8,b8: in std_logic_vector(7 downto 0);
        cin8: in std_logic;
        s8: out std_logic_vector(7 downto 0 );
        cout8: out std_logic);
end component;
signal cin_signal: std_logic_vector(2 downto 0):="000";
begin

paddw16_inst0 : full_adder_8 port map (a8=> a16(7 downto 0),b8=> b16(7 downto 0),cin8=> cin_signal(0),s8=> c16(7 downto 0),cout8 => cin_signal(1) );
paddw16_inst1 : full_adder_8 port map (a8=> a16(15 downto 8),b8=> b16(15 downto 8),cin8=> cin_signal(1),s8=> c16(15 downto 8),cout8 => cin_signal(2) );

end Behavioral;
