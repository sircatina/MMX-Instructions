library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pcmpeqd is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end pcmpeqd;

architecture Behavioral of pcmpeqd is
component comp_32 is
  Port ( a,b: in std_logic_vector(31 downto 0);
        c: out std_logic_vector(31 downto 0));
end component;
begin

pcmpeqd_instr0: comp_32 port map (a=> a64(31 downto 0),b=>b64(31 downto 0) ,c=>c64(31 downto 0));
pcmpeqd_instr1: comp_32 port map (a=> a64(63 downto 32),b=>b64(63 downto 32) ,c=>c64(63 downto 32));

end Behavioral;
