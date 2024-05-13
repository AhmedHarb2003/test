library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder is
	port (
		add_in1,add_in2   : in STD_LOGIC_VECTOR(31 downto 0);
		add_out : out STD_LOGIC_VECTOR(31 downto 0)
	);
end adder;

architecture foradder of adder is

begin
		add_out <= add_in1 + add_in2;

end foradder;