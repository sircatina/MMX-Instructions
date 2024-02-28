library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pcmpeqw is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end pcmpeqw;

architecture Behavioral of pcmpeqw is

component comp_16 is
  Port ( a,b: in std_logic_vector(15 downto 0);
        c: out std_logic_vector(15 downto 0));
end component;
begin

pcmpeqw_instr0: comp_16 port map (a=> a64(15 downto 0),b=>b64(15 downto 0) ,c=>c64(15 downto 0));
pcmpeqw_instr1: comp_16 port map (a=> a64(31 downto 16),b=>b64(31 downto 16) ,c=>c64(31 downto 16));
pcmpeqw_instr2: comp_16 port map (a=> a64(47 downto 32),b=>b64(47 downto 32) ,c=>c64(47 downto 32));
pcmpeqw_instr3: comp_16 port map (a=> a64(63 downto 48),b=>b64(63 downto 48) ,c=>c64(63 downto 48));

end Behavioral;
