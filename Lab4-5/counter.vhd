library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.cpu_package.all;


entity counter is
	port(
		step    : in std_logic;
		clk     : in std_logic;
		counter : out std_logic_vector(operation_size-1 downto 0);
		display : out std_logic_vector(6 downto 0)
	);
end entity;


architecture rtl of counter is 

	constant c     : std_logic_vector(operation_size-1 downto 0) := (0 => '1', others => '0'); -- +1
	signal member  : std_logic_vector(operation_size-1 downto 0) := (others => '0');
	signal preStep : std_logic;
	
	begin
	
	process(clk, step)
		begin
		if rising_edge(clk) then 
			if step /= preStep then
				member  <= member + c;
				preStep <= step;
				counter <= member; 
			end if;
		end if;
	end process;
	
	process(member)
	begin
		 case member is
		 when "0000" => display <= "0000001"; -- "0"     
		 when "0001" => display <= "1001111"; -- "1" 
		 when "0010" => display <= "0010010"; -- "2" 
		 when "0011" => display <= "0000110"; -- "3" 
		 when "0100" => display <= "1001100"; -- "4" 
		 when "0101" => display <= "0100100"; -- "5" 
		 when "0110" => display <= "0100000"; -- "6" 
		 when "0111" => display <= "0001111"; -- "7" 
		 when "1000" => display <= "0000000"; -- "8"     
		 when "1001" => display <= "0000100"; -- "9" 
		 when "1010" => display <= "0000010"; -- A
		 when "1011" => display <= "1100000"; -- B
		 when "1100" => display <= "0110001"; -- C
		 when "1101" => display <= "1000010"; -- D
		 when "1110" => display <= "0110000"; -- E
		 when "1111" => display <= "0111000"; -- F
		 when others => null;
		 end case;
	end process;

end architecture;
