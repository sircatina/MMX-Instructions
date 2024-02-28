library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_sb is
  Port (
    a_sb, b_sb: in std_logic_vector(7 downto 0);
    c_sb: out std_logic_vector(7 downto 0)
  );
end adder_sb;

architecture Behavioral of adder_sb is

  component full_adder_8 is
    Port (
      a8, b8: in std_logic_vector(7 downto 0);
      cin8: in std_logic;
      s8: out std_logic_vector(7 downto 0);
      cout8: out std_logic
    );
  end component;

  signal sum: std_logic_vector(7 downto 0) := (others => '0');
  signal a: std_logic_vector(7 downto 0) := (others => '0');
  signal b: std_logic_vector(7 downto 0) := (others => '0');
  signal cin_signal: std_logic_vector(1 downto 0) := (others => '0');

begin
  a <= a_sb;
  b <= b_sb;

  paddb64_inst0: full_adder_8 port map (a8 => a, b8 => b, cin8 => cin_signal(0), s8 => sum, cout8 => cin_signal(1));

  -- Saturation logic
  -- Saturation logic
  process
  begin
    if (a(7) = '0' and b(7) = '0' and sum(7) = '1') then
      c_sb <= "01111111";  -- Maximum positive value
    elsif (a(7) = '1' and b(7) = '1' and cin_signal(1) = '1') then
      c_sb <= "10000000";  -- Minimum negative value
    else
      c_sb <= sum(7 downto 0);
    end if;
    wait for 1 ns;
  end process;

end Behavioral;
