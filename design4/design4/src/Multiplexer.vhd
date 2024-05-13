Library ieee;
use ieee.std_logic_1164.all;

entity MUX is
	port(
	a,b: in std_logic_vector(4 downto 0);
	s:in std_logic;
	c : out std_logic_vector(4 downto 0)
	);	  
end MUX;

architecture arch of MUX is
begin
    c <= a when s = '0' else b;
end arch;