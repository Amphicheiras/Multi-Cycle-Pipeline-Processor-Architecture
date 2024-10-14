----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:52:35 03/12/2019 
-- Design Name: 
-- Module Name:    Incrementor - Behavioral 
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

entity Incrementor is
    Port ( Iin : in  STD_LOGIC_VECTOR (31 downto 0);
           Iout : out  STD_LOGIC_VECTOR (31 downto 0));
end Incrementor;

architecture Behavioral of Incrementor is

signal result :STD_LOGIC_VECTOR(31 downto 0);

begin

	result<=(Iin+"00000000000000000000000000000100");

	Iout<=result;

end Behavioral;

