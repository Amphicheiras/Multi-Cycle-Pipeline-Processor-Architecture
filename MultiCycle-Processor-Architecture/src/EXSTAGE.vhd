----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:02:01 03/13/2019 
-- Design Name: 
-- Module Name:    EXSTAGE - Behavioral 
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

entity EXSTAGE is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ALU_zero : out  STD_LOGIC);
end EXSTAGE;

architecture Behavioral of EXSTAGE is

component ALU is
	Port (  A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           DOut : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end component;


component MpxALU is
	 Port ( RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           Mout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal tMout : sTD_LOGIC_VECTOR (31 downto 0);
signal tZero, tOvf, tCout : sTD_LOGIC;

begin


MALU : MpxALU 
	port map( 	RF_B => RF_B,
					Immed => Immed,
					ALU_Bin_sel =>ALU_Bin_sel,
					MOut => tMout);
  
ALU1 : ALU 
	port map( 	A =>RF_A,
					B =>tMout,
					Op =>ALU_func,
					Zero =>tZero,
					Cout =>tCout,
					Ovf =>tOvf,
					Dout =>ALU_out);
					
ALU_zero <= tZero;				

end Behavioral;

