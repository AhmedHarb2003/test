

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux32bit is	 
	port(
	a,b: in std_logic_vector(31 downto 0);
	s:in std_logic;
	c : out std_logic_vector(31 downto 0)
	);
end mux32bit;



architecture mux32bit of mux32bit is
begin
c <= a when s = '0' else b;

end mux32bit;
