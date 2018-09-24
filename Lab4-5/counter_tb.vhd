library ieee;
use ieee.std_logic_1164.all;

use work.cpu_package.all;


entity counter_tb is
end entity;


architecture testbench of counter_tb is

	component counter
		port(
			step    : in std_logic;
			clk     : in std_logic;
			counter : out std_logic_vector(operation_size-1 downto 0);
			display : out std_logic_vector(6 downto 0)
		);
	end component;
	
	signal step    : std_logic := '0';
	signal clk     : std_logic := '0';
	signal count   : std_logic_vector(operation_size-1 downto 0);
	signal display : std_logic_vector(6 downto 0);
	
	begin

	unit : counter port map(step, clk, reset, count, display);
	
	clk   <= not clk after 1 ns;
	step  <= not step after 10 ns;
	
end architecture;