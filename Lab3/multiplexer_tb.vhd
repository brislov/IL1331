library ieee;
use ieee.std_logic_1164.all;
use work.cpu_package.all;


entity multiplexer_tb is 
end entity;


architecture behavior of multiplexer_tb is
	component multiplexer
		port(
			sel       : in std_logic_vector(1 downto 0);	
			data_in_2 : in data_word;
			data_in_1 : in data_bus; -- potiential type problem...
			data_in_0 : in data_word;
			data_out  : out data_word
		);
	end component;
	
	signal sel      : std_logic_vector(1 downto 0) := (others => '0');	
	signal data_in_2 : data_word := (others => '0');
	signal data_in_1 : data_bus := (others => '0'); 
	signal data_in_0 : data_word := (others => '0');
	signal data_out  : data_word;
	
	begin
	UUT: multiplexer port map(sel, data_in_2, data_in_1, data_in_0, data_out);
	
	test: process
		begin
		data_in_2 <= "0100";
		data_in_1 <= "0010";
		data_in_0 <= "0001";	
		
		sel <= "00";
		wait for 10 ns;
		sel <= "01";
		wait for 10 ns;
		sel <= "10";
		wait for 10 ns;
	end process;
end architecture;
