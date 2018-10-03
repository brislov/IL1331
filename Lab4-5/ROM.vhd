library IEEE;
use IEEE.std_logic_1164.all;
use work.CPU_Package.all;


entity ROM is -- Read Only Memory
	port(
		adr  : in address_bus;
		data : out instruction_bus;
		ce   : in std_logic
	);
end entity;


architecture RTL of ROM is
begin
	process(ce, adr)
	begin
		if ce = '0' then
			case adr is
				when "0000" => data <= "1010110011"; -- LDI R3,  3
				when "0001" => data <= "1001111110"; -- STR R3, 14
				when "0010" => data <= "1010010001"; -- LDI R1,  1
				when "0011" => data <= "1000001110"; -- LDR R0, 14
				when "0100" => data <= "0110000010"; -- MOV r0, R2
				when "0101" => data <= "0000100110"; -- ADD R2, R1, R2
				when "0110" => data <= "0001000100"; -- SUB R0, R1, R0
				when "0111" => data <= "1100001100"; -- BRZ 12
				when "1000" => data <= "1011000000"; -- NOP
				when "1001" => data <= "1111000101"; -- BRA 5
				when "1100" => data <= "1001101111"; -- STR R2, 15
				when "1101" => data <= "1111001101"; -- BRA 13
				when others => data <= "1011000000"; -- NOP
			end case;
		else
			data <= "ZZZZZZZZZZ";
		end if;
	end process;
end architecture;
