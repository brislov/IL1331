library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.CPU_Package.all;


entity CPU is 
	port(
		i_clk       : IN std_logic;
		i_data      : IN instruction_bus;
		i_reset     : IN std_logic;
		i_stop      : IN std_logic;
		o_addr      : OUT address_bus;
		o_ROM_en    : OUT std_logic;
		o_RWM_en    : OUT std_logic;
		o_rw_RWM    : OUT std_logic;
		io_RWM_data : INOUT data_bus
	);
end entity;


architecture Structure of CPU is 
	
	component ALU is
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
	end component;
	
	component data_buffer is
		port(
			out_en   : in std_logic;
			data_in  : in data_word;
			data_out : out data_bus
		);
	end component;
	
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
	
	component multiplexer is 
		port(
			sel       : in std_logic_vector(1 downto 0);	
			data_in_2 : in data_word;
			data_in_1 : in data_bus; -- potiential type problem...
			data_in_0 : in data_word;
			data_out  : out data_word
		);
	end component;
	
	component register_file is 
		port(
			clk        : in std_logic;
			data_in    : in data_word;
			data_out_1 : out data_word;
			data_out_0 : out data_word;
			sel_in     : in std_logic_vector(1 downto 0);
			sel_out_1  : in std_logic_vector(1 downto 0);
			sel_out_0  : in std_logic_vector(1 downto 0);
			rw_reg     : in std_logic
		);
	end component;
	
	-- ALU output
	signal w_Y : data_word;
	signal w_Z_FLAG, w_N_FLAG, w_O_FLAG : std_logic;
	
	-- Controller output
	signal w_ALU_EN, w_OUT_EN : std_logic;
	signal w_ALU_OP : unsigned(2 downto 0);
	signal w_DATA_IMM : data_word;
	signal w_SEL_MUX : unsigned(1 downto 0);
	signal w_SEL_IN, w_SEL_OP_0, w_SEL_OP_1 : unsigned(1 downto 0);
	signal w_RW_REG : std_logic;
 
	-- Multiplexer output
	signal w_DATA_OUT : data_word;

	-- Register File output
	signal w_DATA_OUT_0, w_DATA_OUT_1 : data_word;

begin

	ALU_unit : ALU 
		port map(
			op     => std_logic_vector(w_ALU_OP),
			a      => w_DATA_OUT_1,
			b      => w_DATA_OUT_0,
			en     => w_ALU_EN,
			clk    => i_clk,
			y      => w_Y,
			n_flag => w_N_FLAG,
			z_flag => w_Z_FLAG,
			o_flag => w_O_FLAG
		);
	
	Data_Buffer_unit : data_buffer 
		port map(
			out_en   => w_OUT_EN,
			data_in  => w_DATA_OUT_1,
			data_out => io_RWM_data
		);
	
	Controller_unit : Controller 
		port map(
			adr      => o_addr,
			data     => i_data,
			rw_RWM   => o_rw_RWM,
			RWM_en   => o_RWM_en,
			ROM_en   => o_ROM_en,
			clk      => i_clk,
			reset    => i_reset,
			rw_reg   => w_RW_REG,
			sel_op_1 => w_SEL_OP_1,
			sel_op_0 => w_SEL_OP_0,
			sel_in   => w_SEL_IN,
			sel_mux  => w_SEL_MUX,
			alu_op   => w_ALU_OP,
			alu_en   => w_ALU_EN,
			z_flag   => w_Z_FLAG,
			n_flag   => w_N_FLAG,
			o_flag   => w_O_FLAG,
			out_en   => w_OUT_EN,
			data_imm => w_DATA_IMM,
			stop     => i_stop
		);
	
	Multiplexer_unit : multiplexer 
		port map(
			sel       => std_logic_vector(w_SEL_MUX),
			data_in_2 => w_DATA_IMM,
			data_in_1 => io_RWM_data,
			data_in_0 => w_Y,
			data_out  => w_DATA_OUT
		);
	
	Register_File_unit : register_file 
		port map(
			clk        => i_clk,
			data_in    => w_DATA_OUT,
			data_out_1 => w_DATA_OUT_1,
			data_out_0 => w_DATA_OUT_0,
			sel_in     => std_logic_vector(w_SEL_IN),
			sel_out_1  => std_logic_vector(w_SEL_OP_1),
			sel_out_0  => std_logic_vector(w_SEL_OP_0),
			rw_reg     => w_RW_REG
		);

end architecture;
