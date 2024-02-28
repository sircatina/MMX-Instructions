library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_8 is
  Port (a8,b8: in std_logic_vector(7 downto 0);
        c8: out std_logic_vector(7 downto 0));
end nand_8;

architecture Behavioral of nand_8 is
component nand_gate is
  Port (a,b: in std_logic;
        c: out std_logic );
end component;
begin
Generator_nand_8 : for i in 0 to 7 generate

  nandi: nand_gate port map  (a=>a8(i),b=> b8(i), c=>c8(i));

end generate;

end Behavioral;
