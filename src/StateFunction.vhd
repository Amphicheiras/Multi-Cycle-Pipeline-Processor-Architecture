----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:19:28 04/10/2019 
-- Design Name: 
-- Module Name:    StateFunction - Behavioral 
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

entity StateFunction is
 Port ( 		Instr : in  STD_LOGIC_VECTOR (31 downto 0);
				InstrOut : out  STD_LOGIC_VECTOR (31 downto 0);
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
			  weReg : out  STD_LOGIC_vector (4 downto 0);
--			  weReg : out  STD_LOGIC;
--			  weReg : out  STD_LOGIC;
--			  weReg : out  STD_LOGIC;
--			  weReg : out  STD_LOGIC;
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
			  rst : out  STD_LOGIC;
			  Sell : OUT STD_LOGIC;
           ALU_Bin_sel : out  STD_LOGIC;
           RF_WrEn : out  STD_LOGIC;
			  Immext : out std_logic;
           MEM_WrEn : out  STD_LOGIC;
			  weMEMRegout : out  STD_LOGIC;
			  weWrBRegout : out  STD_LOGIC;
			  PC : in std_logic_VECTOR (31 downto 0));
end StateFunction;

architecture Behavioral of StateFunction is




Type State is (ResetState,StartState);--,ALUState,FinalState,WAITSTATE);
signal IFState, IDState, EXState, MEMState, WrBState : State;
--SIGNAL sig_Instr, IFRegister, IDRegister, EXRegister, MEMRegister, WrBRegister: std_logic_vector(31 downto 0);


begin

	process
	
		begin
		WAIT UNTIL clk'EVENT AND clk='1';
		
		if RST_FSM='1' then
			IFState<=ResetState;
			--InstrOut<="00000000000000000000000000000000";
			--weReg<='1';
		else
			case IFState is
			
				--RESET STATE
			
			when ResetState=> 
					RF_WrData_sel <="00";
					ALU_func <="0000";
					PC_sel <='0';
					PC_LdEn <='0';
					RF_B_sel <='0';
					rst <='1';
					Sell<='0';
					ALU_Bin_sel <='0';
					RF_WrEn <='0';
					MEM_WrEn <='0';
					Immext <= '0';

					
					if RST_FSM='0' then
					
						--weReg(0)<='1';
						PC_sel <='0';
						PC_LdEn <='1';
						
						--if PC="00000000000000000000000000000000" then
							IFState<=StartState;
							IDState<=StartState;
							EXState<=StartState;
							MEMState<=StartState;
							WrBState<=StartState;
						--end if;
						InstrOut<=Instr;
					--else
						--IFState<=ResetState;
						--InstrOut<="00000000000000000000000000000000";
					end if;
					
					
					
					--START STATE
				when StartState=>
				--InstrOut<=Instr;
				--weReg<='1';
				
					
				if IFRegister(31 downto 26)="110000" THEN --addi
						--RF_WrData_sel <="00";
						--ALU_func <="0000";
						PC_sel <='0';
						--PC_LdEn <='0';
						PC_LdEn <='1';
						--RF_B_sel <='0';
						rst <='0';
						--ALU_Bin_sel <='0';
						--RF_WrEn <='0';
						--MEM_WrEn <='0';
						--FsmState<=ALUState;
						--Immext <= '1';
						IFState<=StartState;
						IFRegisterOut<=IFRegister;
						InstrOut<=Instr;
						--weReg<='1';
						--IDRegisterControl<=IFRegister;
						
					
				elsif IFRegister(31 downto 26)="100000" then--OR  IFRegister(31 downto 26)="110010" OR  IFRegister(31 downto 26)="110011"  THEN --rtype/nandi/ori
						--RF_WrData_sel <="00";
						--ALU_func <="0000";
						PC_sel <='0';
						PC_LdEn <='1';
						--RF_B_sel <='0';
						rst <='0';
						--ALU_Bin_sel <='0';
						--RF_WrEn <='0';
						--MEM_WrEn <='0';
						--Immext <= '0';
						IFState<=StartState;
						IFRegisterOut<=IFRegister;
						InstrOut<=Instr;
						--weReg<='1';
						--IDRegisterControl<=IFRegister;
						
					
