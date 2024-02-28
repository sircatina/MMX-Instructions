library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegFile is
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
end RegFile;

architecture Behavioral of RegFile is
    type RegisterArray is array (0 to 7) of STD_LOGIC_VECTOR(63 downto 0);
     signal registers: RegisterArray := (
        x"1111111111111111",  -- Register 0
        x"2222333344445555",  -- Register 1
        x"EFFFEFFFEFFFEFFF",  -- Register 2
        x"8000800080008000",  -- Register 3
        x"5555555555555555",  -- Register 4
        x"ffffffffffffffff",  -- Register 5
        x"0010001000100010",  -- Register 6
        x"ffffffffffffffff"   -- Register 7
        );
begin
    process(clk, rst, read_en, write_en,registers)
    begin
        if rst = '1' then
            registers <= (others => (others => '0'));
        else 
             if read_en = '1' then
                 data_out1 <= registers(conv_integer(read_addr1));
                 data_out2 <= registers(conv_integer(read_addr2));
             end if;
            if rising_edge(clk) then
                    if write_en = '1' then
                        registers(conv_integer(write_addr)) <= data_in;
                    end if;
            end if;
        end if;
    end process;
end Behavioral;
