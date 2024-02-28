library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_pcmpeqb is
end tb_pcmpeqb;

architecture testbench of tb_pcmpeqb is
    -- Component declaration for the pcmpeqb entity
    component pcmpeqb
        Port (
            a64, b64: in std_logic_vector(63 downto 0);
            c64: out std_logic_vector(63 downto 0)
        );
    end component;

    -- Signals for testbench
    signal a64_signal, b64_signal, c64_signal: std_logic_vector(63 downto 0);

begin
    -- Instantiate the pcmpeqb entity
    UUT: pcmpeqb port map (
        a64 => a64_signal,
        b64 => b64_signal,
        c64 => c64_signal
    );

    -- Stimulus process
    stimulus_process: process
    begin
        -- Test vector 1
        a64_signal <= (others => '0');
        b64_signal <= (others => '0');
        wait for 10 ns;

        -- Test vector 2
        a64_signal <= (others => '1');
        b64_signal <= (others => '1');
        wait for 10 ns;

        a64_signal <= (others => '0');
        b64_signal <= (others => '1');
        wait for 10 ns;
        -- Add more test vectors here

        -- Terminate simulation
        wait;
    end process;

    -- Output checking process
    check_process: process
    begin
        wait for 10 ns; -- Wait for some time to ensure stable output

       
        wait;

    end process;

end testbench;