--				elsif startRegister(31 downto 26)="111111" then--b
--						RF_WrData_sel <="00";
--						ALU_func <="0000";
--						PC_sel <='1'; 
--						PC_LdEn <='1';
--						RF_B_sel <='0';
--						rst <='0';	
--						ALU_Bin_sel <='0';
--						RF_WrEn <='0';
--						MEM_WrEn <='0';
--						Immext <= '1';
--				   	--FsmState<=WAITSTATE;
--						FsmState<=FinalState;
						
					
				elsif IFRegister(31 downto 26)= "111000"then --li
						--RF_WrData_sel <="00";
						--ALU_func <="0000";
						PC_sel <='0'; 
						PC_LdEn <='1';
						--RF_B_sel <='0';
						rst <='0';	
						--ALU_Bin_sel <='0';
						--RF_WrEn <='1';
						--MEM_WrEn <='0';
						--Immext <= '1';
						IFRegisterOut<=IFRegister;
						IDState<=StartState;
						InstrOut<=Instr;
						weReg(0)<='1';
						weReg(1)<='1';
						--IDRegisterControl<=IFRegister;
						
					
				--elsif startRegister(31 downto 26)= "111001" OR 
				elsif IFRegister="00000000000000000000000000000000" then --lui/nop?
						--RF_WrData_sel <="00";
						--ALU_func <="0000";
						PC_sel <='0'; 
						PC_LdEn <='1';
						--RF_B_sel <='0';
						rst <='0';	
						--ALU_Bin_sel <='0';
						--RF_WrEn <='1';
						--MEM_WrEn <='0';
						--Immext <= '0';
						IDState<= StartState;
						IFRegisterOut<=IFRegister;
						InstrOut<=Instr;
						weReg(0)<='1';
						--IDRegisterControl<=IFRegister;
						
--						elsif PC="00000000000000000000000000000000" then
--						PC_sel <='0'; 
--						PC_LdEn <='1';
						
						
--				ELSIF startRegister(31 downto 26)="000000" OR  startRegister(31 downto 26)="000001" THEN -- BEQ BNE
--						RF_WrData_sel <="00";
--						ALU_func <="0001";
--						PC_sel <='0'; 
--						PC_LdEn <='0';
--						RF_B_sel <='1';
--						rst <='0';	
--						ALU_Bin_sel <='0';
--						RF_WrEn <='0';
--						MEM_WrEn <='0';
--						Immext <= '1';
--						FsmState<=ALUState;
									
--				elsif startRegister(31 downto 26)= "011111" then -- sw
--						RF_WrData_sel <="00";
--						ALU_func <="0000";
--						PC_sel <='0'; 
--						PC_LdEn <='0';
--						RF_B_sel <='1';
--						rst <='0';	
--						ALU_Bin_sel <='1';
--						RF_WrEn <='0';
--						MEM_WrEn <='1';
--						Sell <= '1';
--						Immext <= '1';
--						FsmState<=ALUState;
--						aluRegister<= startRegister;
					 
					 
--					elsif startRegister(31 downto 26)= "000111" then -- sb
--						RF_WrData_sel <="00";
--						ALU_func <="0000";
--						PC_sel <='0'; 
--						PC_LdEn <='0';
--						RF_B_sel <='1';
--						rst <='0';	
--						ALU_Bin_sel <='1';
--						RF_WrEn <='0';
--						MEM_WrEn <='1';
--						Sell <= '0';
--						Immext <= '1';
--						FsmState<=ALUState;
					
					
					
--					elsif startRegister(31 downto 26)= "001111" then -- lw
--						RF_WrData_sel <="11";
--						ALU_func <="0000";
--						PC_sel <='0'; 
--						PC_LdEn <='0';
--						RF_B_sel <='1';
--						rst <='0';	
--						ALU_Bin_sel <='1';
--						RF_WrEn <='1';
--						MEM_WrEn <='0';
--						Sell <= '0';
--						Immext <= '1';
--						FsmState<=ALUState;
--						aluRegister<= startRegister;
						
						
						
