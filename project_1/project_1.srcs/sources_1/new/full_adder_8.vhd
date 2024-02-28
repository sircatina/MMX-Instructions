library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_8 is
  Port (a8,b8: in std_logic_vector(7 downto 0);
        cin8: in std_logic;
        s8: out std_logic_vector(7 downto 0 );
        cout8: out std_logic);
end full_adder_8;

architecture Behavioral of full_adder_8 is

component full_adder is
 Port (a,b,cin:in std_logic;
        s,cout: out std_logic );
end component;

signal c: std_logic_vector(8 downto 0);

begin


     a0:full_adder port map (a8(0),b8(0),cin8,s8(0),c(0));
     a1:full_adder port map (a8(1),b8(1),c(0),s8(1),c(1));
     a2:full_adder port map (a8(2),b8(2),c(1),s8(2),c(2));
     a3:full_adder port map (a8(3),b8(3),c(2),s8(3),c(3));
     a4:full_adder port map (a8(4),b8(4),c(3),s8(4),c(4));
     a5:full_adder port map (a8(5),b8(5),c(4),s8(5),c(5));
     a6:full_adder port map (a8(6),b8(6),c(5),s8(6),c(6));
     a7:full_adder port map (a8(7),b8(7),c(6),s8(7),c(7));
 
cout8<= c(7);
end Behavioral;
