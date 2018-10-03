library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.all;
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
	
	signal w_adr      : address_bus; 
	signal w_ROM_data : program_word;
	signal w_rw_RWM   : std_logic;
	signal w_RWM_en   : std_logic;
	signal w_ROM_en   : std_logic;
	signal r_clk      : std_logic := '0';
	signal r_reset    : std_logic := '1';
	signal w_RW_reg   : std_logic;
	signal w_sel_op_1 : unsigned(1 downto 0);
	signal w_sel_op_0 : unsigned(1 downto 0);
	signal w_sel_in   : unsigned(1 downto 0);
	signal w_sel_mux  : unsigned(1 downto 0);
	signal w_alu_op   : unsigned(2 downto 0);
	signal w_alu_en   : std_logic;
	signal w_z_flag   : std_logic;
	signal w_n_flag   : std_logic;
	signal w_o_flag   : std_logic;
	signal w_out_en   : std_logic;
	signal w_data_imm : data_word;
	signal r_stop     : std_logic := '0';
	
begin
	
	ROM_unit : ROM 
		port map(
			adr  => w_adr,
			data => w_ROM_data,
			ce   => w_ROM_en
		);
	
	UUT : Controller
		port map( 
			adr      => w_adr,
			data     => w_ROM_data,
			rw_RWM   => w_rw_RWM,
			RWM_en   => w_RWM_en,
			ROM_en   => w_ROM_en,
			clk      => r_clk,
			reset    => r_reset,
			rw_reg   => w_rw_reg,
			sel_op_1 => w_sel_op_1,
			sel_op_0 => w_sel_op_0,
			sel_in   => w_sel_in,
			sel_mux  => w_sel_mux,
			alu_op   => w_alu_op,
			alu_en   => w_alu_en,
			z_flag   => w_z_flag,
			n_flag   => w_n_flag,
			o_flag   => w_o_flag,
			out_en   => w_out_en,
			data_imm => w_data_imm,
			stop     => r_stop
		);
		
		r_clk <= NOT r_clk after 20 ns; -- 50 Mhz
		
		process
		begin 
			wait for 100 ns;
			r_reset <= '0';
			wait for 999 ms;
		end process;
	
end architecture;