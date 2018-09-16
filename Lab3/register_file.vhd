library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cpu_package.all;


entity register_file is 
	port(
		clk        : in std_logic;
		data_in    : in data_word;
		data_out_1 : out data_word;
		data_out_0 : out data_word;
		sel_in     : in std_logic_vector(1 downto 0);
		sel_out_1  : in std_logic_vector(1 downto 0);
		sel_out_0  : in std_logic_vector(1 downto 0);
		rw_reg     : in std_logic
	);
end entity;


architecture rtl of register_file is

	type data_words is array (3 downto 0) of data_word;
	signal r : data_words;
	
	begin	
	process(clk, rw_reg, sel_out_1, sel_out_0)
		begin
		if rising_edge(clk) then
			if rw_reg = '0' then
				-- write
				r(to_integer(unsigned(sel_in))) <= data_in; 
			else	
				-- read 
				data_out_1 <= r(to_integer(unsigned(sel_out_1)));
				data_out_0 <= r(to_integer(unsigned(sel_out_0)));
			end if;
		end if;
	end process;
	
end architecture;
