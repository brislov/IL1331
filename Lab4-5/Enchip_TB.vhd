library IEEE;
use IEEE.std_logic_1164.all;
use work.all;
use work.CPU_Package.all;


entity Enchip_TB is
end entity;


architecture testbench of Enchip_TB is

	component Enchip is
		port(
			i_clk    : in std_logic;
			i_choice : in std_logic; -- address(0) or data(1)
			i_reset  : in std_logic; -- active high
			i_stop   : in std_logic; -- stops statemachine
			o_output : out std_logic_vector(3 downto 0)
		);
	end component;

	signal r_clk    : std_logic := '0';
	signal r_choice : std_logic := '0'; -- w_addr when(choice = '0') else w_RWM_DATA;
	signal r_reset  : std_logic := '0'; -- active high
	signal r_stop   : std_logic := '0'; -- stops statemachine, active high 
	signal s_output : std_logic_vector(3 downto 0);

begin

	UUT : Enchip port map(r_clk, r_choice, r_reset, r_stop, s_output);
	
	r_clk <= NOT r_clk after 20 ns; -- 50 MHz
	
	process
	begin
		wait for 500 ns;
		r_stop <= '1';
		wait for 500 ns;
		r_stop <= '0';
		wait for 3000 ns; 
		r_reset <= '1';
		r_choice <= '1';
		wait for 100 ns;
		r_reset <= '0';
	end process; 
	
end architecture;
