Library ieee;
use ieee.std_logic_1164.all;
use work.Comp_package.all;
entity MIPS is
	port(
		clk : in std_logic
	);	  
end MIPS;

architecture arch of MIPS is  
signal instruct_memory : std_logic_vector(31 downto 0);

signal outControlUnit : std_logic_vector(9 downto 0);

signal outmux1: std_logic_vector(4downto 0);

signal readdata1: std_logic_vector(31 downto 0);

signal readdata2: std_logic_vector(31 downto 0);

signal ot_si_ex : std_logic_vector(31 downto 0);

signal outmux32bit1: std_logic_vector(31downto 0); 

signal outmux32bit2: std_logic_vector(31downto 0);

signal outmux32bit3: std_logic_vector(31downto 0);

signal outmux32bit4: std_logic_vector(31downto 0) := "00000000000000010000000000001100";

signal out_alu_control: std_logic_vector(2 downto 0);

signal zero : STD_LOGIC;							 

signal alu_result : std_logic_vector(31 downto 0);

signal datamemory_out : std_logic_vector(31 downto 0); 

signal pcOut :  std_logic_vector(31 downto 0);

signal pcAdderOut : std_logic_vector(31 downto 0);

signal shiftleftout1: std_logic_vector(31 downto 0);   

signal shiftleftout2: std_logic_vector(31 downto 0);

signal addout: std_logic_vector(31 downto 0);  

signal forshiftleftsize	: std_logic_vector(31 downto 0) := "000000" & instruct_memory(25 downto 0);

signal outandgate: std_logic;

begin 			 
	
	
	insmemory : InstructionMemory port map(clk , pcOut, instruct_memory);  
	
	pc : ProgramCounter port map  (clk,'0', outmux32bit4,pcOut);
	
	CU :  ControlUnit port map(instruct_memory(31 downto 26),outControlUnit(0),  
	outControlUnit(1),
	outControlUnit(2) ,
	outControlUnit(3) ,
	outControlUnit(4) ,
	outControlUnit(5) ,
	outControlUnit(6) ,
	outControlUnit(7) ,
	outControlUnit(9 downto 8));			
	
	
	mux1: MUX port map(instruct_memory(20 downto 16), instruct_memory(15 downto 11), outControlUnit(0),outmux1); -- outcontrolunit(0) is reg dis 
	
	
	
	reg_file : RegisterFile port map(clk,outControlUnit(3),outmux1, outmux32bit2, instruct_memory(25 downto 21),
	instruct_memory(20 downto 16), readdata1, readdata2);	 -- writeData
	
	
	sign : SignExtender port map  (instruct_memory(15 downto 0) ,ot_si_ex);
	
	
	mux32bit: mux32bit port map(readdata2,ot_si_ex,outControlUnit(1),outmux32bit1);
	
	
	alu_control : ALU_Control port map (instruct_memory(5 downto 0),outControlUnit(9 downto 8) ,out_alu_control) ;
	
	alu  : ALU port map (out_alu_control,readdata1,outmux32bit1,alu_result,zero);
	
	datamemorylabel : DataMemory port map ( clk,alu_result,readdata2,outControlUnit(4),outControlUnit(5), datamemory_out);
	
	mux32bit2 : mux32bit port map(datamemory_out,alu_result,outControlUnit(2),outmux32bit2); 
	
	pcAdder : ProgramCounterAdder port map(pcOut, pcAdderOut);
	
	shiftL1 : Shift2Left port map(ot_si_ex, shiftleftout2);
	
	shiftL2 : Shift2Left port map(forshiftleftsize,shiftleftout1);
	
	adder: adder port map(pcAdderOut,shiftleftout2, addout);  
	
	andgate: andgate port map(zero,outControlUnit(6), outandgate); 
	
   	mux32bit3 : mux32bit port map(pcAdderOut,addout, outandgate,outmux32bit3);	   
	   
	mux32bit4 : mux32bit port map(shiftleftout1,outmux32bit3,outControlUnit(7), outmux32bit4);	
	   
end arch;