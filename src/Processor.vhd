----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:24 04/10/2019 
-- Design Name: 
-- Module Name:    Processor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processor is
Port ( 		CLK : in  STD_LOGIC;
				--Instr : in std_logic_vector(31 downto 0);
           RST_FSM : in  STD_LOGIC);
end Processor;

architecture Behavioral of Processor is

COMPONENT StateFunction is 
port (
				PC : in  STD_LOGIC_VECTOR (31 downto 0);
			  Instr : in  STD_LOGIC_VECTOR (31 downto 0);
			  IDRegisterControl : out  STD_LOGIC_VECTOR (31 downto 0);
			  EXRegister : in  STD_LOGIC_VECTOR (31 downto 0);
			  IFRegister : in  STD_LOGIC_VECTOR (31 downto 0);
			  IDRegister: in  STD_LOGIC_VECTOR (31 downto 0);
			  MEMRegister : in  STD_LOGIC_VECTOR (31 downto 0);
			  WrBRegister : in  STD_LOGIC_VECTOR (31 downto 0);
			  EXRegisterOut : out  STD_LOGIC_VECTOR (31 downto 0);
			  IFRegisterOut : out  STD_LOGIC_VECTOR (31 downto 0);
			  IDRegisterOut: out  STD_LOGIC_VECTOR (31 downto 0);
			  MEMRegisterOut : out  STD_LOGIC_VECTOR (31 downto 0);
			  WrBRegisterOut : out  STD_LOGIC_VECTOR (31 downto 0);
			  InstrOut : out  STD_LOGIC_VECTOR (31 downto 0);
			  --weReg : out  STD_LOGIC;
			  weReg : out  STD_LOGIC_vector (4 downto 0);
			  weA : out  STD_LOGIC;
			  weB : out  STD_LOGIC;
           Zero : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
			  RST_FSM : in  STD_LOGIC;
           RF_WrData_sel : out  STD_LOGIC_VECTOR(1 DOWNTO 0);
           ALU_func : out  STD_LOGIC_VECTOR (3 downto 0);
           PC_sel : out  STD_LOGIC;
           PC_LdEn : out  STD_LOGIC;
           RF_B_sel : out  STD_LOGIC;
			  Sell : OUT STD_LOGIC;
			  rst : out  STD_LOGIC;
			  Immext : out std_logic;
           ALU_Bin_sel : out  STD_LOGIC;
			 -- ALURegisterEn : out STD_LOGIC;
           RF_WrEn : out  STD_LOGIC;
			  weMEMRegout : out  STD_LOGIC;
			  weWrBRegout : out  STD_LOGIC;
           MEM_WrEn : out  STD_LOGIC);
          -- MEM_Din_sel : out  STD_LOGIC;
          -- MEM_Dout_sel : out  STD_LOGIC);
end component;

