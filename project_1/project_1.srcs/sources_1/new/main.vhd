library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main is
  Port (clock: in std_logic;
        reset: in std_logic;
        ok: in std_logic;
        count: in std_logic;
        instr: in std_logic_vector(11 downto  0);
        instrLed: out std_logic_vector(5 downto  0);
        an : out STD_LOGIC_VECTOR (3 downto 0);
        cat : out STD_LOGIC_VECTOR (6 downto 0)
  );
end main;

architecture Behavioral of main is
component mmx_operations is
  Port (
  no1: in std_logic_vector(63 downto 0);
  no2: in std_logic_vector(63 downto 0);
  opcode: in std_logic_vector(5 downto 0);
  nr_out: out std_logic_vector(63 downto 0);
  finish: out std_logic
   );
end component;
component RegFile is
    Port ( clk       : in STD_LOGIC;
           rst       : in STD_LOGIC;
           write_en  : in STD_LOGIC;
           read_en   : in STD_LOGIC;
           write_addr: in STD_LOGIC_VECTOR(2 downto 0);
           read_addr1 : in STD_LOGIC_VECTOR(2 downto 0);
           read_addr2 : in STD_LOGIC_VECTOR(2 downto 0);
           data_in   : in STD_LOGIC_VECTOR(63 downto 0);
           data_out1  : out STD_LOGIC_VECTOR(63 downto 0);
           data_out2  : out STD_LOGIC_VECTOR(63 downto 0)
         );
end component;
component MPG is
    Port ( en : out STD_LOGIC;
           input : in STD_LOGIC;
           clock : in STD_LOGIC);
end component;
component SSD is
    Port ( clk: in STD_LOGIC;
           digits: in STD_LOGIC_VECTOR(15 downto 0);
           an: out STD_LOGIC_VECTOR(3 downto 0);
           cat: out STD_LOGIC_VECTOR(6 downto 0));
end component;
-----------signals

signal enable_signal  :  STD_LOGIC:='0';
signal resett  :  STD_LOGIC:='0';
signal write_en_signal  :  STD_LOGIC:='0';
signal read_en_signal   :  STD_LOGIC:='0';
signal write_addr_signal:  STD_LOGIC_VECTOR(2 downto 0);
signal read_addr1_signal :  STD_LOGIC_VECTOR(2 downto 0);
signal read_addr2_signal :  STD_LOGIC_VECTOR(2 downto 0);
signal data_in_signal   :  STD_LOGIC_VECTOR(63 downto 0);
signal reg_out1  :  STD_LOGIC_VECTOR(63 downto 0):=(others=>'0');
signal reg_out2  :  STD_LOGIC_VECTOR(63 downto 0):=(others=>'0');
signal mmx_out_signal  :  STD_LOGIC_VECTOR(63 downto 0):=(others=>'0');
signal finish_signal   :  STD_LOGIC:='0';
signal ok_delayed : std_logic := '0';
signal count_signal : std_logic := '0';
signal count_ssd: STD_LOGIC_VECTOR(1 downto 0) := "00";
signal data : std_logic_vector(15 downto 0):=(others=>'0');
signal last_mmx_out_signal : STD_LOGIC_VECTOR(63 downto 0) := (others => '0');


begin

mpg_port_map_ok: MPG port map( en=>enable_signal,input =>ok, clock =>clock);
mpg_port_map_count: MPG port map( en=>count_signal,input =>count, clock =>clock);
reset_port_map: MPG port map( en=>resett,input =>reset, clock =>clock);

reg_file_port_map: RegFile port map ( clk => clock , rst=> resett, write_en=> write_en_signal, read_en => enable_signal,
                                         write_addr=> instr(8 downto 6),read_addr1 => instr(11 downto 9), read_addr2 => instr(8 downto 6),
                                         data_in   => mmx_out_signal, data_out1 => reg_out1, data_out2 =>reg_out2 );
operations: mmx_operations port map ( no1=>reg_out1, no2=>reg_out2, opcode=>instr( 5 downto 0), nr_out=>mmx_out_signal, finish=>finish_signal);
ssd_afisor: SSD port map(clock, data,  an, cat);
-- Process with delay implementation
process(clock)
begin
    if rising_edge(clock) then
        -- First, capture the state of ok into ok_delayed
        ok_delayed <= enable_signal;
        instrLed<= instr(5 downto 0);
        -- Then use the delayed state to set write_en_signal
        write_en_signal <= ok_delayed;
    end if;
end process;

process(clock)
    variable last_count_signal : std_logic := '0'; -- Variable to hold the last state of count_signal
begin
    if rising_edge(clock) then
        -- Reset count_ssd if mmx_out_signal changes
        if mmx_out_signal /= last_mmx_out_signal then
            count_ssd <= "00";
        end if;

        -- Edge detection for count_signal
        if count_signal = '1' and last_count_signal = '0' then
            if count_ssd = "11" then
                count_ssd <= "00"; -- Reset to 00 if it is already "11"
            else
                count_ssd <= std_logic_vector(unsigned(count_ssd) + 1); -- Increment count_ssd
            end if;
        end if;
        last_count_signal := count_signal; -- Update the last state of count_signal

        -- Update last_mmx_out_signal
        last_mmx_out_signal <= mmx_out_signal;

        -- Selecting the appropriate 16-bit segment from mmx_out_signal
        case count_ssd is
            when "00" =>
                data <= mmx_out_signal(63 downto 48);
            when "01" =>
                data <= mmx_out_signal(47 downto 32);
            when "10" =>
                data <= mmx_out_signal(31 downto 16);
            when others =>
                data <= mmx_out_signal(15 downto 0);
        end case;
    end if;
end process;

end Behavioral;
