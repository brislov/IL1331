library ieee;
use ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.all;
use work.cpu_package.all;


entity rom_tb is -- read only memory
end entity;


architecture rtl of rom_tb is
	component rom is
		port(
		adr  : in address_bus;
		data : out instruction_bus;
		ce   : in std_logic
		);
	end component;
	
	signal adr  : address_bus := (others => '0');
	signal data : instruction_bus;
	signal ce   : std_logic := '0';
	
	begin
	UUT: rom port map(adr, data, ce);
	
	ce <= not ce after 5 ns;
	adr <= address_bus(to_unsigned(to_integer(unsigned(adr)) + 1, adr'length)) after 5 ns; 
		
end architecture;
