library ieee;
use ieee.std_logic_1164.all;
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

	signal r0, r1, r2, r3 : data_word := (others => '0');

	begin	
	process(clk, rw_reg, sel_out_1, sel_out_0)
		begin
		if rising_edge(clk) then
			if rw_reg = '0' then	-- write
				case sel_in is 
					when "00" => r0 <= data_in;
					when "01" => r1 <= data_in;
					when "10" => r2 <= data_in;
					when "11" => r3 <= data_in;
					when others => null;
				end case;
			else	-- read 
				case sel_out_1 is
					when "00" => data_out_1 <= r0;
					when "01" => data_out_1 <= r1;
					when "10" => data_out_1 <= r2;
					when "11" => data_out_1 <= r3;
					when others => null;
				end case;
				case sel_out_0 is
					when "00" => data_out_0 <= r0;
					when "01" => data_out_0 <= r1;
					when "10" => data_out_0 <= r2;
					when "11" => data_out_0 <= r3;
					when others => null;
				end case;
			end if;
		end if;
	end process;
end architecture;
