library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity adder_usb is
  Port (a_usb,b_usb: in std_logic_vector(7 downto 0);
        c_usb: out std_logic_vector(7 downto 0));
end adder_usb;

architecture Behavioral of adder_usb is
component full_adder_8 is
  Port (a8,b8: in std_logic_vector(7 downto 0);
        cin8: in std_logic;
        s8: out std_logic_vector(7 downto 0 );
        cout8: out std_logic);
end component;
signal sum: std_logic_vector(7 downto 0):= (others => '0');
signal cin_signal :std_logic_vector(1 downto 0):= (others => '0');

begin
paddb_full_adder : full_adder_8 port map (a8=> a_usb,b8=> b_usb,cin8=> cin_signal(0),s8=> sum,cout8 => cin_signal(1) );

process
begin
if (cin_signal(1)= '1') then 
  c_usb <= X"FF";
else c_usb <= sum;
end if;
wait for 1 ns;
end process;
end Behavioral;
