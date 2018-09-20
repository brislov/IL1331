library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.cpu_package.all;


entity counter is
	port(
		step : in std_logic;
		clk  : in std_logic;
		x    : out std_logic_vector(operation_size-1 downto 0)
	);
end entity;


architecture struct of counter is 

	constant c    : std_logic_vector(operation_size-1 downto 0) := (0 => '1', others => '0'); -- +1
	signal member : std_logic_vector(operation_size-1 downto 0) := (others => '0');
	signal temp : std_logic;
	
	begin
	
	process(clk, step)
		begin
		if rising_edge(clk) then 
			if step /= temp then
				member <= member + c;
				temp <= step;
				x <= member; 
			end if;
		end if;
	end process; 

end architecture;
