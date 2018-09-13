library ieee;
use ieee.std_logic_1164.all;
use work.cpu_package.all;


entity data_buffer_tb is
end entity;

architecture behavior of data_buffer_tb is 
	component data_buffer
		port(
			out_en   : in std_logic;
			data_in  : in data_word;
			data_out : out data_bus 
		);
	end component;
	
	signal out_en   : std_logic := '0';
	signal data_in  : data_word := (others => '0');
	signal data_out : data_bus := (others => '0'); 
	
	begin
	UUT: data_buffer port map(out_en, data_in, data_out);
	
	test: process
		begin
		data_in <= "0101";
		wait for 10 ns;
		out_en <= '1';
		wait for 10 ns;
	end process;
end architecture;
