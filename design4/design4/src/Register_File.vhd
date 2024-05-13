library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
    Port (
        clk : in STD_LOGIC;
        regWrite : in STD_LOGIC;
		
        writeReg : in STD_LOGIC_VECTOR(4 downto 0);	   
		
        writeData : in STD_LOGIC_VECTOR(31 downto 0);  
		
        readReg1 : in STD_LOGIC_VECTOR(4 downto 0);
        readReg2 : in STD_LOGIC_VECTOR(4 downto 0);	
		
        readData1 : out STD_LOGIC_VECTOR(31 downto 0);
        readData2 : out STD_LOGIC_VECTOR(31 downto 0)
    );
end RegisterFile;

architecture Behavioral of RegisterFile is

type RegisterArrayType is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);-- ?? BAQOLK HENA LAZEM AMLA EL REGISTERS ELI 3NDI 
constant Instructions : RegisterArrayType := (
        -- Initialize memory with your instructions here
        -- For example: (32'h0000000C) => ADDI R1, R0, 12
        --              (32'h0000000D) => ADDI R2, R0, 13
        --              ...
        "00000000000000000000000000000000", -- ADDI R1, R0, 12
        "00000000000000000000000000000001", -- ADDI R2, R0, 13
        "00000000000000000000000000000010", -- ADD R3, R1, R2
        "00000000000000000000000000000011", -- SUB R4, R3, R2
        "00000000000000000000000000000000", -- LW R5, 0(R1)
        "00000000000000000000000000000000", -- SW R6, 4(R2)
        "00000000000000000000000000000000", -- BEQ R1, R2, label
        "00000000000000000000000000000000", -- J label
        "00000000000000000000000000000000", -- JR R7
        "00000000000000000000000000000000",  -- HALT (for example) 
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",	 
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000"
    );		
	
    signal registers : RegisterArrayType := (others => (others => '0'));
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if regWrite = '1' then
                registers(to_integer(unsigned(writeReg))) <= writeData;
            end if;
            readData1 <= registers(to_integer(unsigned(readReg1)));
            readData2 <= registers(to_integer(unsigned(readReg2)));
        end if;
    end process;
end Behavioral;