library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.CPU_Package.all;


entity Controller_TB is
end entity;


architecture Testbench of Controller_TB is
	
	component Controller is
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
			data_imm : out data_word;   -- signed
			step     : in std_logic;
			stop     : in std_logic
		); 
	end component;
	
	component ROM is 
		port(
			adr  : in address_bus;
			data : out instruction_bus;
			ce   : in std_logic
		);
	end component;
	
	component RWM is
		port(
			adr  : in address_bus;
			data : inout data_bus;
			clk  : in std_logic;
			ce   : in std_logic;
			rw   : in std_logic
		);
	end component;
	
	signal adr      : address_bus; 
	signal data     : program_word;
	signal rw_RWM   : std_logic;
	signal RWM_en   : std_logic;
	signal ROM_en   : std_logic;
	signal clk      : std_logic := '0';
	signal reset    : std_logic := '1';
	signal RW_reg   : std_logic;
	signal sel_op_1 : unsigned(1 downto 0);
	signal sel_op_0 : unsigned(1 downto 0);
	signal sel_in   : unsigned(1 downto 0);
	signal sel_mux  : unsigned(1 downto 0);
	signal alu_op   : unsigned(2 downto 0);
	signal alu_en   : std_logic;
	signal z_flag   : std_logic;
	signal n_flag   : std_logic;
	signal o_flag   : std_logic;
	signal out_en   : std_logic;
	signal data_imm : data_word;
	signal step     : std_logic := '0';
	signal stop     : std_logic := '0';
	
	begin
	
	ROM_unit : ROM port map(adr, data, ROM_en);
	
	UUT : Controller port map(adr, data, RW_RWM, RWM_en, ROM_en, clk, reset, RW_reg, sel_op_1, sel_op_0, sel_in, sel_mux, alu_op, alu_en, z_flag, n_flag, o_flag, out_en, data_imm, step, stop);
	
	clk  <= NOT clk after 5 ns;
	step <= NOT step after 20 ns;
	
	process
	begin
		wait for 10 ns;
		reset <= '0';
	end process;
	
end architecture;