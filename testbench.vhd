----------------------------------
-- Testbench myCPU              --
-- Prof. Max Santana  (2021)    --
-- CEComp/Univasf               --
----------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity testbench is
end entity testbench;

architecture tb of testbench is
  signal clock, reset : std_logic := '0';
  constant clock_period : time := 10 ns;
  
begin
  CPU: entity work.myCPU port map (clk => clock, rst => reset);
    
  clock_process :process
  begin
    for i in 0 to 10 loop
      Clock <= '0';
      wait for clock_period/2;
      Clock <= '1';
      wait for clock_period/2;
	end loop;
    wait;
  end process;
  
  process
  begin    
    reset <= '1';
    wait for 10 ns;
    reset <= '0';
    wait for 30 ns;
    reset <= '1';
    wait for 10 ns;
    --
    reset <= '0';
    wait;
  end process;
  
end architecture tb;