library ieee;
use ieee.std_logic_1164.all;

entity carry_select_adder is -- 8 bit
	port(
		i_a  : in std_logic_vector(7 downto 0);
		i_b  : in std_logic_vector(7 downto 0);
		i_c0 : in std_logic;
	   o_s  : out std_logic_vector(7 downto 0);
		o_c8 : out std_logic
	);
end entity;

architecture behavior of carry_select_adder is
	component ripple_carry_adder
		port(
			i_num1 : in std_logic_vector(3 downto 0); 
			i_num2 : in std_logic_vector(3 downto 0);
			i_cin  : in std_logic;
			o_cout : out std_logic;
			o_sum  : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component mux2_1
		port(
			i_bit1 : in std_logic;
			i_bit2 : in std_logic;
			i_sel  : in std_logic;
			o_out  : out std_logic
		);
	end component;
	
	signal w_c4, w_c5, w_c6, w_c56 : std_logic;
	signal w_temp0, w_temp1 : std_logic_vector(3 downto 0);
	
	begin
	RCA1: ripple_carry_adder port map(i_a(3 downto 0), i_b(3 downto 0), i_c0, w_c4, o_s(3 downto 0));
	RCA2: ripple_carry_adder port map(i_a(7 downto 4), i_b(7 downto 4), '0', w_c5, w_temp0);
	RCA3: ripple_carry_adder port map(i_a(7 downto 4), i_b(7 downto 4), '1', w_c6, w_temp1);
	
	generate_multiplexors:
		for i in 0 to 3 generate
			Mx: mux2_1 port map(w_temp0(i), w_temp1(i), w_c4, o_s(i+4));
		end generate;
	
	-- carry out from entity
	w_c56 <= w_c4 or w_c5 after 3 ns; 
	o_c8  <= w_c6 and w_c56 after 3 ns;
	
end architecture;
	