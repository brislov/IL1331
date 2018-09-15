library ieee;
use ieee.std_logic_1164.all;

entity carry_lookahead_adder_tb is
end entity;

architecture behavior of carry_lookahead_adder_tb is
	component carry_lookahead_adder
		port(
			i_num1   : in std_logic_vector(3 downto 0);
			i_num2   : in std_logic_vector(3 downto 0);
			i_cin    : in std_logic;
			o_cout   : out std_logic;
			o_result : out std_logic_vector(3 downto 0)
		);
	end component;
	
	signal s_num1, s_num2 : std_logic_vector(3 downto 0);
	signal s_cin, s_cout  : std_logic;
	signal s_result          : std_logic_vector(3 downto 0);
	
	begin
	UUT: carry_lookahead_adder port map(s_num1, s_num2, s_cin, s_cout, s_result);
	
	test: process
		begin
		s_cin  <= '0';
		s_num1 <= "0000";
		s_num2 <= "0000";
		wait for 100 ns;
		s_cin  <= '0';
		s_num1 <= "0001";
		s_num2 <= "0001";
		wait for 100 ns;
		s_cin  <= '1';
		s_num1 <= "0000";
		s_num2 <= "0000";
		wait for 100 ns;
		s_cin  <= '0';
		s_num1 <= "0110";
		s_num2 <= "1100";
		wait for 100 ns;
		s_cin  <= '0';
		s_num1 <= "1111";
		s_num2 <= "1100";
		wait for 100 ns;
		s_cin  <= '0';
		s_num1 <= "0110";
		s_num2 <= "0111";
		wait for 100 ns;
		s_cin  <= '0';
		s_num1 <= "0110";
		s_num2 <= "1110";
		wait for 100 ns;
		s_cin  <= '0';
		s_num1 <= "0000";
		s_num2 <= "0000";
		wait for 100 ns;
		s_cin  <= '0';
		s_num1 <= "1111";
		s_num2 <= "1111";
		wait for 100 ns;
		wait;
	end process;
end architecture;