--						elsif startRegister(31 downto 26)= "000011" then -- lb
--						RF_WrData_sel <="10";
--						ALU_func <="0000";
--						PC_sel <='0'; 
--						PC_LdEn <='0';
--						RF_B_sel <='1';
--						rst <='0';	
--						ALU_Bin_sel <='1';
--						RF_WrEn <='1';
--						MEM_WrEn <='0';
--						Sell <= '0';
--						Immext <= '1';
--						FsmState<=ALUState;
					
					
				end if;
--
--
--
--					when WAITSTATE=>			
--				
--					RF_WrData_sel <="00";
--					ALU_func <="0000";
--					PC_sel <='0';
--					PC_LdEn <='1';
--					RF_B_sel <='0';
--					rst <='0';
--					ALU_Bin_sel <='0';
--					RF_WrEn <='0';
--					MEM_WrEn <='0';
--					FsmState<=FinalState;
--							
--				When ALUState=>
--					
--					if aluRegister(31 downto 26)="100000" then --rformat
--						RF_WrData_sel <="00";
--						ALU_func <=aluRegister(3 downto 0);
--						PC_sel <='0'; 
--						PC_LdEn <='0';
--						RF_B_sel <='0';
--						rst <='0';	
--						ALU_Bin_sel <='0';
--						RF_WrEn <='1';
--						MEM_WrEn <='0';	
--						FsmState<=WAITSTATE;
--						Immext <= '0';
						
						
--					elsif aluRegister(31 downto 26)="110000" then --addi
--						RF_WrData_sel <="00";
--						ALU_func <="0000";
--						PC_sel <='0'; 
--						PC_LdEn <='0';
--						RF_B_sel <='0';
--						rst <='0';	
--						ALU_Bin_sel <='1';
--						RF_WrEn <='1';
--						MEM_WrEn <='0';
--					   FsmState<=WAITSTATE;
--						Immext <= '1';
--					
--					
--					elsif aluRegister(31 downto 26)="110010" then--nandi
--						RF_WrData_sel <="00";
--						ALU_func <="0010";
--						PC_sel <='0'; 
--						PC_LdEn <='0';
--						RF_B_sel <='0';
--						rst <='0';	
--						ALU_Bin_sel <='1';
--						RF_WrEn <='1';
--						MEM_WrEn <='0';		
--					   FsmState<=WAITSTATE;
--						Immext <= '0';
--					
--					elsif aluRegister(31 downto 26)="110011" then--ori
--						RF_WrData_sel <="00";
--						ALU_func <="0011";
--						PC_sel <='0'; 
--						PC_LdEn <='0';
--						RF_B_sel <='0';
--						rst <='0';	
--						ALU_Bin_sel <='1';
--						RF_WrEn <='1';
--						MEM_WrEn <='0';
--					   FsmState<=WAITSTATE;
--						Immext <= '0';
						
			      	
--					elsif aluRegister(31 downto 26)="011111" then --sw
--						RF_WrData_sel <="00";
--						ALU_func <="0000";
--						PC_sel <='0';
--						PC_LdEn <='0';
--						RF_B_sel <='1';
--						rst <='0';
--						ALU_Bin_sel <='1';
--						RF_WrEn <='0';
--						MEM_WrEn <='1';
--						Sell <='1';
--						--FsmState<=FinalState;
--						FsmState<=WAITSTATE;
						
						
						  
--					elsif aluRegister(31 downto 26)="000111" then --SB
--						RF_WrData_sel <="00";
--						ALU_func <="0000";
--						PC_sel <='0';
--						PC_LdEn <='0';
--						RF_B_sel <='1';
--						rst <='0';
--						ALU_Bin_sel <='1';
--						RF_WrEn <='0';
--						MEM_WrEn <='1';
--						Sell <='0';
--						--FsmState<=FinalState;
--						FsmState<=WAITSTATE;
						
						
--					elsif aluRegister(31 downto 26)="001111" then --lw
--						RF_WrData_sel <="11";
--						ALU_func <="0000";
--						PC_sel <='0';
--						PC_LdEn <='0';
--						RF_B_sel <='1';
--						rst <='0';
--						ALU_Bin_sel <='1';
--						RF_WrEn <='1';
--						MEM_WrEn <='0';
--						Sell <='0';
--						--FsmState<=FinalState;
--						FsmState<=WAITSTATE;
--						Immext <= '1';
								
								
								
								
--					elsif aluRegister(31 downto 26)="000011" then --lb
--						RF_WrData_sel <="10";
--						ALU_func <="0000";
--						PC_sel <='0';
--						PC_LdEn <='0';
--						RF_B_sel <='1';
--						rst <='0';
--						ALU_Bin_sel <='1';
--						RF_WrEn <='1';
--						MEM_WrEn <='0';
--						Sell <='0';	
--						--FsmState<=FinalState;
--						FsmState<=WAITSTATE;
--						Immext <= '1';
										

							-- BEQ
