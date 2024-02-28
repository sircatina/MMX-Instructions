library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mmx_testbench is
end mmx_testbench;

architecture Behavioral of mmx_testbench is
  component main is
  Port (clock: in std_logic;
        reset: in std_logic;
        ok: in std_logic;
        instr: in std_logic_vector(11 downto  0);
        instrLed: out std_logic_vector(5 downto  0);
        alu_output:out std_logic_vector(63 downto 0)
  );
  end component;

  signal clock: std_logic := '0';  -- Initialize the clock
  signal reset: std_logic := '0';
  signal ok: std_logic := '0';
  signal wr_en: std_logic := '0';
  signal instr: std_logic_vector(11 downto 0) := (others => '0');
  signal alu_output: std_logic_vector(63 downto 0);
  signal output: std_logic_vector(63 downto 0) := (others => '0');
  signal REG1: std_logic_vector(63 downto 0);
  signal REG2: std_logic_vector(63 downto 0);
  signal instrLed: std_logic_vector(5 downto  0);

begin
  mmx: main port map (clock, reset, ok, instr,instrLed, alu_output);

  clock_process: process
  begin
    while now < 2000 ns loop
      clock <= not clock;
      wait for 5 ns;
    end loop;
    wait;  -- Wait indefinitely after generating the clock
  end process;

  stimulus_process: process
  begin
  wait for 10 ns;
    reset <= '0';  
    
    instr <= B"000_001_010110"; --reg 1 reg 7 PADDB ----primu
    ok <= '1';
    wait for 20 ns;
    ok <= '0';

    wait for 10 ns;
    
    instr <= B"010_010_110001"; --reg 1 reg 2 PADDB ------al doilea
    ok <= '1';
    wait for 20 ns;
    ok <= '0';
    wait for 10 ns;
    
    instr <= B"110_100_110001"; --REG3 REG4 PADDW -----------al treilea
    ok <= '1';
    wait for 20 ns;
    ok <= '0';
    wait for 10 ns;
   
    wait;  -- Wait indefinitely after stimulus
  end process;

end Behavioral;
