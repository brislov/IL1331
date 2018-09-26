library ieee;
use ieee.std_logic_1164.all;

entity mux2_1_tb is
end entity;

architecture behavior of mux2_1_tb is
	component mux2_1
		port(
			i_bit1 : in std_logic;
			i_bit2 : in std_logic;
			i_sel  : in std_logic;
			o_out  : out std_logic
		);
	end component;
	
	signal s_bit1, s_bit2, s_sel, s_out : std_logic;
	
	begin
	UUT: mux2_1 port map(s_bit1, s_bit2, s_sel, s_out);
	
	test: process
		begin
		s_sel  <= '0';
		s_bit1 <= '0';
		s_bit2 <= '1';
		wait for 10 ns;
		s_sel  <= '1';
		s_bit1 <= '0';
		s_bit2 <= '1';
		wait for 10 ns;
		wait;
	end process;
end behavior;
		