--					elsif aluRegister(31 downto 26)="000000" and Zero='1' then
--						RF_WrData_sel <="00";
--						ALU_func <="0000";
--						PC_sel <='1';
--						PC_LdEn <='1';
--						RF_B_sel <='1';
--						rst <='0';
--						ALU_Bin_sel <='0';
--						RF_WrEn <='0';
--						MEM_WrEn <='0';
--						Immext <= '1';
--					   --FsmState<=WAITSTATE;
--						FsmState<=FinalState;
--					
--							-- BEQ
--					elsif aluRegister(31 downto 26)="000000" and Zero='0' then
--						RF_WrData_sel <="00";
--						ALU_func <="0000";
--						PC_sel <='0';
--						PC_LdEn <='1';
--						RF_B_sel <='1';
--						rst <='0';
--						ALU_Bin_sel <='0';
--						RF_WrEn <='0';
--						MEM_WrEn <='0';
--						Immext <= '1';
--						FsmState<=FinalState;
--						--FsmState<=WAITSTATE;
--				
--							-- BNE
--					elsif aluRegister(31 downto 26)="000001" and Zero='1' then
--						RF_WrData_sel <="00";
--						ALU_func <="0000";
--						PC_sel <='0';
--						PC_LdEn <='1';
--						RF_B_sel <='1';
--						rst <='0';
--						ALU_Bin_sel <='0';
--						RF_WrEn <='0';
--						MEM_WrEn <='0';
--						Immext <= '1';
--						--FsmState<=WAITSTATE;
--						FsmState<=FinalState;
--			
--							-- BNE
--					elsif aluRegister(31 downto 26)="000001" and Zero='0' then
--						RF_WrData_sel <="00";
--						ALU_func <="0000";
--						PC_sel <='1';
--						PC_LdEn <='1';
--						RF_B_sel <='1';
--						rst <='0';
--						ALU_Bin_sel <='0';
--						RF_WrEn <='0';
--						MEM_WrEn <='0';
--						Immext <= '1';
--						FsmState<=FinalState;
--						--FsmState<=WAITSTATE;

