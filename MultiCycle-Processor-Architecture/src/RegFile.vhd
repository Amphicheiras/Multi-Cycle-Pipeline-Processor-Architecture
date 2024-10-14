----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:44:31 02/25/2019 
-- Design Name: 
-- Module Name:    RegFile - Behavioral 
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

entity RegFile is
    Port ( clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Adr1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Adr2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0));
end RegFile;

architecture Behavioral of RegFile is

component Registerr is 
	Port (  clk : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           we : in  STD_LOGIC 
			  );
end component;

component Decoder is
	Port ( Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component Mplx is
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
           Mout : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;


signal Tdec, TWrEn :std_logic_vector (31 downto 0);
type arr is array (0 to 31) of std_logic_vector(31 downto 0);
signal TRout : arr; --create 2D array

begin

TRout(0)<="00000000000000000000000000000000";


DEC: Decoder
	port map ( Awr=>Awr,
					Dout=>Tdec);
					

Gen1: for i in Tdec' range generate 	

					TWrEn(i)<='1' after 2 ns when (Tdec(i) and WrEn)='1' else '0';
end generate;


Gen2: for i in 1 to 31 generate

	Reg:Registerr 
		port map ( clk=>clk,
						Din=>Din,
						we=>TWrEn(i),
						Dout=>TRout(i));						
end generate;


MPLX1: Mplx
	port map ( Adr=>Adr1,
					inR0=>TRout(0),
					inR1=>TRout(1),
					inR2=>TRout(2),
					inR3=>TRout(3),
					inR4=>TRout(4),
					inR5=>TRout(5),
					inR6=>TRout(6),
					inR7=>TRout(7),
					inR8=>TRout(8),
					inR9=>TRout(9),
					inR10=>TRout(10),
					inR11=>TRout(11),
					inR12=>TRout(12),
					inR13=>TRout(13),
					inR14=>TRout(14),
					inR15=>TRout(15),
					inR16=>TRout(16),
					inR17=>TRout(17),
					inR18=>TRout(18),
					inR19=>TRout(19),
					inR20=>TRout(20),
					inR21=>TRout(21),
					inR22=>TRout(22),
					inR23=>TRout(23),
					inR24=>TRout(24),
					inR25=>TRout(25),
					inR26=>TRout(26),
					inR27=>TRout(27),
					inR28=>TRout(28),
					inR29=>TRout(29),
					inR30=>TRout(30),
					inR31=>TRout(31),
					Mout=>Dout1);

MPLX2: Mplx
	port map ( Adr=>Adr2,
					inR0=>TRout(0),
					inR1=>TRout(1),
					inR2=>TRout(2),
					inR3=>TRout(3),
					inR4=>TRout(4),
					inR5=>TRout(5),
					inR6=>TRout(6),
					inR7=>TRout(7),
					inR8=>TRout(8),
					inR9=>TRout(9),
					inR10=>TRout(10),
					inR11=>TRout(11),
					inR12=>TRout(12),
					inR13=>TRout(13),
					inR14=>TRout(14),
					inR15=>TRout(15),
					inR16=>TRout(16),
					inR17=>TRout(17),
					inR18=>TRout(18),
					inR19=>TRout(19),
					inR20=>TRout(20),
					inR21=>TRout(21),
					inR22=>TRout(22),
					inR23=>TRout(23),
					inR24=>TRout(24),
					inR25=>TRout(25),
					inR26=>TRout(26),
					inR27=>TRout(27),
					inR28=>TRout(28),
					inR29=>TRout(29),
					inR30=>TRout(30),
					inR31=>TRout(31),
					Mout=>Dout2);

end Behavioral;

