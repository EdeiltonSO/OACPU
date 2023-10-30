library ieee;
use ieee.std_logic_1164.all;

entity demux3232 is
  port(	
    s      : in std_logic_vector(4 downto 0); -- select
    y	   : in std_logic; -- in
    d0, d1,  d2,  d3,  d4,  d5,  d6,  d7,
    d8, d9, d10, d11, d12, d13, d14, d15,
    d16, d17, d18, d19, d20, d21, d22, d23,
    d24, d25, d26, d27, d28, d29, d30, d31: out std_logic
  );
end demux3232;

architecture behavior of demux3232 is
begin
    process (s, y) is
	 begin
    if (s = "00000") then
        d0 <= y;
    elsif (s = "00001") then
        d1 <= y;
    elsif (s = "00010") then
        d2 <= y;
    elsif (s = "00011") then
        d3 <= y;
    elsif (s = "00100") then
        d4 <= y;
    elsif (s = "00101") then
        d5 <= y;
    elsif (s = "00110") then
        d6 <= y;
    elsif (s = "00111") then
        d7 <= y;
    elsif (s = "01000") then
        d8 <= y;
    elsif (s = "01001") then
        d9 <= y;
    elsif (s = "01010") then
        d10 <= y;
    elsif (s = "01011") then
        d11 <= y;
    elsif (s = "01100") then
        d12 <= y;
    elsif (s = "01101") then
        d13 <= y;
    elsif (s = "01110") then
        d14 <= y;
    elsif (s = "01111") then
        d15 <= y;
    elsif (s = "10000") then
        d16 <= y;
    elsif (s = "10001") then
        d17 <= y;
    elsif (s = "10010") then
        d18 <= y;
    elsif (s = "10011") then
        d19 <= y;
    elsif (s = "10100") then
        d20 <= y;
    elsif (s = "10101") then
        d21 <= y;
    elsif (s = "10110") then
        d22 <= y;
    elsif (s = "10111") then
        d23 <= y;
    elsif (s = "11000") then
        d24 <= y;
    elsif (s = "11001") then
        d25 <= y;
    elsif (s = "11010") then
        d26 <= y;
    elsif (s = "11011") then
        d27 <= y;
    elsif (s = "11100") then
        d28 <= y;
    elsif (s = "11101") then
        d29 <= y;
    elsif (s = "11110") then
        d30 <= y;
    else -- "11111"
        d31 <= y;
    end if;
    end process;
end behavior;