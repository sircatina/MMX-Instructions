library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity paddsb is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end paddsb;

architecture Behavioral of paddsb is
component adder_sb is
  Port (a_sb,b_sb: in std_logic_vector(7 downto 0);
        c_sb: out std_logic_vector(7 downto 0));
end component;
begin

paddb64_inst0 : adder_sb port map (a_sb=> a64(7 downto 0),b_sb=> b64(7 downto 0), c_sb=> c64(7 downto 0));
paddb64_inst1 : adder_sb port map (a_sb=> a64(15 downto 8),b_sb=> b64(15 downto 8), c_sb=> c64(15 downto 8));
paddb64_inst2 : adder_sb port map (a_sb=> a64(23 downto 16),b_sb=> b64(23 downto 16),c_sb=> c64(23 downto 16));
paddb64_inst3 : adder_sb port map (a_sb=> a64(31 downto 24),b_sb=> b64(31 downto 24),c_sb=> c64(31 downto 24));
paddb64_inst4 : adder_sb port map (a_sb=> a64(39 downto 32),b_sb=> b64(39 downto 32), c_sb=>  c64(39 downto 32));
paddb64_inst5 : adder_sb port map (a_sb=> a64(47 downto 40),b_sb=> b64(47 downto 40),c_sb=>  c64(47 downto 40));
paddb64_inst6 : adder_sb port map (a_sb=> a64(55 downto 48),b_sb=> b64(55 downto 48),c_sb=>  c64(55 downto 48));
paddb64_inst7 : adder_sb port map (a_sb=> a64(63 downto 56),b_sb=> b64(63 downto 56),c_sb=>  c64(63 downto 56));


end Behavioral;
