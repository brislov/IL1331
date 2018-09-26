library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.CPU_Package.all;


entity Nibble_Counter is
	port(
		clk      : in std_logic;
		load_en  : in std_logic; -- active on high
		load_val : in unsigned(operation_size-1 downto 0);
		step     : in std_logic;
		curr_val : out unsigned(operation_size-1 downto 0)
	);
end entity;


architecture RTL of Nibble_Counter is
		
	signal count    : unsigned(operation_size-1 downto 0) := (others => '0');
	signal pre_step : std_logic;
	
begin
	
	process(clk)
		begin 
		if rising_edge(clk) then 
			if (load_en = '1') then
				-- set count to a specific value given by load_val
				count <= load_val;
			elsif (step /= pre_step) then
			   -- increment count if step has changed 
				count <= count + 1;
				pre_step <= step; 
			end if;
		end if;
	end process;
	
	-- set count to output
	curr_val <= count;
	
end architecture;	
	