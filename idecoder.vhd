library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.ALL;

entity idecoder is
  port(
    i     : in std_logic_vector(31 downto 0);
    op    : out std_logic_vector(5 downto 0);
    rs    : out std_logic_vector(4 downto 0);
    rt    : out std_logic_vector(4 downto 0); 
    rd    : out std_logic_vector(4 downto 0);
    shamt : out std_logic_vector(4 downto 0);
    funct : out std_logic_vector(5 downto 0);
    imm   : out std_logic_vector(15 downto 0);
    addr  : out std_logic_vector(25 downto 0)
  );
end idecoder;

architecture behv of idecoder is
begin
  op <= i(31 downto 26);
  rs <= i(25 downto 21);
  rt <= i(20 downto 16);
  rd <= i(15 downto 11);
  shamt <= i(10 downto 6);
  funct <= i(5 downto 0);
  imm <= i(15 downto 0);
  addr <= i(25 downto 0);
end behv;