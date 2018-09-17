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
	signal data_out : data_bus; 
	
	begin
	unit: data_buffer port map(out_en, data_in, data_out);

	out_en <= not out_en after 10 ns;

end architecture;
