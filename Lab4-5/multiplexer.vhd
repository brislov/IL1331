library ieee;
use ieee.std_logic_1164.all;
use work.cpu_package.all;


entity multiplexer is 
	port(
		sel       : in std_logic_vector(1 downto 0);	
		data_in_2 : in data_word;
		data_in_1 : in data_bus; -- potiential type problem...
		data_in_0 : in data_word;
		data_out  : out data_word
	);
end entity;


architecture rtl of multiplexer is
	begin
	process(sel, data_in_2, data_in_1)
		begin
		case sel is
			when "00" => data_out <= data_in_0;
			when "01" => data_out <= data_in_1;
			when "10" => data_out <= data_in_2;
			when others => null;
		end case;
	end process;
end architecture;
