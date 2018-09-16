library ieee;
use ieee.std_logic_1164.all;
use work.cpu_package.all;


entity register_file_tb is 
end entity;


architecture behavior of register_file_tb is
	component register_file
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
	end component;
	
	signal clk : std_logic := '0';
	signal data_in, data_out_1, data_out_0 : data_word;
	signal sel_in     : std_logic_vector(1 downto 0);
	signal sel_out_1  : std_logic_vector(1 downto 0);
	signal sel_out_0  : std_logic_vector(1 downto 0);
	signal rw_reg     : std_logic;
	
	begin
	unit: register_file port map(clk, data_in, data_out_1, data_out_0, sel_in, sel_out_1, sel_out_0, rw_reg);
	
	clk <= not clk after 1 ns;
	
	test: process
		begin
		
		-- write
		sel_in <= "00";
		data_in <= "0000";
		rw_reg <= '0';
		wait for 10 ns;
		sel_in <= "01";
		data_in <= "0001";
		rw_reg <= '0';
		wait for 10 ns;
		sel_in <= "10";
		data_in <= "0010";
		rw_reg <= '0';
		wait for 10 ns;
		sel_in <= "11";
		data_in <= "0011";
		rw_reg <= '0';
		wait for 10 ns;
		
		-- read 
		rw_reg <= '1';
		sel_out_1 <= "00";
		sel_out_0 <= "00";
		wait for 10 ns;
		sel_out_1 <= "01";
		sel_out_0 <= "01";
		wait for 10 ns;
		sel_out_1 <= "10";
		sel_out_0 <= "10";
		wait for 10 ns;
		sel_out_1 <= "11";
		sel_out_0 <= "11";
		wait for 10 ns;
		
	end process;
	
end architecture;
	