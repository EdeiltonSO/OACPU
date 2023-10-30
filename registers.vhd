-- DESIGN
library IEEE;
use IEEE.std_logic_1164.all;

-- LADO DE FORA
entity registers is 
	port(
        reset : in std_logic; -- reset all registers
        rr1   : in std_logic_vector(4 downto 0);
        rr2   : in std_logic_vector(4 downto 0);
		rw    : in std_logic; -- control
        wr    : in std_logic_vector(4 downto 0); -- write register
        wd    : in std_logic_vector(31 downto 0);
        rd1   : out std_logic_vector(31 downto 0);
        rd2   : out std_logic_vector(31 downto 0)
    );
end registers;

-- LADO DE DENTRO
architecture daftpunk of registers is

    signal w_regwr0, 
    w_regwr1, 
    w_regwr2, 
    w_regwr3, 
    w_regwr4, 
    w_regwr5, 
    w_regwr6, 
    w_regwr7, 
    w_regwr8, 
    w_regwr9, 
    w_regwr10, 
    w_regwr11, 
    w_regwr12, 
    w_regwr13, 
    w_regwr14, 
    w_regwr15, 
    w_regwr16, 
    w_regwr17, 
    w_regwr18, 
    w_regwr19, 
    w_regwr20, 
    w_regwr21, 
    w_regwr22, 
    w_regwr23, 
    w_regwr24, 
    w_regwr25, 
    w_regwr26, 
    w_regwr27, 
    w_regwr28, 
    w_regwr29, 
    w_regwr30, 
    w_regwr31: std_logic;

    signal w_read0, 
    w_read1, 
    w_read2, 
    w_read3, 
    w_read4, 
    w_read5, 
    w_read6, 
    w_read7, 
    w_read8, 
    w_read9, 
    w_read10, 
    w_read11, 
    w_read12, 
    w_read13, 
    w_read14, 
    w_read15, 
    w_read16, 
    w_read17, 
    w_read18, 
    w_read19, 
    w_read20, 
    w_read21, 
    w_read22, 
    w_read23, 
    w_read24, 
    w_read25, 
    w_read26, 
    w_read27, 
    w_read28, 
    w_read29, 
    w_read30, 
    w_read31: std_logic_vector(31 downto 0);

component mux3232 port(
    d0, d1,  d2,  d3,  d4,  d5,  d6,  d7, 
    d8, d9, d10, d11, d12, d13, d14, d15,
    d16, d17, d18, d19, d20, d21, d22, d23,
    d24, d25, d26, d27, d28, d29, d30, d31: in std_logic_vector(31 downto 0);

    s : in std_logic_vector(4 downto 0); -- select
    y : out std_logic_vector(31 downto 0)
);
end component;

component demux3232 port(
    s : in std_logic_vector(4 downto 0); -- select
    y : in std_logic;

    d0, d1,  d2,  d3,  d4,  d5,  d6,  d7, 
    d8, d9, d10, d11, d12, d13, d14, d15,
    d16, d17, d18, d19, d20, d21, d22, d23,
    d24, d25, d26, d27, d28, d29, d30, d31: out std_logic
);
end component;

