----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:38:30 03/13/2019 
-- Design Name: 
-- Module Name:    Extender - Behavioral 
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

entity Extender is
    Port ( Instr : in  STD_LOGIC_VECTOR (15 downto 0);
			  ImmExt : in  STD_LOGIC;
           OpCode : in  STD_LOGIC_VECTOR (5 downto 0);
           Immed : out  STD_LOGIC_VECTOR (31 downto 0));
end Extender;

architecture Behavioral of Extender is

signal tempout : STD_LOGIC_VECTOR (31 downto 0);
signal temp : STD_LOGIC_VECTOR (31 downto 0);

begin


		--temp <= ("1111111111111111" & Instr) when Instr(15)='1' else
		--			("0000000000000000" & Instr);
		
					
--		temp <= ("1111111111111111" & Instr) when (ImmExt='1' and Instr(15)='1') else
--					--("0000000000000000" & Instr) when (ImmExt='1' and Instr(15)='0') else
--					("0000000000000000" & Instr);
--
--  
--		tempout <=  ("0000000000000000" & Instr(15 downto 0)) when (OpCode="110010") OR (OpCode="110011") else 
--						(Instr & "0000000000000000") when (OpCode="111001") else 
--					   (temp) when (OpCode="111000") OR (OpCode="110000") OR (OpCode="001111") OR (OpCode="011111") OR (OpCode="000111") OR (OpCode="000011") else 
--						(temp(29 downto 0) & "00") when (OpCode="111111") OR (OpCode="000000") OR (OpCode="000001") else
--						tempout;

tempout <=("1111111111111111" & Instr) when (ImmExt='1' and Instr(15)='1' and ((OpCode="111000") OR (OpCode="110000") OR (OpCode="001111") OR (OpCode="011111") OR (OpCode="000111") OR (OpCode="000011"))) else
			 ("0000000000000000" & Instr) when (ImmExt='1' and Instr(15)='0' and ((OpCode="111000") OR (OpCode="110000") OR (OpCode="001111") OR (OpCode="011111") OR (OpCode="000111") OR (OpCode="000011"))) else
			 ("0000000000000000" & Instr) when (ImmExt='0' and ((OpCode="110010") OR (OpCode="110011"))) else 
			 (Instr & "0000000000000000") when (OpCode="111001") else  
			 ("11111111111111" & Instr & "00") when (ImmExt='1' and Instr(15)='1' and ((OpCode="111111") OR (OpCode="000000") OR (OpCode="000001"))) else
			 ("00000000000000" & Instr & "00") when (ImmExt='1' and Instr(15)='0' and ((OpCode="111111") OR (OpCode="000000") OR (OpCode="000001"))) else
			 tempout;
							
 
 Immed <= tempout;

end Behavioral;

