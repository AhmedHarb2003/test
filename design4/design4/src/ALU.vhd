library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port (
        operation : in STD_LOGIC_VECTOR(2 downto 0); -- Control input for selecting operation
        operand1 : in STD_LOGIC_VECTOR(31 downto 0); -- First operand
        operand2 : in STD_LOGIC_VECTOR(31 downto 0); -- Second operand
        result : out STD_LOGIC_VECTOR(31 downto 0);  -- Result of the operation
        zero : out STD_LOGIC                         -- Zero flag indicating result is zero
    );
end ALU;

architecture Behavioral of ALU is 
signal res : STD_LOGIC_VECTOR(31 downto 0);
begin
    process (operation, operand1, operand2)
    begin
        case operation is  -- alu control
            when "010" =>  -- Addition
                res <= std_logic_vector(unsigned(operand1) + unsigned(operand2));
            when "110" =>  -- Subtraction
                res <= std_logic_vector(unsigned(operand1) - unsigned(operand2));
            when "000" =>  -- Logical AND
                res <= operand1 and operand2;
            when "001" =>  -- Logical OR
                res <= operand1 or operand2;
            when others =>
                res <= (others => '1');  -- Default to all ones
        end case;
		
		
        -- Set zero flag if result is zero
			if res="00000000000000000000000000000000" then
        zero <= '1' ;else
		zero <= '0'	; 
		end if;
		result <= res ;
    end process;
end Behavioral;