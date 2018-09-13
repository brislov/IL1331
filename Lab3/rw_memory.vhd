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
type data_bus_array is array (14 downto 0) of data_bus;
signal data_buses: data_bus_array;
begin
	process(adr, data, clk, ce, rw)
		begin
		if ce = '1' then
			data <= "ZZZZ";
		else
			if rw = '0' and rising_edge(clk) then
				data_buses(to_integer(unsigned(adr))) <= data;
			else
				data <= data_buses(to_integer(unsigned(adr)));
			end if;
		end if;
	end process;
end architecture;
