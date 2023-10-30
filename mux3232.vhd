library ieee;
use ieee.std_logic_1164.all;

entity mux3232 is
  port(	
    d0, d1,  d2,  d3,  d4,  d5,  d6,  d7,
    d8, d9, d10, d11, d12, d13, d14, d15,
    d16, d17, d18, d19, d20, d21, d22, d23,
    d24, d25, d26, d27, d28, d29, d30, d31: in std_logic_vector(31 downto 0);
    s      : in std_logic_vector(4 downto 0);
    y	   : out std_logic_vector(31 downto 0)
  );
end mux3232;

architecture behavior of mux3232 is
begin
    with s select
        y <= d0 when "00000",
            d1 when "00001",
            d2 when "00010",
            d3 when "00011",
            d4 when "00100",
            d5 when "00101",
            d6 when "00110",
            d7 when "00111",
            d8 when "01000",
            d9 when "01001",
            d10 when "01010",
            d11 when "01011",
            d12 when "01100",
            d13 when "01101",
            d14 when "01110",
            d15 when "01111",
            d16 when "10000",
            d17 when "10001",
            d18 when "10010",
            d19 when "10011",
            d20 when "10100",
            d21 when "10101",
            d22 when "10110",
            d23 when "10111",
            d24 when "11000",
            d25 when "11001",
            d26 when "11010",
            d27 when "11011",
            d28 when "11100",
            d29 when "11101",
            d30 when "11110",
            d31 when others; -- "11111"
end behavior;