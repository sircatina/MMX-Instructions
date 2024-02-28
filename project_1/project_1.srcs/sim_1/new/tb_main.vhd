library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_main is
--  Port ( );
end tb_main;

architecture Behavioral of tb_main is
  constant clk_period : time := 10 ns;  -- Define the clock period constant
  
  component main is
    Port (
      a: in std_logic_vector(63 downto 0);
      b: in std_logic_vector(63 downto 0);
      xor_final: out std_logic_vector(63 downto 0);
      or_final: out std_logic_vector(63 downto 0);
      and_final: out std_logic_vector(63 downto 0);
      nand_final: out std_logic_vector(63 downto 0)
    );
  end component;

  signal a, b, xor_final, or_final, and_final, nand_final: std_logic_vector(63 downto 0);
  signal clk: std_logic := '0';

begin
  uut: main port map (a, b, xor_final, or_final, and_final, nand_final);

  -- Clock generation process
  clk_process: process
  begin
    while true loop
      clk <= not clk;
      wait for clk_period / 2;
    end loop;
  end process clk_process;

process
begin
  -- Test Case 1: All zeros
  a <= (others => '0');
  b <= (others => '0');
  wait for 10 ns;

  -- Test Case 2: All ones
  a <= (others => '1');
  b <= (others => '1');
  wait for 10 ns;

  -- Test Case 3: Alternate pattern
  a <= (others => '1');
  b <= (others => '0');
  wait for 10 ns;
  
  -- Test Case 4: Alternate pattern
  a <= (others => '0');
  b <= (others => '1');
  wait for 10 ns;
wait;
  end process;
  -- Stop simulation after some time
 

end Behavioral;