--					end if;
--					
--					when FinalState=>
--						
--							RF_WrData_sel <="00";
--							ALU_func <="0000";
--							PC_sel <='0';
--							PC_LdEn <='0';
--							RF_B_sel <='0';
--							rst <='0';
--							ALU_Bin_sel <='0';
--							RF_WrEn <='0';
--							MEM_WrEn <='0';
--							Sell <='0';
--							Immext <= '0';
--						FsmState<=StartState; 
						
					end case;
					
			--end if;
			
				case IDState is
					
						when StartState =>
						
						if IDRegister(31 downto 26)="110000" then --addi
							
							RF_B_sel <='1';
							IDState<=StartState;
							Immext <= '1';
							weA <= '1';
							weB <= '1';
							IDRegisterOut<=IDRegister;
							--IDRegisterControl<=IDRegister;

							
							
						elsif IDRegister(31 downto 26)="100000" then--OR  IFRegister(31 downto 26)="110010" OR  IFRegister(31 downto 26)="110011"  THEN --rtype/nandi/ori
							
							RF_B_sel <='0';
							rst <='0';
							Immext <= '0';
							weA <= '1';
							weB <= '1';
							IDState<=StartState;
							IDRegisterOut<=IDRegister;
							--IDRegisterControl<=IDRegister;

							
							
						elsif IDRegister(31 downto 26)= "111000"then --li
						
						RF_B_sel <='0';
						rst <='0';	
						Immext <= '1';
						weA <= '1';
						weB <= '1';
						IDRegisterOut<=IDRegister;
						--IDRegisterControl<=IDRegister;
						EXState<=StartState;
						weReg(2)<='1';
							
							
							
						elsif IDRegister="00000000000000000000000000000000" then --lui/nop?
						
						RF_B_sel <='0';
						rst <='0';	
						weA <= '1';
						weB <= '1';
						Immext <= '0';
						EXState<= StartState;
						IDRegisterOut<=IDRegister;
						weReg(1)<='0';
						
						
						end if;
						
						when others =>		
						
				end case;
				
				case EXState is
				
					when StartState =>
					
					if EXRegister(31 downto 26)="100000" then --rtype
						
							ALU_func <= EXRegister(3 downto 0);
							rst <='0';
							ALU_Bin_sel <='0';
							EXState<=StartState;
							EXRegisterOut<=EXRegister;
							weReg(2)<='1';
							--weMEMRegout<='1';						
							
							
					elsif EXRegister(31 downto 26)= "111000"then --li
						ALU_func <="0000";
						rst <='0';	
						ALU_Bin_sel <='1';
						EXState<=StartState;
						EXRegisterOut<=EXRegister;
						weReg(2)<='1';
						--weMEMRegout<='1';						
						
					elsif EXRegister="00000000000000000000000000000000" then --lui/nop?
						ALU_func <="0000";
						rst <='0';	
						ALU_Bin_sel <='0';
						EXState<= StartState;
						EXRegisterOut<=EXRegister;
						weReg(2)<='0';
						--weMEMRegout<='0';
							
					end if;
					
					when others =>
						
				end case;
				
				case MEMState is
				
					when StartState =>
					
					if MEMRegister(31 downto 26)="100000" then --rtype
						
							RF_WrData_sel <="00";
							rst <='0';
							MEM_WrEn <='0';
							MEMState<=StartState;
							MEMRegisterOut<=MEMRegister;
							--weWrBRegout<='1';
							weMEMRegout<='1';
							weReg(3)<='1';
							
							
							
					elsif MEMRegister(31 downto 26)= "111000"then --li
					
						RF_WrData_sel <="00";
						rst <='0';	
						RF_WrEn <='1';
						MEM_WrEn <='0';
						MEMRegisterOut<=MEMRegister;
						MEMState<=StartState;
						weMEMRegout<='1';
						weReg(3)<='1';
						--weWrBRegout<='1';
						
						
					elsif MEMRegister="00000000000000000000000000000000" then --lui/nop?
					
						RF_WrData_sel <="00";
						rst <='0';	
						MEM_WrEn <='0';
						MEMState<= StartState;
						MEMRegisterOut<=MEMRegister;
						weMEMRegout<='0';
						weReg(3)<='0';
						--weWrBRegout<='1';
							
					end if;
					
					when others =>
						
				end case;
				
				case WrBState is
				
					when StartState =>
					
					if WrBRegister(31 downto 26)="100000" then --rtype
						
							RF_WrData_sel <="00";
							rst <='0';
							RF_WrEn <='1';
							WrBState<=StartState;
							weWrBRegout<='1';
							WrBRegisterOut<=WrBRegister;
							
							
					elsif WrBRegister(31 downto 26)= "111000"then --li
					
						RF_WrData_sel <="00";
						rst <='0';	
						RF_WrEn <='1';
						WrBState<=StartState;
						weWrBRegout<='1';
						WrBRegisterOut<=WrBRegister;
						weReg(4)<='1';
						
						
					elsif WrBRegister="00000000000000000000000000000000" then --lui/nop?
					
						RF_WrData_sel <="00";
						rst <='0';	
						RF_WrEn <='0';
						WrBState<= StartState;
						weWrBRegout<='0';
						WrBRegisterOut<=WrBRegister;
						weReg(4)<='0';
						
							
					end if;
					
					when others =>
						
				end case;
						
			
	end if;	
		
		
		
		
end process;


end Behavioral;

