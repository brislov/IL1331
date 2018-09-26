library IEEE;
use IEEE.std_logic_1164.all;
use work.CPU_package.all;


entity ALU is
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
end entity;


architecture behavioral of ALU is

	constant ZERO : std_logic_vector(data_size downto 0) := (others => '0');
	  
	begin
	process(op, a, b, en, clk) 
		variable temp : std_logic_vector(data_size downto 0);
		begin
		if en = '1' and rising_edge(clk) then
			case op is  
				when "000" =>  
					temp := add_overflow(a, b);
					y <= temp(temp'left-1 downto 0);
				when "001" =>
					temp := sub_overflow(a, b);
					y <= temp(temp'left-1 downto 0);
				when "010" =>  y <= a and b;   
				when "011" =>  y <= a or b;   
				when "100" =>  y <= a xor b;   
				when "101" =>  y <= not a;
				when "110" =>  y <= a;
				when others => NULL;
			end case;
			n_flag <= temp(temp'left-1);
			if temp = ZERO then z_flag <= '1'; else z_flag <= '0'; end if;
			o_flag <= temp(temp'left) xor temp(temp'left-1) xor a(a'left) xor b(b'left);
		end if;
	end process; 
end behavioral;
