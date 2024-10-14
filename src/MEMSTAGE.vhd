----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:37:23 03/08/2019 
-- Design Name: 
-- Module Name:    MEMSTAGE - Behavioral 
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
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEMSTAGE is
    Port ( CLK : in  STD_LOGIC;
           Mem_WrEn : in  STD_LOGIC;
			  Sell : in  STD_LOGIC;
           ALU_MEM_addr : in  STD_LOGIC_VECTOR (31 downto 0);
			  Instr_MEM_addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
			  inst_dout : out  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MEMSTAGE;

architecture Behavioral of MEMSTAGE is

component RAM is
	port (
			CLK : in std_logic;
			inst_addr : in std_logic_vector(10 downto 0);
			inst_dout : out std_logic_vector(31 downto 0);
			data_we : in std_logic;
			data_addr : in std_logic_vector(10 downto 0);
			data_din : in std_logic_vector(31 downto 0);
			data_dout : out std_logic_vector(31 downto 0));

	end component;
	
component MXPMEM
Port ( 		MEM_in : in  STD_LOGIC_VECTOR (31 downto 0);
           Sell : in  STD_LOGIC;
           Mout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

	
signal addr, tempMout : std_logic_vector(31 downto 0);

begin

	addr<="00000000000000000001000000000000" + ALU_MEM_addr;
	
	
RAM1: RAM
 port map(
			  inst_addr=>Instr_MEM_addr(12 downto 2),
			  inst_dout =>inst_dout,
           CLK=>clk,
			  data_we => Mem_WrEn,
			  data_addr=>addr(12 downto 2),
			  data_din=> tempMout,
			  --data_din=> MEM_DataIn,
			  data_dout=>MEM_DataOut);

MMEM: MXPMEM
port map(	MEM_in=>MEM_DataIn,
				Sell=>Sell,
				Mout=>tempMout);
				
				

end Behavioral;

