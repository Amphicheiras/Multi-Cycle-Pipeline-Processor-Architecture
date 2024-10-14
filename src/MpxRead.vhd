----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:42:19 03/13/2019 
-- Design Name: 
-- Module Name:    MpxRead - Behavioral 
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

entity MpxRead is
    Port ( Instr1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Instr2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_B_sel : in  STD_LOGIC;
           Mout : out  STD_LOGIC_VECTOR (4 downto 0));
end MpxRead;

architecture Behavioral of MpxRead is

begin

Mout <= Instr1 when (RF_B_sel='0') else --instr15-11
	     Instr2;                       --instr20-16


end Behavioral;

