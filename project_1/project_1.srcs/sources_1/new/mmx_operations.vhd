library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity mmx_operations is
  Port (
  no1: in std_logic_vector(63 downto 0);
  no2: in std_logic_vector(63 downto 0);
  opcode: in std_logic_vector(5 downto 0);
  nr_out: out std_logic_vector(63 downto 0);
  finish: out std_logic
   );
end mmx_operations;

architecture Behavioral of mmx_operations is
------------------components----------------------
----wrap around-----
component paddb is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
component paddw is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
component paddd is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
-----signed-----
component paddsb is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
component paddsw is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
----unsigned-------
component paddusb is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
component paddusw is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
---------logic----------
component xor_64 is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
component or_64 is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
component and_64 is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
component nand_64 is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
-------------compare-egual------------
component pcmpeqb is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
component pcmpeqw is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
component pcmpeqd is
  Port (a64,b64: in std_logic_vector(63 downto 0);
        c64: out std_logic_vector(63 downto 0));
end component;
-----------------signal------------------
signal mmx_op_out: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_paddb: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_paddw: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_paddd: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_paddsb: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_paddsw: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_paddusb: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_paddusw: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_xor: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_or: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_and: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_nand: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_pcmpeqb: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_pcmpeqw: std_logic_vector(63 downto 0):=(others =>'0');
signal mmx_op_out_pcmpeqd: std_logic_vector(63 downto 0):=(others =>'0');

begin

-------------port map-------------------
paddb_port_map: paddb port map (no1, no2, mmx_op_out_paddb);
paddw_port_map: paddw port map (no1, no2, mmx_op_out_paddw);
paddd_port_map: paddd port map (no1, no2, mmx_op_out_paddd);
paddsb_port_map: paddsb port map (no1, no2, mmx_op_out_paddsb);
paddsw_port_map: paddsw port map (no1, no2, mmx_op_out_paddsw);
paddusb_port_map: paddusb port map (no1, no2, mmx_op_out_paddusb);
paddusw_port_map: paddusw port map (no1, no2, mmx_op_out_paddusw);

and_port_map: and_64 port map (no1, no2, mmx_op_out_and);
nand_port_map: nand_64 port map (no1, no2, mmx_op_out_nand);
or_port_map: or_64 port map (no1, no2, mmx_op_out_or);
xor_port_map: xor_64 port map (no1, no2, mmx_op_out_xor);

pcmpeqb_port_map: pcmpeqb port map (no1, no2, mmx_op_out_pcmpeqb);
pcmpeqw_port_map: pcmpeqw port map (no1, no2, mmx_op_out_pcmpeqw);
pcmpeqd_port_map: pcmpeqd port map (no1, no2, mmx_op_out_pcmpeqd);

main: process(opcode,mmx_op_out_paddb,mmx_op_out_paddw,mmx_op_out_paddd,mmx_op_out_paddsb,
                mmx_op_out_paddsw,mmx_op_out_paddusb,mmx_op_out_paddusw,mmx_op_out_and,
                mmx_op_out_nand,mmx_op_out_or,mmx_op_out_xor,mmx_op_out_pcmpeqb,
                mmx_op_out_pcmpeqw,mmx_op_out_pcmpeqd)
    begin
        case opcode is
            when "010000" => --PADDB
                mmx_op_out<= mmx_op_out_paddb;
            when "010001" => --PADDW
                mmx_op_out<=mmx_op_out_paddw;
            when "010010" => --PADDD
                mmx_op_out<=mmx_op_out_paddd;
            when "010101" => --PADDSB
                mmx_op_out<=mmx_op_out_paddsb;
            when "010110" => --PADDSW
                mmx_op_out<=mmx_op_out_paddsw;
            when "011001" => --PADDUSB
                mmx_op_out<=mmx_op_out_paddusb;
            when "011010" => --PADDUSW 
                mmx_op_out<=mmx_op_out_paddusw;
            when "000000" => --PAND
                mmx_op_out<= mmx_op_out_and;
            when "000001" => --PANDN
                mmx_op_out<= mmx_op_out_nand;
            when "000010" => --POR
                mmx_op_out<= mmx_op_out_or;
            when "000011" => --PXOR
                mmx_op_out<= mmx_op_out_xor;
            when "110000" => --PCMPEQB
                mmx_op_out<= mmx_op_out_pcmpeqb;
            when "110001" => --PCMPEQW
                mmx_op_out<=mmx_op_out_pcmpeqw;
            when "110010" => --PCMPEQBD
                mmx_op_out<=mmx_op_out_pcmpeqd;
            when others => mmx_op_out<= (others => '0');
           
        end case;
    end process;
finish<='1';
nr_out<=mmx_op_out;
end Behavioral;
