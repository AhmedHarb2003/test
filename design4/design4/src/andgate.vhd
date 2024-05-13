library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

entity andgate is
	port (
	a, b: in std_logic;
	c: out std_logic
	);
end andgate;

architecture forandgate of andgate is

begin

	c <= a and b;

end forandgate;