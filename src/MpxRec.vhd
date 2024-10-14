----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:39:08 03/13/2019 
-- Design Name: 
-- Module Name:    MpxRec - Behavioral 
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

entity MpxRec is
    Port ( ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrData_sel : in  STD_LOGIC_vector (1 downto 0);
			  --RF_WrData_Sel : in  STD_LOGIC;
           Mout : out  STD_LOGIC_VECTOR (31 downto 0));
end MpxRec;

architecture Behavioral of MpxRec is

begin

MOut <= MEM_out when (RF_WrData_sel="11") else
			("000000000000000000000000") & MEM_out(7 downto 0) when (RF_WrData_sel="10") else
			--("000000000000000000000000") & ALU_out(7 downto 0) when (RF_WrData_sel="00") else
	      ALU_out;

end Behavioral;

