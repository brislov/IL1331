library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
		i_bit1  : in std_logic;
		i_bit2  : in std_logic;
		i_carry : in std_logic;
		o_carry : out std_logic;
		o_sum   : out std_logic
	);
end entity;

architecture behavior of full_adder is
	begin
	o_carry <= (i_bit1 and i_bit2) or ((i_bit1 xor i_bit2) and i_carry) after 5 ns;
	o_sum   <= (i_bit1 xor i_bit2) xor i_carry after 5 ns;
end architecture;
