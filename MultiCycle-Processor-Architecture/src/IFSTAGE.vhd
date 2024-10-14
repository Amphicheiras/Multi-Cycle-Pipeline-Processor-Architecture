----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:39:18 03/12/2019 
-- Design Name: 
-- Module Name:    IFSTAGE - Behavioral 
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

entity IFSTAGE is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end IFSTAGE;

architecture Behavioral of IFSTAGE is

component PC is
	Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           PC_LdEn : in  STD_LOGIC);
end component;

component Incrementor is
	Port ( Iin : in  STD_LOGIC_VECTOR (31 downto 0);
           Iout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Adder is
	Port ( Ad_Iin : in  STD_LOGIC_VECTOR (31 downto 0);
           Ad_Imin : in  STD_LOGIC_VECTOR (31 downto 0);
           Adout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mpx is
	Port ( MincrIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MaddIn : in  STD_LOGIC_VECTOR (31 downto 0);
           Mout : out  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC);
end component;

--component RAM is
--	Port ( CLK : in  STD_LOGIC;
--           inst_addr : in  STD_LOGIC_VECTOR (10 downto 0);
--           inst_dout : out  STD_LOGIC_VECTOR (31 downto 0);
--           data_we : in  STD_LOGIC;
--           data_addr : in  STD_LOGIC_VECTOR (10 downto 0);
--           data_din : in  STD_LOGIC_VECTOR (31 downto 0);
--           data_dout : out  STD_LOGIC_VECTOR (31 downto 0));
--end component;

signal tMout, tPCout, tIncrOut, tAdOut : STD_LOGIC_VECTOR (31 downto 0);

begin

PC1: PC
	port map( 	clk=>clk,
					rst=>RESET,
					Din=>tMout,
					Dout=>tPCout,
					PC_LdEn=>PC_LdEn);
					
Incr: Incrementor
	port map( 	Iin=>tPCout,
					Iout=>tIncrOut);
					
Add: Adder
	port map( 	Ad_Iin=>tIncrOut,
					Ad_Imin=>PC_Immed,
					Adout=>tAdOut);

Mult: Mpx
	port map( 	MincrIn=>tIncrOut,
					MaddIn=>tAdOut,
					Mout=>tMout,
					sel=>PC_sel);

--RAM2: RAM
--	port map( 	CLK=>clk,
--					inst_addr=>tPCout(12 downto 2),
--					inst_dout=>tInstr,
--					data_we=>'0',
--					data_addr=>"00000000000",
--					data_din=>"00000000000000000000000000000000",
--					data_dout=>MEM_out);
					
PCout<=tPCout;
	
	

end Behavioral;

