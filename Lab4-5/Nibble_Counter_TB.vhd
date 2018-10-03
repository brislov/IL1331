library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.all;
use work.CPU_Package.all;


entity Nibble_Counter_TB is
end entity;


architecture Testbench of Nibble_Counter_TB is

	component Nibble_counter is
		port(
			clk      : in std_logic;
			load_en  : in std_logic; -- active on high
			load_val : in unsigned(operation_size-1 downto 0);
			step     : in std_logic;
			curr_val : out unsigned(operation_size-1 downto 0)
		);
	end component;
	
	signal clk      : std_logic := '0';
	signal load_en  : std_logic := '0';
	signal load_val : unsigned(operation_size-1 downto 0);
	signal step     : std_logic := '0';
	signal curr_val : unsigned(operation_size-1 downto 0);
	
begin

	UUT : Nibble_counter port map(clk, load_en, load_val, step, curr_val);
	
	clk  <= not clk after 50 ns; -- 50 MHz clock
	--step <= not step after 1 us;
	
	process 
	begin
		wait for 1 us;
		step <= NOT step;
		wait for 400 ns;
	end process;
	
end architecture;