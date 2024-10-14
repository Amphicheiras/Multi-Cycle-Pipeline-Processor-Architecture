----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:37:57 03/26/2019 
-- Design Name: 
-- Module Name:    MXPMEM - Behavioral 
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

entity MXPMEM is
    Port ( MEM_in : in  STD_LOGIC_VECTOR (31 downto 0);
           Sell : in  STD_LOGIC;
           Mout : out  STD_LOGIC_VECTOR (31 downto 0));
end MXPMEM;

architecture Behavioral of MXPMEM is

begin

Mout<= MEM_in when Sell='1' else
       ("000000000000000000000000" & MEM_in(7 downto 0));


end Behavioral;

