----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:50:49 03/13/2019 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( clk : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC);
end PC;

architecture Behavioral of PC is

signal tmp : STD_LOGIC_VECTOR (31 downto 0);

begin
Process

	begin

	wait until(clk'EVENT AND clk='1');
	
	if(rst='1') then
	   tmp<="00000000000000000000000000000100";
	else
		if(PC_LdEn='1') then 
			tmp<= Din;
		else
			tmp <= tmp;
		end if;
	end if;
	
end process;	

	Dout <=tmp after 5 ns;
end Behavioral;

