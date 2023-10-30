----------------------------------------------------------
-- A simple 256x8 instruction memory					--
-- myCPU												--
-- Prof. Max Santana (2021)								--
-- CEComp/Univasf										--
----------------------------------------------------------

library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity imemory is
  generic(	
    DATA_WIDTH		: integer := 8;
	  ADDRESS_WIDTH	: integer := 8;
	  DEPTH			: integer := 256
  );
  port(	
    address		: in std_logic_vector(31 downto 0);
    data_out	: out std_logic_vector(31 downto 0)
  );
end entity imemory;

architecture behv of imemory is
  -- use array to define the bunch of internal temparary signals
  type rom_type is array (0 to DEPTH-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
  signal imem : rom_type;

begin
  InitMem: process
    use STD.TEXTIO.all;
    file f: TEXT open READ_MODE is "instrucoes.data";
    variable l: LINE;
    variable value: std_logic_vector(DATA_WIDTH-1 downto 0);
    variable i: integer := 0;
  begin
    while not endfile(f) loop
      READLINE (f, l);
      READ (l, value);
      imem(i) <= value;
      i:= i+1;
    end loop;
    wait;
  end process InitMem;
  
  process(address)
  begin
    data_out(7 downto 0) <= imem(to_integer(signed(address)));
    data_out(15 downto 8) <= imem(to_integer(signed(address))+1);
    data_out(23 downto 16) <= imem(to_integer(signed(address))+2);
    data_out(31 downto 24) <= imem(to_integer(signed(address))+3);
  end process;

end behv;