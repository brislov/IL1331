library ieee;
use ieee.std_logic_1164.all;
use work.cpu_package.all;


entity data_buffer is
	port(
		out_en   : in std_logic;
		data_in  : in data_word;
		data_out : out data_bus
	);
end entity;


architecture rtl of data_buffer is
	begin
	process(out_en, data_in)
		begin
		if out_en = '1' then
			data_out <= data_in;
		else
			data_out <= "ZZZZ";
		end if;
	end process;
end architecture;
