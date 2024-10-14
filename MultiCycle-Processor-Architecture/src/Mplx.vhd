----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:32:40 02/25/2019 
-- Design Name: 
-- Module Name:    Mplx - Behavioral 
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

entity Mplx is
    Port ( Adr : in  STD_LOGIC_VECTOR (4 downto 0);
           inR0 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR3 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR4 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR5 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR6 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR7 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR8 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR9 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR10 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR11 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR12 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR13 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR14 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR15 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR16 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR17 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR18 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR19 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR20 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR21 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR22 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR23 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR24 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR25 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR26 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR27 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR28 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR29 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR30 : in  STD_LOGIC_VECTOR (31 downto 0);
			  inR31 : in  STD_LOGIC_VECTOR (31 downto 0);
           Mout : out  STD_LOGIC_VECTOR (31 downto 0));
end Mplx;

architecture Behavioral of Mplx is

begin

  Mout<= inR0 after 5 ns when Adr="00000" else
	      inR1 after 5 ns when Adr="00001" else
			inR2 after 5 ns when Adr="00010" else
			inR3 after 5 ns when Adr="00011" else
			inR4 after 5 ns when Adr="00100" else
			inR5 after 5 ns when Adr="00101" else
			inR6 after 5 ns when Adr="00110" else
			inR7 after 5 ns when Adr="00111" else
			inR8 after 5 ns when Adr="01000" else
			inR9 after 5 ns when Adr="01001" else
			inR10 after 5 ns when Adr="01010" else
		   inR11 after 5 ns when Adr="01011" else			
			inR12 after 5 ns when Adr="01100" else
			inR13 after 5 ns when Adr="01101" else
			inR14 after 5 ns when Adr="01110" else			
			inR15 after 5 ns when Adr="01111" else			
			inR16 after 5 ns when Adr="10000" else			
			inR17 after 5 ns when Adr="10001" else
			inR18 after 5 ns when Adr="10010" else
			inR19 after 5 ns when Adr="10011" else
			inR20 after 5 ns when Adr="10100" else
			inR21 after 5 ns when Adr="10101" else
			inR22 after 5 ns when Adr="10110" else
			inR23 after 5 ns when Adr="10111" else
			inR24 after 5 ns when Adr="11000" else
			inR25 after 5 ns when Adr="11001" else
			inR26 after 5 ns when Adr="11010" else
			inR27 after 5 ns when Adr="11011" else
			inR28 after 5 ns when Adr="11100" else
			inR29 after 5 ns when Adr="11101" else
			inR30 after 5 ns when Adr="11110" else
			inR31 after 5 ns;


end Behavioral;

