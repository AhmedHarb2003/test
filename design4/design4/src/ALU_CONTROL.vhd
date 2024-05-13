library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_Control is
    Port (
    --    opcode : in STD_LOGIC_VECTOR(5 downto 0);  -- Opcode field of the instruction
        funct : in STD_LOGIC_VECTOR(5 downto 0);   -- Function field of the instruction (for R-type instructions)
        ALUOp : in STD_LOGIC_VECTOR(1 downto 0);   -- ALU operation field (determined by the instruction type)
        ALUControl : out STD_LOGIC_VECTOR(2 downto 0)  -- Control signals for the ALU
    );
end ALU_Control;

architecture Behavioral of ALU_Control is
begin
    process ( funct, ALUOp)
    begin
        -- Default control signals
        ALUControl <= "000";

        -- Control signals based on opcode and ALUOp
        case ALUOp is
            when "10" =>  -- R-type instruction
                case funct is
                    when "100000" =>  -- ADD
                        ALUControl <= "010";  -- Addition
                    when "100010" =>  -- SUB
						ALUControl <= "110";  -- Subtraction	 
					when "100100" =>  -- AND
						ALUControl <= "000";  -- AND
					when "100101" =>  -- OR
                        ALUControl <= "001";  -- OR
                    when others =>
                        ALUControl <= "111";  -- Default (no operation)
                end case;
            when "00" =>  -- Load/Store instruction
                ALUControl <= "010";  -- Addition
            when "01" =>  -- Branch instruction
                ALUControl <= "110";  -- Subtraction
            when "--" =>  -- Jump instruction
                ALUControl <= "000";  -- Default (no operation)
            -- Add more cases as needed for additional ALU operations
            when others =>
                ALUControl <= "111";  -- Default (no operation)
        end case;
    end process;
end Behavioral;