----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:35:42 03/13/2019 
-- Design Name: 
-- Module Name:    DECSTAGE - Behavioral 
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

entity DECSTAGE is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
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
end DECSTAGE;

architecture Behavioral of DECSTAGE is

component RegFile is
	Port ( clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Adr1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Adr2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0));
end component;

component Extender is
	Port ( Instr : in  STD_LOGIC_VECTOR (15 downto 0);
			  ImmExt : in STD_LOGIC;
           OpCode : in  STD_LOGIC_VECTOR (5 downto 0);
           Immed : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MpxRec is
	Port ( ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrData_sel : in  STD_LOGIC_vector (1 downto 0);
			  --RF_WrData_Sel : in  STD_LOGIC;
           Mout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MpxRead is
	Port ( Instr1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Instr2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_B_sel : in  STD_LOGIC;
           Mout : out  STD_LOGIC_VECTOR (4 downto 0));
end component;


signal tMReadOut:STD_LOGIC_VECTOR(4 downto 0);
signal tMRecOut:STD_LOGIC_VECTOR(31 downto 0);

begin

RFile:RegFile 
	port map(   Din=>tMRecOut,
					Adr1=>Instr(25 downto 21),
					Adr2=>tMReadOut,
					--Awr=>Instr(20 downto 16),
					Awr=>RF_WrBadr(20 downto 16),
					clk=>Clk,
					WrEn=>RF_WrEn,
					Dout1=>RF_A,
					Dout2=>RF_B);
					
					
Ex:Extender 
	port map(   Instr=>Instr(15 downto 0),
					ImmExt=>ImmExt,
					OpCode=>Instr(31 DOWNTO 26),
					Immed=>Immed);
					
					
Rec:MpxRec 
	port map(   MEM_out=>MEM_out,
					ALU_out=>ALU_out,
					RF_WrData_sel=>RF_WrData_sel,
					MOut=>tMRecOut); 


MRead:MpxRead 
	port map(   Instr1=>Instr(15 downto 11),
					Instr2=>Instr(20 downto 16),
					RF_B_sel=>RF_B_sel,
					Mout=>tMReadOut);					


end Behavioral;

