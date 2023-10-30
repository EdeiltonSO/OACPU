------------------------------------------------------
-- myCPU                                			--
-- Prof. Max Santana  (2021)            			--
-- CEComp/Univasf                       			--
------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity myCPU is
  port(
    clk   : in std_logic;
    rst   : in std_logic  
  );
end myCPU;

architecture behv of myCPU is
  signal w_q: std_logic_vector(31 downto 0);
  signal w_s: std_logic_vector(31 downto 0);
  signal w_data_out: std_logic_vector(31 downto 0);
  
  signal w_op: std_logic_vector(5 downto 0);
  signal w_rs: std_logic_vector(4 downto 0);
  signal w_rt: std_logic_vector(4 downto 0);
  signal w_rd: std_logic_vector(4 downto 0);
  signal w_shamt: std_logic_vector(4 downto 0);
  signal w_funct: std_logic_vector(5 downto 0);
  signal w_imm: std_logic_vector(15 downto 0);
  signal w_addr: std_logic_vector(25 downto 0);
  
  --signal w_regdst: std_logic := '0';
  --signal w_wr: std_logic_vector(4 downto 0);
    
  --signal w_rw: std_logic := '0';
  --signal w_rd1: std_logic_vector(31 downto 0);
  --signal w_rd2: std_logic_vector(31 downto 0);
  --signal w_wd: std_logic_vector(31 downto 0);
  --signal w_eimm: std_logic_vector(31 downto 0);
  --signal w_balu: std_logic_vector(31 downto 0);
  --signal w_alusrc: std_logic := '0';
  
  

begin
  PC: entity work.rreg32 port map (clk => clk, rst => rst, d => w_s, q => w_q);
  ADDER1: entity work.adder32 port map (a => w_q, s => w_s);
  IMEM: entity work.imemory port map (address => w_q, data_out => w_data_out);
  IDEC: entity work.idecoder port map (i => w_data_out, op => w_op, rs => w_rs, rt => w_rt, rd => w_rd, shamt => w_shamt, funct => w_funct, imm => w_imm, addr => w_addr);
  
  --MUX1: entity work.mux25 port map (d0 => w_rt, d1 => w_rd, s => w_regdst, y => w_wr);
  --REGS: entity work.registers port map (rr1 => w_rs, rr2 => w_rt, rw => w_rw, wr => w_wr, wd => w_wd, rd1 => w_rd1, rd2 => w_rd2);
  --SGEXT: entity work.signExtend port map (dataIn => w_imm, dataOut => w_eimm);
  --MUX2: entity work.mux232 port map (d0 => w_rd2, d1 => w_eimm, s => w_regdst, y => w_balu);
end architecture behv;  