component Control is
port (
			  PC_SEL : in  STD_LOGIC;
			  PC_out : out  STD_LOGIC_VECTOR (31 downto 0);
           PC_LDEN : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
			  Immext : in std_logic;
           RF_WRDATA_SEL : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
           ALU_BIN_SEL : in  STD_LOGIC;
           ALU_FUNC : in  STD_LOGIC_VECTOR (3 downto 0);
           MEM_WREN : in  STD_LOGIC;
			  Sell : IN STD_LOGIC;
			  RF_WREN : in STD_LOGIC;
			  weA : in  STD_LOGIC;
			  weB : in  STD_LOGIC;
			  ZERO : OUT STD_LOGIC;
           RF_B_SEL : in  STD_LOGIC;
			  IDRegister : in  STD_LOGIC_VECTOR (31 downto 0);
			  weMEMRegout : in  STD_LOGIC;
			  weWrBRegout : in  STD_LOGIC;
			  EXRegister : in  STD_LOGIC_VECTOR (31 downto 0);
			  RF_WrBadr : in  STD_LOGIC_VECTOR (31 downto 0);
			  --ALURegisterOUT : out  STD_LOGIC_VECTOR (31 downto 0);
			  INSTR : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component Registerr
    Port ( clk : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           we : in  STD_LOGIC);
end component;


--signal
signal sig_PC_sel,sig_PC_LdEn,sig_RF_B_sel,sig_ALU_Bin_sel,sig_RF_WrEn,sig_MEM_WrEn,sig_RST,SIG_ZERO,Sell,SIG_Sell, s_Immext,   sig_weMEMRegout,  sig_weWrBRegout, sig_weA, sig_weB : std_logic;--sig_weReg,
signal sig_ALU_func : std_logic_vector (3 downto 0 );
signal sig_weReg : std_logic_vector (4 downto 0 );
signal sig_Instr, sig_IDReg : std_logic_vector(31 downto 0);
SIGNAL sig_RF_WrData_sel : STD_LOGIC_VECTOR (1 DOWNTO 0);
signal sig_Instrout, sig_IF, sig_IFout, sig_ID, sig_IDout, sig_EX, sig_EXout, sig_MEM, sig_MEMout, sig_WrB, sig_WrBout, sig_PC : std_logic_vector(31 downto 0);
--signal sig_ABus, sig_BBus : std_logic_vector (31 downto 0 );


begin

cStateFunction : StateFunction
	port map (
			  Instr => sig_Instr,
			  IDRegisterControl => sig_IDReg,
			  EXRegister => sig_EX,
			  IFRegister =>sig_IF,
			  IDRegister => sig_ID,
			  MEMRegister => sig_MEM,
			  WrBRegister => sig_WrB,
			  EXRegisterOut => sig_EXout,
			  IFRegisterOut => sig_IFout,
			  IDRegisterOut => sig_IDout,
			  MEMRegisterOut => sig_MEMout,
			  WrBRegisterOut => sig_WrBout,
			  InstrOut => sig_InstrOut,
			  weReg => sig_weReg,
			  weA => sig_weA,
			  weB => sig_weB,
           Zero => SIG_ZERO,
			  clk => CLK,
			  Immext => s_Immext,
			  RST_FSM => RST_FSM, 
           RF_WrData_sel => sig_RF_WrData_sel,
           ALU_func => sig_ALU_func,
           PC_sel => sig_PC_sel,
           PC_LdEn => sig_PC_LdEn,
           RF_B_sel => sig_RF_B_sel,
			  rst => sig_RST, 
			  Sell => SIG_Sell,
           ALU_Bin_sel =>sig_ALU_Bin_sel,
			  weMEMRegout => sig_weMEMRegout,
			  weWrBRegout => sig_weWrBRegout,
           RF_WrEn => sig_RF_WrEn,
           MEM_WrEn =>sig_MEM_WrEn,
			  PC => sig_PC
          -- MEM_Din_sel : out  STD_LOGIC;
          -- MEM_Dout_sel : out  STD_LOGIC);
	);

cCONTROL : Control
	port map (
			  PC_SEL => sig_PC_sel,
           PC_LDEN => sig_PC_LdEn,
			  Immext => s_Immext,
           CLK => CLK,
			  ZERO => SIG_ZERO,
			   weA => sig_weA,
			  weB => sig_weB,
           RESET => sig_RST,
           RF_WRDATA_SEL => sig_RF_WrData_sel,
           ALU_BIN_SEL => sig_ALU_Bin_sel,
           ALU_FUNC => sig_ALU_func,
           MEM_WREN => sig_MEM_WrEn,
			  RF_WREN => sig_RF_WrEn,
			  Sell =>SIG_Sell,
           RF_B_SEL => sig_RF_B_sel,
			  INSTR => sig_Instr,
			  EXRegister =>  sig_EXout,
			  weMEMRegout => sig_weMEMRegout,
			  weWrBRegout => sig_weWrBRegout,
			  IDRegister => sig_IDout,
			  RF_WrBadr => sig_WrBout,
			  PC_out => sig_PC
	);
	
	
	
	IF_REG: Registerr
		port map(	clk=>clk,
						Din=>sig_InstrOut,
						Dout=>sig_IF,
						we=>sig_weReg(0));
						
		ID_REG: Registerr
		port map(	clk=>clk,
						Din=>sig_IFout,
						Dout=>sig_ID,
						we=>sig_weReg(1));
						
						
		EX_REG: Registerr
		port map(	clk=>clk,
						Din=>sig_IDout,
						Dout=>sig_EX,
						we=>sig_weReg(2));
						
		MEM_REG: Registerr
		port map(	clk=>clk,
						Din=>sig_EXout,
						Dout=>sig_MEM,
						we=>sig_weReg(3));
						
		WrB_REG: Registerr
		port map(	clk=>clk,
						Din=>sig_MEMout,
						Dout=>sig_WrB,
						we=>sig_weReg(4));


end Behavioral;

