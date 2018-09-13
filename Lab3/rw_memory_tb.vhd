library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cpu_package.all;


entity rw_memory_tb is
end entity;


architecture behavior of rw_memory_tb is
	component rw_memory
		port(
			adr  : in address_bus;
			data : inout data_bus;
			clk  : in std_logic;
			ce   : in std_logic;
			rw   : in std_logic
		);
	end component;
	signal adr  : address_bus := (others => '0');
	signal data : data_bus := (others => '0');
	signal clk  : std_logic := '0';
	signal ce   : std_logic := '0';
	signal rw   : std_logic := '0';
	begin
	uut: rw_memory port map(adr, data, clk, ce, rw);
	clk <= not clk after 5 ns;
	ce <= not(ce)	 after 40ns;
	adr <= address_bus(to_unsigned(to_integer(unsigned(adr)) + 1, adr'length)) after 5ns;
end architecture;
