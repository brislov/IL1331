library IEEE;
use IEEE.std_logic_1164.all;
use work.CPU_package.all;


entity ALU_TB is
end entity;


architecture behavior of ALU_TB is
	
	component ALU
		port(
			op    : in std_logic_vector(2 downto 0);
			a     : IN data_word;       
			b     : IN data_word;
			en    : IN std_logic;
			clk   : IN std_logic;
			y     : OUT data_word;
			n_flag: OUT std_logic;
			z_flag: OUT std_logic;
			o_flag: OUT std_logic
		);
	end component;
	
	signal s_op : std_logic_vector(2 downto 0):= (others => '0');
	signal s_a, s_b : data_word := (others => '0');
	signal s_en : std_logic := '1';
	signal s_clk : std_logic := '0';
	signal s_y : data_word;
	signal s_n_flag, s_z_flag, s_o_flag : std_logic;
	
	begin
	
	UUT: ALU port map(s_op, s_a, s_b, s_en, s_clk, s_y, s_n_flag, s_z_flag, s_o_flag);
	
	s_op(0) <= not s_op(0) after 160 ns;
	s_clk <= not s_clk after 5 ns;
	
	s_a(0) <= not s_a(0) after 10 ns;
	s_a(1) <= not s_a(1) after 20 ns;
	s_a(2) <= not s_a(2) after 40 ns;
	s_a(3) <= not s_a(3) after 80 ns;
	
	s_b(0) <= not s_b(0) after 80 ns;
	s_b(1) <= not s_b(1) after 10 ns;
	s_b(2) <= not s_b(2) after 20 ns;	
	s_b(3) <= not s_b(3) after 40 ns;
	
end architecture;
	