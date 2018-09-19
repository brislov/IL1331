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
	
	signal adr  : address_bus;
	signal data : data_bus := (others => 'Z'); 
	signal clk  : std_logic := '0'; 
	signal ce   : std_logic; 
	signal rw   : std_logic; 
	
	begin
	unit : rw_memory port map(adr, data, clk, ce, rw);
	
	clk <= not clk after 5 ns;
	
	process 
		begin
		
		wait for 10 ns;
		
		-- write 
		ce <= '0';
		rw <= '0';
		adr <= "1100";
		data <= "1100";
		wait for 10 ns;
		
		-- clear 
		ce <= '1';
		data <= "ZZZZ";
		
		wait for 10 ns;
		
		-- write 
		ce <= '0';
		rw <= '0';
		adr <= "0110";
		data <= "0110";
		wait for 10 ns;
		
		-- clear 
		ce <= '1';
		data <= "ZZZZ";
		wait for 10 ns;
		
		-- read 
		ce <= '0';
		rw <= '1';
		adr <= "1100";
		wait for 10 ns;
		
		-- clear 
		ce <= '1';
		data <= "ZZZZ";
		wait for 10 ns;
		
		-- read 
		ce <= '0';
		rw <= '1';
		adr <= "0110";
		wait for 10 ns;
		
		-- to end 
		wait for 100 ns;

	end process;
end architecture;
