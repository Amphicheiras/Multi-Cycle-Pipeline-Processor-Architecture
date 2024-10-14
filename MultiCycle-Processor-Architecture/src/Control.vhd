----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:31:59 03/26/2019 
-- Design Name: 
-- Module Name:    Control - Behavioral 
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

entity Control is
    Port ( PC_Sel : in  STD_LOGIC;
				PC_out : out std_logic_VECTOR (31 downto 0);
			  Instr : out  STD_LOGIC_VECTOR (31 downto 0);
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  Sell : in std_logic;
           RF_WrEn : in  STD_LOGIC;
           RF_WrData_Sel : in  STD_LOGIC_vector (1 downto 0);
			  --RF_WrData_Sel : in  STD_LOGIC;
           RF_B_Sel : in  STD_LOGIC;
           ImmExt : in  STD_LOGIC;
           ALU_bin_Sel : in  STD_LOGIC;
           ALU_Func : in  STD_LOGIC_VECTOR (3 downto 0);
           MEM_WrEn : in  STD_LOGIC;
			  weA : in  STD_LOGIC;
			  weB : in  STD_LOGIC;
           Zero : out  STD_LOGIC;
			  weMEMRegout : in  STD_LOGIC;
			  weWrBRegout : in  STD_LOGIC;
			  IDRegister : in  STD_LOGIC_VECTOR (31 downto 0);
			  RF_WrBadr : in  STD_LOGIC_VECTOR (31 downto 0);
			  EXRegister : in  STD_LOGIC_VECTOR (31 downto 0));
			  --ALURegisterOUT : out  STD_LOGIC_VECTOR (31 downto 0));
			  --MEMRegister : in  STD_LOGIC_VECTOR (31 downto 0);
			  --WrBRegister : in  STD_LOGIC_VECTOR (31 downto 0));
end Control;

architecture Behavioral of Control is

component DECSTAGE
	Port ( 	Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn : in  STD_LOGIC;
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrData_sel : in  STD_LOGIC_vector (1 downto 0);
			  --RF_WrData_Sel : in  STD_LOGIC;
           RF_B_sel : in  STD_LOGIC;
           ImmExt : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  RF_WrBadr : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;


component IFSTAGE
	Port ( 	  PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component EXSTAGE
	Port ( 	  RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ALU_zero : out  STD_LOGIC);
end component;

component MEMSTAGE
	Port (  CLK : in  STD_LOGIC;
           Mem_WrEn : in  STD_LOGIC;
			  Sell : in std_logic;
           ALU_MEM_addr : in  STD_LOGIC_VECTOR (31 downto 0);
			  Instr_MEM_addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
			  inst_dout : out  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
END component;


--component MpxRead 
--    Port ( Instr1 : in  STD_LOGIC_VECTOR (4 downto 0);
--           Instr2 : in  STD_LOGIC_VECTOR (4 downto 0);
--           RF_B_sel : in  STD_LOGIC;
--           Mout : out  STD_LOGIC_VECTOR (4 downto 0));
--end component;


component Registerr
    Port ( clk : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           we : in  STD_LOGIC);
end component;

signal tempALUout, tempMEMout, tempRF_A, tempRF_B, tempInstr, tempPCout, tempImmed, A_Bus, B_Bus, WrBALU, MEMALU : std_logic_vector (31 downto 0);
--signal sig_EX_MPX, sig_MEM_RF_B : std_logic_vector (4 downto 0);

begin

decoder: DECSTAGE

PORT MAP(	Instr=> IDRegister,
			   RF_WrEn=> RF_WrEn,
           --ALU_out => tempALUout,
			  ALU_out =>WrBALU,
			  MEM_out => tempMEMout,
           RF_WrData_sel => RF_WrData_Sel,
           RF_B_sel => RF_B_Sel,
           ImmExt => ImmExt,
           Clk => Clk,
			  RF_WrBadr => RF_WrBadr,
           Immed => tempImmed,
           RF_A => tempRF_A,
           RF_B => tempRF_B);
			  
			  
iff: IFSTAGE
	Port map ( 	  PC_Immed =>tempImmed,
						PC_sel =>PC_Sel,
						PC_LdEn =>PC_LdEn,
						RESET =>Reset,
						clk =>Clk,
						PCout =>tempPCout);
			  
execution: EXSTAGE
	Port map( 	   RF_A =>A_Bus,
						--RF_A =>tempRF_A,
						--RF_B =>tempRF_B,
						RF_B =>B_Bus,
						Immed =>tempImmed,
						ALU_Bin_sel =>ALU_Bin_Sel,
						ALU_func =>ALU_Func,
						ALU_out=> tempALUout,
						--ALU_out=> ALURegisterOUT,
						ALU_zero =>Zero);


memory: MEMSTAGE
		Port map (  	 CLK => Clk,
							Instr_MEM_addr=> tempPCout,
							Mem_WrEn => MEM_WrEn,
							Sell=>Sell,
							--ALU_MEM_addr =>tempALUout,
							ALU_MEM_addr =>MEMALU,
							--MEM_DataIn =>tempRF_B,
							MEM_DataIn => B_Bus,
							inst_dout =>tempInstr,
							MEM_DataOut =>tempMEMout);
							
							

--EX_MPX : MpxRead 
--    Port map ( Instr1 =>EXRegister(15 downto 11),
--					Instr2 =>EXRegister(20 downto 16),
--					RF_B_sel => RF_B_sel,
--					Mout => sig_EX_MPX);


ALU_WrB : Registerr
    Port map ( clk =>Clk,
					Din => MEMALU,
					Dout => WrBALU,
					we => weWrBRegout);
					
A_REG : Registerr
    Port map ( clk =>Clk,
					Din => tempRF_A,
					Dout => A_Bus,
					we => weA);


B_REG : Registerr
    Port map ( clk =>Clk,
					Din => tempRF_B,
					Dout => B_Bus,
					we => weB);

ALU_MEM : Registerr
    Port map ( clk =>Clk,
					Din => tempALUout,
					Dout => MEMALU,
					we => weMEMRegout);

Instr <= tempInstr;
PC_out<=tempPCout;

end Behavioral;

