library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_64 is
  Port (
    a64, b64: in std_logic_vector(63 downto 0);
    c64: out std_logic_vector(63 downto 0)
  );
end or_64;

architecture Behavioral of or_64 is
component or_gate is
  Port (a,b: in std_logic;
        c: out std_logic );
end component;
begin
 
  Generator_and_64 : 
  for i in 0 to 63 generate

  or_gate_64: or_gate port map  (a=>a64(i),b=> b64(i),c=> c64(i));

end generate;
end Behavioral;
