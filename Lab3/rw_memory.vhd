library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cpu_package.all;


entity rw_memory is
	port(
		adr  : in address_bus;
		data : inout data_bus;
		clk  : in std_logic;
		ce   : in std_logic;
		rw   : in std_logic
	);
end entity;


architecture rtl of rw_memory is
	
	type data_buses is array (15 downto 0) of std_logic_vector(3 downto 0);
	signal mem : data_buses;
	
	begin
	
	process(clk)
	begin
		if rising_edge(clk) then
			if (ce = '0' and rw = '0') then
				-- write to memory
				mem(to_integer(unsigned(adr))) <= data;
			end if;
		end if;
	end process;
	-- read from memory or set data to high impedance 
	data <= mem(to_integer(unsigned(adr))) when (ce = '0' and rw = '1') else (others =>'Z');
	
end architecture;
