library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;


package CPU_package is
	
	constant address_size : integer := 4;
	constant data_size : integer := 4;
	constant operation_size : integer := 4;
	constant instruction_size : integer := 10;
	
	subtype data_word is std_logic_vector((data_size-1) downto 0);
	subtype address_bus is std_logic_vector(address_size-1 downto 0);
	subtype data_bus is std_logic_vector(data_size-1 downto 0);
	subtype instruction_bus is std_logic_vector(instruction_size-1 downto 0);
	subtype program_word is std_logic_vector(instruction_size-1 downto 0);
	subtype command_word is std_logic_vector(operation_size-1 downto 0);
	
	function add_overflow(a, b : std_logic_vector)
		return std_logic_vector;
		
	function sub_overflow(a, b : std_logic_vector)
		return std_logic_vector;

end package;


package body CPU_package is 
	
	function add_overflow(a, b : std_logic_vector)
		return std_logic_vector is
		variable y : std_logic_vector(a'length downto 0);
	begin
		y := ('0' & a) + ('0' & b);
		return y;
	end function;
	
	function sub_overflow(a, b : std_logic_vector)
		return std_logic_vector is
		variable y : std_logic_vector(a'length downto 0);
	begin
		y := ('0' & a) - ('0' & b);
		return y;
	end function;
	
end package body;
		