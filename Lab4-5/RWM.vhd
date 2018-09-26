library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.CPU_Package.all;


entity RWM is
	port(
		adr  : in address_bus;
		data : inout data_bus;
		clk  : in std_logic;
		ce   : in std_logic;
		rw   : in std_logic
	);
end entity;


architecture RTL of RWM is
	
	type data_buses is array (15 downto 0) of std_logic_vector(3 downto 0);
	signal mem : data_buses;
	
	begin
	
	process(clk)
	begin
		if rising_edge(clk) then
			if (ce = '0' AND rw = '0') then
				-- write to memory
				mem(to_integer(unsigned(adr))) <= data;
			end if;
		end if;
	end process;
	-- set data to high impedance or read from memory 
	data <= (others =>'Z') when (ce = '1' OR rw = '0') else mem(to_integer(unsigned(adr)));
	
end architecture;
