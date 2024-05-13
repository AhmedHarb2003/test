library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    Port (
        opcode : in STD_LOGIC_VECTOR(5 downto 0);  -- Opcode field of the instruction
        RegDst : out STD_LOGIC;  -- Register destination   0
        ALUSrc : out STD_LOGIC;  -- ALU source				1 
        MemtoReg : out STD_LOGIC;  -- Memory to register	2
        RegWrite : out STD_LOGIC;  -- Register write enable	 3
        MemRead : out STD_LOGIC;  -- Memory read enable		  4
        MemWrite : out STD_LOGIC;  -- Memory write enable	   5
        Branch : out STD_LOGIC;  -- Branch instruction			6
        Jump : out STD_LOGIC;  -- Jump instruction				 7
		AlUOp : out std_logic_vector(1 downto 0) 				--   89
    );
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
    process (opcode)
    begin
        case opcode is
            when "100011" =>  -- Load instruction
                RegDst <= '0';  -- Destination is irrelevant
                ALUSrc <= '1';  -- ALU source is immediate value
                MemtoReg <= '1';  -- Memory to register
                RegWrite <= '1';  -- Register write enable
                MemRead <= '1';  -- Memory read enable
                MemWrite <= '0';  -- Memory write disable
                Branch <= '0';  -- Branch instruction disable
                Jump <= '0';  -- Jump instruction disable 
				ALUOp <= "00"; --
             when "000000" =>  -- R - type
                RegDst <= '1';  -- Destination is irrelevant
                ALUSrc <= '0';  -- ALU source is immediate value
                MemtoReg <= '1';  -- Memory to register
                RegWrite <= '1';  -- Register write enable
                MemRead <= '0';  -- Memory read enable
                MemWrite <= '0';  -- Memory write disable
                Branch <= '0';  -- Branch instruction disable
                Jump <= '0';  -- Jump instruction disable
				ALUOp <= "10"; -- 
            when "101011" =>  -- Store instruction
                RegDst <= '0';  -- Destination is irrelevant
                ALUSrc <= '1';  -- ALU source is immediate value
                MemtoReg <= '0';  -- Memory to register is irrelevant
                RegWrite <= '0';  -- Register write disable
                MemRead <= '0';  -- Memory read disable
                MemWrite <= '1';  -- Memory write enable
                Branch <= '0';  -- Branch instruction disable
                Jump <= '0';  -- Jump instruction disable 
				ALUOp <= "00";		
			when "000100" =>  -- Branch to equal i type instruction
                RegDst <= '0';  -- Destination is irrelevant
                ALUSrc <= '0';  -- ALU source is immediate value
                MemtoReg <= '0';  -- Memory to register is irrelevant
                RegWrite <= '0';  -- Register write disable
                MemRead <= '0';  -- Memory read disable
                MemWrite <= '1';  -- Memory write enable
                Branch <= '1';  -- Branch instruction disable
                Jump <= '0';  -- Jump instruction disable 
				ALUOp <= "01";	 -- sub 
			when "000010" =>  --  Jump instruction
                RegDst <= '0';  -- Destination is irrelevant
                ALUSrc <= '0';  -- ALU source is immediate value
                MemtoReg <= '0';  -- Memory to register is irrelevant
                RegWrite <= '0';  -- Register write disable
                MemRead <= '0';  -- Memory read disable
                MemWrite <= '0';  -- Memory write enable
                Branch <= '0';  -- Branch instruction disable
                Jump <= '1';  -- Jump instruction disable 
				ALUOp <= "00";	 -- sub 
            when others =>  -- Default case
                RegDst <= '0';
                ALUSrc <= '0';
                MemtoReg <= '0';
                RegWrite <= '0';
                MemRead <= '0';
                MemWrite <= '0';
                Branch <= '0';
                Jump <= '0';
        end case;
    end process;
end Behavioral;