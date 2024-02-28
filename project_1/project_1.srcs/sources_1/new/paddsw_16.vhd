library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity paddsw_16 is
    Port (
        a16, b16: in std_logic_vector(15 downto 0);
        c16: out std_logic_vector(15 downto 0)
    );
end paddsw_16;

architecture Behavioral of paddsw_16 is
    component full_adder_8 is
        Port (
            a8, b8: in std_logic_vector(7 downto 0);
            cin8: in std_logic;
            s8: out std_logic_vector(7 downto 0);
            cout8: out std_logic
        );
    end component;

    signal cin_signal: std_logic_vector(1 downto 0):="00";
    signal sum: std_logic_vector(15 downto 0):=(others =>'0');

begin
    -- Lower 8 bits addition
    paddsw16_inst0 : full_adder_8 port map (a8 => a16(7 downto 0), b8 => b16(7 downto 0),cin8 => '0', s8 => sum(7 downto 0),cout8 => cin_signal(0));

    -- Upper 8 bits addition
    paddsw16_inst1 : full_adder_8 port map (a8 => a16(15 downto 8),b8 => b16(15 downto 8),cin8 => cin_signal(0),s8 => sum(15 downto 8),cout8 => cin_signal(1));

    -- Overflow detection and correction
    PROCESS(a16, b16, sum)
    BEGIN
        if (a16(15) = '0' and b16(15) = '0' and sum(15)  = '1') then
            c16 <= "0111111111111111"; -- Positive overflow
        elsif (a16(15) = '1' and b16(15) = '1' and cin_signal(1)  = '1') then
                c16 <= "1000000000000000"; -- Negative overflow
        else
            c16 <= sum; -- No overflow
        end if;
    END PROCESS;
end Behavioral;