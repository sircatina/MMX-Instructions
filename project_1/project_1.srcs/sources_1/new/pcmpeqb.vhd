library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pcmpeqb is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end pcmpeqb;

architecture Behavioral of pcmpeqb is
component comp_8 is
  Port ( a,b: in std_logic_vector(7 downto 0);
        c: out std_logic_vector(7 downto 0));
end component;
begin

pcmpeqb_instr0: comp_8 port map (a=> a64(7 downto 0),b=>b64(7 downto 0) ,c=>c64(7 downto 0));
pcmpeqb_instr1: comp_8 port map (a=> a64(15 downto 8),b=>b64(15 downto 8) ,c=>c64(15 downto 8));
pcmpeqb_instr2: comp_8 port map (a=> a64(23 downto 16),b=>b64(23 downto 16) ,c=>c64(23 downto 16));
pcmpeqb_instr3: comp_8 port map (a=> a64(31 downto 24),b=>b64(31 downto 24) ,c=>c64(31 downto 24));
pcmpeqb_instr4: comp_8 port map (a=> a64(39 downto 32),b=>b64(39 downto 32) ,c=>c64(39 downto 32));
pcmpeqb_instr5: comp_8 port map (a=> a64(47 downto 40),b=>b64(47 downto 40) ,c=>c64(47 downto 40));
pcmpeqb_instr6: comp_8 port map (a=> a64(55 downto 48),b=>b64(55 downto 48) ,c=>c64(55 downto 48));
pcmpeqb_instr7: comp_8 port map (a=> a64(63 downto 56),b=>b64(63 downto 56) ,c=>c64(63 downto 56));

end Behavioral;
