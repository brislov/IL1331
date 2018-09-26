library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is 
end entity;

architecture behavior of full_adder_tb is
	component full_adder
		port(
			i_bit1  : in std_logic;
			i_bit2  : in std_logic;
			i_carry : in std_logic;
			o_carry : out std_logic;
			o_sum   : out std_logic
		);
	end component;
	
	signal s_bit1, s_bit2, s_carry_in, s_carry_out, s_sum : std_logic;
	
	begin
	UUT: full_adder port map(s_bit1, s_bit2, s_carry_in, s_carry_out, s_sum);
	
	input: process
		begin
		s_bit1 <= '0';
		s_bit2 <= '0';
		s_carry_in <= '0';
		wait for 10 ns;
		s_bit1 <= '0';
		s_bit2 <= '0';
		s_carry_in <= '1';
		wait for 10 ns;
		s_bit1 <= '0';
		s_bit2 <= '1';
		s_carry_in <= '0';
		wait for 10 ns;
		s_bit1 <= '0';
		s_bit2 <= '1';
		s_carry_in <= '1';
		wait for 10 ns;
		s_bit1 <= '1';
		s_bit2 <= '0';
		s_carry_in <= '0';
		wait for 10 ns;
		s_bit1 <= '1';
		s_bit2 <= '0';
		s_carry_in <= '1';
		wait for 10 ns;
		s_bit1 <= '1';
		s_bit2 <= '1';
		s_carry_in <= '0';
		wait for 10 ns;
		s_bit1 <= '1';
		s_bit2 <= '1';
		s_carry_in <= '1';
		wait for 10 ns;
		wait;
	end process;
end architecture;
