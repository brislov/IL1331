library IEEE;
use IEEE.std_logic_1164.all;
use work.all;
use work.CPU_Package.all;


entity Enchip is
	port(
		i_clk    : in std_logic;
		i_choice : in std_logic; -- address(0) or data(1)
		i_reset  : in std_logic; -- active high
		i_stop   : in std_logic; -- stops statemachine
		o_output : out std_logic_vector(3 downto 0)
	);
end entity;


architecture Structure of Enchip is

	component CPU is 
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
	
	-- CPU output 
	signal w_addr : address_bus;
	signal w_ROM_en, w_RWM_en, w_RWM_rw : std_logic;
	
	-- ROM output
	signal w_ROM_DATA : instruction_bus;
	
	-- RWM output
	signal w_RWM_DATA : data_bus;

begin

	CPU_unit : CPU 
		port map(
			i_clk       => i_clk, 
			i_data      => w_ROM_DATA,
			i_reset     => i_reset, 
			i_stop      => i_stop,
			o_addr      => w_addr,
			o_ROM_en    => w_ROM_en,
			o_RWM_en    => w_RWM_en,
			o_rw_RWM    => w_RWM_rw,
			io_RWM_data => w_RWM_DATA
		);
		
	ROM_unit : ROM
		port map(
			adr  => w_addr,
			data => w_ROM_DATA,
			ce   => w_ROM_en
		);
		
	RWM_unit : RWM
		port map(
			adr  => w_addr,
			data => w_RWM_DATA,
			clk  => i_clk,
			ce   => w_RWM_en,
			rw   => w_RWM_rw
		);
	
	o_output <= w_addr when(i_choice = '0') else w_RWM_DATA;

end architecture;