begin
	-- 32 instancias do rreg32
    -- com o nome de cada reg mips
    -- mais 3 mux/demux de controle
    -- clock dos reg recebe rw da UC

    demux_write: demux3232 port map(
        wr, rw, 
        w_regwr0, w_regwr1, w_regwr2, w_regwr3, w_regwr4, w_regwr5, w_regwr6, w_regwr7, 
        w_regwr8, w_regwr9, w_regwr10, w_regwr11, w_regwr12, w_regwr13, w_regwr14, w_regwr15, 
        w_regwr16, w_regwr17, w_regwr18, w_regwr19, w_regwr20, w_regwr21, w_regwr22, w_regwr23, 
        w_regwr24, w_regwr25, w_regwr26, w_regwr27, w_regwr28, w_regwr29, w_regwr30, w_regwr31);

    mux_read1: mux3232 port map(
        w_read0, w_read1, w_read2, w_read3, w_read4, w_read5, w_read6, w_read7, 
        w_read8, w_read9, w_read10, w_read11, w_read12, w_read13, w_read14, w_read15, 
        w_read16, w_read17, w_read18, w_read19, w_read20, w_read21, w_read22, w_read23, 
        w_read24, w_read25, w_read26, w_read27, w_read28, w_read29, w_read30, w_read31,
        rr1, rd1);

    mux_read2: mux3232 port map(
        w_read0, w_read1, w_read2, w_read3, w_read4, w_read5, w_read6, w_read7, 
        w_read8, w_read9, w_read10, w_read11, w_read12, w_read13, w_read14, w_read15, 
        w_read16, w_read17, w_read18, w_read19, w_read20, w_read21, w_read22, w_read23, 
        w_read24, w_read25, w_read26, w_read27, w_read28, w_read29, w_read30, w_read31,
        rr2, rd2);

    ZERO: entity work.rreg32 port map (clk => w_regwr0, rst => reset, d => "00000000000000000000000000000000", q => w_read0);
    AT:   entity work.rreg32 port map (clk => w_regwr1, rst => reset, d => wd, q => w_read1);
    V0:   entity work.rreg32 port map (clk => w_regwr2, rst => reset, d => wd, q => w_read2);
    V1:   entity work.rreg32 port map (clk => w_regwr3, rst => reset, d => wd, q => w_read3);
    A0:   entity work.rreg32 port map (clk => w_regwr4, rst => reset, d => wd, q => w_read4);
    A1:   entity work.rreg32 port map (clk => w_regwr5, rst => reset, d => wd, q => w_read5);
    A2:   entity work.rreg32 port map (clk => w_regwr6, rst => reset, d => wd, q => w_read6);
    A3:   entity work.rreg32 port map (clk => w_regwr7, rst => reset, d => wd, q => w_read7);
    T0:   entity work.rreg32 port map (clk => w_regwr8, rst => reset, d => wd, q => w_read8);
    T1:   entity work.rreg32 port map (clk => w_regwr9, rst => reset, d => wd, q => w_read9);
    T2:   entity work.rreg32 port map (clk => w_regwr10, rst => reset, d => wd, q => w_read10);
    T3:   entity work.rreg32 port map (clk => w_regwr11, rst => reset, d => wd, q => w_read11);
    T4:   entity work.rreg32 port map (clk => w_regwr12, rst => reset, d => wd, q => w_read12);
    T5:   entity work.rreg32 port map (clk => w_regwr13, rst => reset, d => wd, q => w_read13);
    T6:   entity work.rreg32 port map (clk => w_regwr14, rst => reset, d => wd, q => w_read14);
    T7:   entity work.rreg32 port map (clk => w_regwr15, rst => reset, d => wd, q => w_read15);
    S0:   entity work.rreg32 port map (clk => w_regwr16, rst => reset, d => wd, q => w_read16);
    S1:   entity work.rreg32 port map (clk => w_regwr17, rst => reset, d => wd, q => w_read17);
    S2:   entity work.rreg32 port map (clk => w_regwr18, rst => reset, d => wd, q => w_read18);
    S3:   entity work.rreg32 port map (clk => w_regwr19, rst => reset, d => wd, q => w_read19);
    S4:   entity work.rreg32 port map (clk => w_regwr20, rst => reset, d => wd, q => w_read20);
    S5:   entity work.rreg32 port map (clk => w_regwr21, rst => reset, d => wd, q => w_read21);
    S6:   entity work.rreg32 port map (clk => w_regwr22, rst => reset, d => wd, q => w_read22);
    S7:   entity work.rreg32 port map (clk => w_regwr23, rst => reset, d => wd, q => w_read23);
    T8:   entity work.rreg32 port map (clk => w_regwr24, rst => reset, d => wd, q => w_read24);
    T9:   entity work.rreg32 port map (clk => w_regwr25, rst => reset, d => wd, q => w_read25);
    K0:   entity work.rreg32 port map (clk => w_regwr26, rst => reset, d => wd, q => w_read26);
    K1:   entity work.rreg32 port map (clk => w_regwr27, rst => reset, d => wd, q => w_read27);
    GP:   entity work.rreg32 port map (clk => w_regwr28, rst => reset, d => wd, q => w_read28);
    SP:   entity work.rreg32 port map (clk => w_regwr29, rst => reset, d => wd, q => w_read29);
    FP:   entity work.rreg32 port map (clk => w_regwr30, rst => reset, d => wd, q => w_read30);
    RA:   entity work.rreg32 port map (clk => w_regwr31, rst => reset, d => wd, q => w_read31);
    
end;