library ieee;
use ieee.std_logic_1164.all;

entity carry_select_adder_tb is
end entity;

architecture behavior of carry_select_adder_tb is
	component carry_select_adder
		port(
			i_a  : in std_logic_vector(7 downto 0);
			i_b  : in std_logic_vector(7 downto 0);
			i_c0 : in std_logic;
			o_s  : out std_logic_vector(7 downto 0);
			o_c8 : out std_logic
		);
	end component;
	
	signal s_a, s_b : std_logic_vector(7 downto 0);
	signal s_c0     : std_logic;
	signal s_s      : std_logic_vector(7 downto 0);
	signal s_c8     : std_logic;
	
	begin
	UUT: carry_select_adder port map(s_a, s_b, s_c0, s_s, s_c8);
	
	test: process 
		begin
		s_c0 <= '0';
		s_a  <= "00000000";
		s_b  <= "00000000";
		wait for 100 ns;
		s_c0 <= '1';
		s_a  <= "00000000";
		s_b  <= "00000000";
		wait for 100 ns;
		s_c0 <= '0';
		s_a  <= "00000001";
		s_b  <= "00000001";
		wait for 100 ns;
		s_c0 <= '0';
		s_a  <= "00000010";
		s_b  <= "00000010";
		wait for 100 ns;
		s_c0 <= '0';
		s_a  <= "00110011";
		s_b  <= "00001110";
		wait for 100 ns;
		s_c0 <= '0';
		s_a  <= "11111111";
		s_b  <= "11111111";
		wait for 100 ns;
		s_c0 <= '0';
		s_a  <= "10000000";
		s_b  <= "10000000";
		wait for 100 ns;
		s_c0 <= '0';
		s_a  <= "00000000";
		s_b  <= "00000000";
		wait for 100 ns;
		s_c0 <= '0';
		s_a  <= "11111111";
		s_b  <= "11111111";
		wait for 100 ns;
		wait;
	end process;
end architecture;
		