library ieee;
use ieee.std_logic_1164.all;

entity carry_lookahead_adder is
	port(
		i_num1   : in std_logic_vector(3 downto 0);
		i_num2   : in std_logic_vector(3 downto 0);
		i_cin    : in std_logic;
		o_cout   : out std_logic;
		o_result : out std_logic_vector(3 downto 0)
	);
end entity;

architecture behavior of carry_lookahead_adder is
	component full_adder
		port(
			i_bit1  : in std_logic;
			i_bit2  : in std_logic;
			i_carry : in std_logic;
			o_carry : out std_logic;
			o_sum   : out std_logic
		);
	end component;
	
	signal w_c :  std_logic_vector(4 downto 0); -- carry
	signal w_g, w_p : std_logic_vector(3 downto 0); -- generate, propagate
	
	begin
	
	w_c(0) <= i_cin;
	o_cout <= w_c(4);
	
	generate_full_adders:
		for i in 0 to 3 generate
			FAx: full_adder port map(i_num1(i), i_num2(i), w_c(i), open, o_result(i));
			
			w_g(i)   <= i_num1(i) and i_num2(i);       -- generate (Gi=Ai*Bi)
			w_p(i)   <= i_num1(i) or i_num2(i);        -- propagate (Pi=Ai+Bi)
			w_c(i+1) <= w_g(i) or (w_c(i) and w_p(i)); -- carry (C(i+1)=Gi+(Ci*Pi))
		end generate;
end architecture;
	