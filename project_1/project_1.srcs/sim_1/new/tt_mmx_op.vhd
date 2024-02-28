library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mmx_operations_tb is
end mmx_operations_tb;

architecture tb_arch of mmx_operations_tb is
  -- Instantiate the mmx_operations entity
  component mmx_operations
    Port (
      no1: in std_logic_vector(63 downto 0);
      no2: in std_logic_vector(63 downto 0);
      opcode: in std_logic_vector(5 downto 0);
      nr_out: out std_logic_vector(63 downto 0);
      finish: out std_logic
    );
  end component;

  signal clock, rst : std_logic := '0';
  signal no1t, no2t, nr_outt : std_logic_vector(63 downto 0) := (others => '0');
  signal finisht : std_logic := '0';
  signal opcodet : std_logic_vector(5 downto 0);

begin
-- Instantiate the mmx_operations entity
  mmx_op_inst : mmx_operations
    port map (
      no1 => no1t,
      no2 => no2t,
      opcode => opcodet,
      nr_out => nr_outt,
      finish => finisht );
  -- Clock process
clock_process: process
begin
  while now < 2000 ns loop
    clock <= not clock;
    wait for 5 ns;
  end loop;
  wait;  -- Wait indefinitely after generating the clock
end process;



  -- Stimulus process
  stimulus_process: process
  begin
   wait for 10 ns;
    -- Apply inputs
    no1t <= X"FFFFFFFFFFFFFFFF";
    no2t <= X"8000800080008000";
    wait for 10 ns;
     
    -- Case 1: PADDB
    opcodet <= "010000";
     wait for 10 ns;

    -- Case 2: PADDW
    opcodet <= "010001";
     wait for 10 ns;

    -- Case 3: PADDD
    opcodet <= "010010";
     wait for 10 ns;

    -- Case 4: PADDSB
    opcodet <= "010101";
    wait for 10 ns;

    -- Case 5: PADDSW
    opcodet <= "010110";
    wait for 10 ns;

    -- Case 6: PADDUSB
    opcodet <= "011001";
     wait for 10 ns;

    -- Case 7: PADDUSW
    opcodet <= "011010";
     wait for 10 ns;

    -- Case 8: PAND
    opcodet <= "000000";
     wait for 10 ns;

    -- Case 9: PANDN
    opcodet <= "000001";
     wait for 10 ns;

    -- Case 10: POR
    opcodet <= "000010";
     wait for 10 ns;

    -- Case 11: PXOR
    opcodet <= "000011";
     wait for 10 ns;

    -- Case 12: PCMPEQB
    opcodet <= "110000";
    wait for 10 ns;

    -- Case 13: PCMPEQW
    opcodet <= "110001";
    wait for 10 ns;
    -- Case 14: PCMPEQBD
    opcodet <= "110010";
     wait for 10 ns;

    wait;
  end process;

end tb_arch;
