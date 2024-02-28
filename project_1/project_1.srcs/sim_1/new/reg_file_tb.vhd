library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegFile_tb is
end RegFile_tb;

architecture Behavioral of RegFile_tb is
    signal clk: std_logic := '0';
    signal rst: std_logic := '0';
    signal write_en: std_logic := '0';
    signal read_en: std_logic := '0';
    signal write_addr: std_logic_vector(2 downto 0) := "000";
    signal read_addr1: std_logic_vector(2 downto 0) := "001";
    signal read_addr2: std_logic_vector(2 downto 0) := "010";
    signal data_in: std_logic_vector(63 downto 0) := x"123456789ABCDEF0";
    signal data_out1: std_logic_vector(63 downto 0);
    signal data_out2: std_logic_vector(63 downto 0);
begin
    -- Instantiate the RegFile component
    reg_file_inst: entity work.RegFile
        port map (
            clk => clk,
            rst => rst,
            write_en => write_en,
            read_en => read_en,
            write_addr => write_addr,
            read_addr1 => read_addr1,
            read_addr2 => read_addr2,
            data_in => data_in,
            data_out1 => data_out1,
            data_out2 => data_out2
        );

    -- Clock process
    clk_process: process
    begin
        while now < 1000 ns loop
            clk <= not clk;
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        rst <= '1';
        wait for 10 ns;
        rst <= '0';

        wait for 10 ns;
        
        -- Read from register 1 and 2
        read_en <= '1';
        wait for 10 ns;

        -- Write operation to register 1
        write_en <= '1';
        read_en <= '0';
        write_addr <= "001";
        data_in <= x"A5A5A5A5A5A5A5A5";
        wait for 10 ns;


        -- Another write operation to register 3
        write_en <= '1';
        write_addr <= "011";
        data_in <= x"000000000000FFFF";
        wait for 10 ns;

        -- Read from register 3 and 4
        read_en <= '1';
        wait for 10 ns;

        -- Disable the register file
        write_en <= '0';
        read_en <= '0';
        wait for 10 ns;

        wait;
    end process;
end Behavioral;
