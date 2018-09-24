library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cpu_package.all; 


entity controller is
	port( 
		adr      : out address_bus; -- unsigned
		data     : in program_word; -- unsigned
		rw_RWM   : out std_logic;   -- read on high
		RWM_en   : out std_logic;   -- active low
		ROM_en   : out std_logic;   -- active low
		clk      : in std_logic;
		reset    : in std_logic;    -- active high
		rw_reg   : out std_logic;   -- read on high
		sel_op_1 : out unsigned(1 downto 0);
		sel_op_0 : out unsigned(1 downto 0);
		sel_in   : out unsigned(1 downto 0);
		sel_mux  : out unsigned(1 downto 0);
		alu_op   : out unsigned(2 downto 0);
		alu_en   : out std_logic;   -- active high
		z_flag   : in std_logic;    -- active high
		n_flag   : in std_logic;    -- active high
		o_flag   : in std_logic;    -- active high
		out_en   : out std_logic;   -- active high
		data_imm : out data_word    -- signed
	); 
end entity;


architecture rtl of controller is
	component counter is
		port(
			step    : in std_logic;
			clk     : in std_logic;
			counter : out std_logic_vector(operation_size-1 downto 0);
			display : out std_logic_vector(6 downto 0)
		);
	end component;
	
	alias op : data(8 downto 6); 
	alias r1 : instr(8 downto 6);
	alias r2 : instr(5 downto 4);
	alias r3 : instr(3 downto 2);
	alias sel_in   <= instr(1 downto 0);
	
	begin
	
	process(clk)
		begin
		if rising_edge(clk) then
			alu_op   <= instr(8 downto 6);
			sel_op_1 <= instr(5 downto 4);
			sel_op_0 <= instr(3 downto 2);
			sel_in   <= instr(1 downto 0);
	
end architecture;
