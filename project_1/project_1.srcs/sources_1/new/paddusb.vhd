library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity paddusb is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end paddusb;

architecture Behavioral of paddusb is
component adder_usb is
  Port (a_usb,b_usb: in std_logic_vector(7 downto 0);
        c_usb: out std_logic_vector(7 downto 0));
end component;
    signal sum: std_logic_vector(63 downto 0):= (others => '0');
    signal cin_signal :std_logic_vector(8 downto 0):= (others => '0');
begin

paddb64_inst0 : adder_usb port map (a_usb=> a64(7 downto 0),b_usb=> b64(7 downto 0),c_usb=> c64(7 downto 0));
paddb64_inst1 : adder_usb port map (a_usb=> a64(15 downto 8),b_usb=> b64(15 downto 8),c_usb=> c64(15 downto 8));
paddb64_inst2 : adder_usb port map (a_usb=> a64(23 downto 16),b_usb=> b64(23 downto 16),c_usb=> c64(23 downto 16) );
paddb64_inst3 : adder_usb port map (a_usb=> a64(31 downto 24),b_usb=> b64(31 downto 24),c_usb=> c64(31 downto 24));
paddb64_inst4 : adder_usb port map (a_usb=> a64(39 downto 32),b_usb=> b64(39 downto 32),c_usb=> c64(39 downto 32));
paddb64_inst5 : adder_usb port map (a_usb=> a64(47 downto 40),b_usb=> b64(47 downto 40),c_usb=> c64(47 downto 40));
paddb64_inst6 : adder_usb port map (a_usb=> a64(55 downto 48),b_usb=> b64(55 downto 48),c_usb=> c64(55 downto 48));
paddb64_inst7 : adder_usb port map (a_usb=> a64(63 downto 56),b_usb=> b64(63 downto 56),c_usb=> c64(63 downto 56));


end Behavioral;
