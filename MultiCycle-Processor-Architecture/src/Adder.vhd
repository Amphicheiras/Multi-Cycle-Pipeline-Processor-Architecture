----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:03:58 03/12/2019 
-- Design Name: 
-- Module Name:    Adder - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
    Port ( Ad_Iin : in  STD_LOGIC_VECTOR (31 downto 0);
           Ad_Imin : in  STD_LOGIC_VECTOR (31 downto 0);
           Adout : out  STD_LOGIC_VECTOR (31 downto 0));
end Adder;

architecture Behavioral of Adder is

signal result :STD_LOGIC_VECTOR(31 downto 0);

begin

	--result<= Ad_Iin + (Ad_Imin * "00000000000000000000000000000100");
	--result<= Ad_Iin + (Ad_Imin(29 downto 0) & "00");
	result<= Ad_Iin + Ad_Imin;
	
	Adout<=result;

end Behavioral;

