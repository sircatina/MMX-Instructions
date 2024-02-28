library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_64 is
  Port (
    a64, b64: in std_logic_vector(63 downto 0);
    c64: out std_logic_vector(63 downto 0)
  );
end and_64;

architecture Behavioral of and_64 is
  component and_gate is
    Port (a, b: in std_logic; 
             c: out std_logic);
  end component;

begin
  Generator_and_64: 
  for i in 0 to 63 generate
    and_gate_64: and_gate port map (a => a64(i), b => b64(i), c => c64(i));
  end generate;

end Behavioral;
