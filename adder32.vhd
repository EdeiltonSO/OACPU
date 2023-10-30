------------------------------------------
-- 32 bits adder                        --
-- Prof. Max Santana  (2020)            --
-- CEComp/Univasf                       --
------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.ALL;

entity adder32 is
  port(
    a     : in std_logic_vector(31 downto 0);
    s     : out std_logic_vector(31 downto 0)
  );
end adder32;

architecture behv of adder32 is
begin
  s <= a + x"00000004";  
end behv;