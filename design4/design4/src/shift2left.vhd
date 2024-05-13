library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Shift2Left is
	port (
	S_IN  : in STD_LOGIC_VECTOR(31 downto 0);
	S_out : out STD_LOGIC_VECTOR(31 downto 0)
	);
end Shift2Left;

architecture Behavioral of Shift2Left is

begin

	process (S_IN)
	begin 	
		-- 01234567-01234567-01234567-01234567
		-- 10101011-00110011-00110010-10101010		    
		-- 10101011-00110011-00110010-101010	
		-- 10101011-00110011-00110010-1010
		-- 0010101011-00110011-00110010-101010
		S_out(31) <= S_in(31);
  		S_out(30 downto 2) <= S_in(28 downto 0);
  		S_out(1 downto 0) <= (others => '0');
	end process;  

end Behavioral;		




