library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_paddusb is
--  Port ( );
end tb_paddusb;

architecture Behavioral of tb_paddusb is
component paddusb is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
signal a64t, b64t, c64t: std_logic_vector(63 downto 0);

begin
 a1: paddusb port map (a64t, b64t, c64t);

  stimulus_process: process
  begin
    -- Apply inputs
    a64t <= X"9999999999999999";
    b64t <= X"5555555555555555";
    wait for 10 ns;  -- Adjust the time based on your design requirements

     a64t <= X"4444444444444444";
    b64t <= X"5555555555555555";
    wait for 10 ns;  -- Adjust the time based on your design requirements
 
    a64t <= X"9999999999999999";
    b64t <= X"9999999999999999";
    wait for 10 ns;  -- Adjust the time based on your design requirements

    wait;  -- Wait indefinitely after stimulus
  end process;

end Behavioral;
