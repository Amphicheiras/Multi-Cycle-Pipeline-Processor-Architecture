----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:12:04 02/25/2019 
-- Design Name: 
-- Module Name:    Registerr - Behavioral 
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

entity Registerr is
    Port ( clk : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           we : in  STD_LOGIC);
end Registerr;

architecture Behavioral of Registerr is

signal tOut: std_logic_vector (31 downto 0):="00000000000000000000000000000000";

begin

process
begin

	wait until (clk'event and clk='1'); 
	
	if we='1' then tOut<=Din;
	else tOut<=tOut;
	end if;
	
end process;

Dout<=tOut after 5 ns;


end Behavioral;

