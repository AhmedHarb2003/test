library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  

use IEEE.NUMERIC_STD.ALL; -- Use NUMERIC_STD package instead

entity InstructionMemory is
    Port ( clk : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR(31 downto 0);
           instruction : out STD_LOGIC_VECTOR(31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is
    type InstructionMemoryArray is array (natural range <>) of STD_LOGIC_VECTOR(31 downto 0); -- Assuming 1 MB Instruction Memory
    constant Instructions : InstructionMemoryArray := (
        -- Initialize memory with your instructions here
        -- For example: (32'h0000000C) => ADDI R1, R0, 12
        --              (32'h0000000D) => ADDI R2, R0, 13
        --              ...
        "00000000000000010000000000001100", -- ADDI R1, R0, 12
        "00000000000000100000000000001101", -- ADDI R2, R0, 13
        "00000001001000110001100000100000", -- ADD R3, R1, R2
        "00000001011001100010000000100010", -- SUB R4, R3, R2
        "10001100001001010000000000000000", -- LW R5, 0(R1)
        "10101100010001100000000000000100", -- SW R6, 4(R2)
        "00010000001000100000000000000000", -- BEQ R1, R2, label
        "00001000000000000000000000000000", -- J label
        "00000011111000000000000000001000", -- JR R7
        "11111111111111111111111111111111"  -- HALT (for example)
    );

begin
    process(clk)
    begin
        if rising_edge(clk) then
            instruction <= Instructions(to_integer(unsigned(address)));
        end if;
    end process;

end Behavioral;