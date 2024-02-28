library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity paddb is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end paddb;

architecture Behavioral of paddb is

component full_adder_8 is
  Port (a8,b8: in std_logic_vector(7 downto 0);
        cin8: in std_logic;
        s8: out std_logic_vector(7 downto 0 );
        cout8: out std_logic);
end component;

signal cin_signal: std_logic_vector( 8 downto 0):=(others => '0');

begin

paddb64_inst0 : full_adder_8 port map (a8 => a64(7 downto 0), b8 => b64(7 downto 0), cin8 => cin_signal(0), s8 => c64(7 downto 0), cout8 => cin_signal(1));
paddb64_inst1 : full_adder_8 port map (a8 => a64(15 downto 8), b8 => b64(15 downto 8), cin8 => cin_signal(0), s8 => c64(15 downto 8), cout8 => cin_signal(2));
paddb64_inst2 : full_adder_8 port map (a8 => a64(23 downto 16), b8 => b64(23 downto 16), cin8 => cin_signal(0), s8 => c64(23 downto 16), cout8 => cin_signal(3));
paddb64_inst3 : full_adder_8 port map (a8 => a64(31 downto 24), b8 => b64(31 downto 24), cin8 => cin_signal(0), s8 => c64(31 downto 24), cout8 => cin_signal(4));
paddb64_inst4 : full_adder_8 port map (a8 => a64(39 downto 32), b8 => b64(39 downto 32), cin8 => cin_signal(0), s8 => c64(39 downto 32), cout8 => cin_signal(5));
paddb64_inst5 : full_adder_8 port map (a8 => a64(47 downto 40), b8 => b64(47 downto 40), cin8 => cin_signal(0), s8 => c64(47 downto 40), cout8 => cin_signal(6));
paddb64_inst6 : full_adder_8 port map (a8 => a64(55 downto 48), b8 => b64(55 downto 48), cin8 => cin_signal(0), s8 => c64(55 downto 48), cout8 => cin_signal(7));
paddb64_inst7 : full_adder_8 port map (a8 => a64(63 downto 56), b8 => b64(63 downto 56), cin8 => cin_signal(0), s8 => c64(63 downto 56), cout8 => cin_signal(8));


end Behavioral;
