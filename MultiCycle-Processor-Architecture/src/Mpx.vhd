----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:13:21 03/12/2019 
-- Design Name: 
-- Module Name:    Mpx - Behavioral 
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

entity Mpx is
    Port ( MincrIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MaddIn : in  STD_LOGIC_VECTOR (31 downto 0);
           Mout : out  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC);
end Mpx;

architecture Behavioral of Mpx is

begin

	Mout<= MincrIn when sel='0' else
			 MaddIn;

end Behavioral;

