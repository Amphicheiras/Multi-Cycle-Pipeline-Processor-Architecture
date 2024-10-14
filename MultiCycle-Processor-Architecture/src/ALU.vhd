----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:46:36 02/19/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
--USE ieee.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           DOut : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

signal result : STD_LOGIC_VECTOR (31 downto 0);
--signal flag :  STD_LOGIC;
signal sum : STD_LOGIC_VECTOR (32 downto 0);


begin
     
	  result <=  (A+B) when Op="0000" else --ADD
	             (A-B) when Op="0001" else --SUB
					 (A nand B) when Op="0010" else --NAND
					 (A or B) when Op="0011" else --OR
					 (not A) when Op="0100" else --NOT
					 (A(31) & A(31 downto 1) ) when Op="1000" else --Arithmetic Rshift
                ('0' & A(31 downto 1) ) when Op="1001" else --Logic Rshift
					 (A(30 downto 0) & '0') when Op="1010" else --Logic Lshift
					 (A(30 downto 0) & A(31)) when Op="1100" else -- Cyclic Lshift
					 (A(0) & A(31 downto 1) ) when Op="1101" else--Cyclic Rshift
					 "00000000000000000000000000000000";
					 
	 DOut<=result after 10 ns;
	 
	 Zero <= '1' when result=0 else '0';
	 
	 
	 sum <= ('0' & A) + ('0' & B);
	 --flag <= A(31) xor B(31);
	 	 
	 --Ovf<= (A(31) xor result(31)) when flag='0' else '0';
	 Ovf <= sum(32) xor sum(31) when A(31)=B(31) else '0';
	 Cout <= sum(32);


end Behavioral;

