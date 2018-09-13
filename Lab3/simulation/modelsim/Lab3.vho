-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "09/13/2018 14:20:13"

-- 
-- Device: Altera EP3C16E144C7 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	register_file IS
    PORT (
	clk : IN std_logic;
	data_in : IN std_logic_vector(3 DOWNTO 0);
	data_out_1 : OUT std_logic_vector(3 DOWNTO 0);
	data_out_0 : OUT std_logic_vector(3 DOWNTO 0);
	sel_in : IN std_logic_vector(1 DOWNTO 0);
	sel_out_1 : IN std_logic_vector(1 DOWNTO 0);
	sel_out_0 : IN std_logic_vector(1 DOWNTO 0);
	rw_reg : IN std_logic
	);
END register_file;

-- Design Ports Information
-- data_out_1[0]	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_1[1]	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_1[2]	=>  Location: PIN_10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_1[3]	=>  Location: PIN_142,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_0[0]	=>  Location: PIN_4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_0[1]	=>  Location: PIN_39,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_0[2]	=>  Location: PIN_141,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_out_0[3]	=>  Location: PIN_7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_out_1[1]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_out_1[0]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rw_reg	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_out_0[1]	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_out_0[0]	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[0]	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_in[1]	=>  Location: PIN_42,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_in[0]	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[1]	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[2]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in[3]	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF register_file IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_data_in : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_data_out_1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_data_out_0 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_sel_in : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_sel_out_1 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_sel_out_0 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_rw_reg : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sel_out_0[1]~input_o\ : std_logic;
SIGNAL \r1[3]~feeder_combout\ : std_logic;
SIGNAL \data_out_1[0]~output_o\ : std_logic;
SIGNAL \data_out_1[1]~output_o\ : std_logic;
SIGNAL \data_out_1[2]~output_o\ : std_logic;
SIGNAL \data_out_1[3]~output_o\ : std_logic;
SIGNAL \data_out_0[0]~output_o\ : std_logic;
SIGNAL \data_out_0[1]~output_o\ : std_logic;
SIGNAL \data_out_0[2]~output_o\ : std_logic;
SIGNAL \data_out_0[3]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \data_in[0]~input_o\ : std_logic;
SIGNAL \r3[0]~feeder_combout\ : std_logic;
SIGNAL \sel_in[1]~input_o\ : std_logic;
SIGNAL \sel_in[0]~input_o\ : std_logic;
SIGNAL \Mux11~2_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \sel_out_1[1]~input_o\ : std_logic;
SIGNAL \r0[0]~feeder_combout\ : std_logic;
SIGNAL \r0[0]~0_combout\ : std_logic;
SIGNAL \Mux11~1_combout\ : std_logic;
SIGNAL \Mux19~0_combout\ : std_logic;
SIGNAL \Mux19~1_combout\ : std_logic;
SIGNAL \rw_reg~input_o\ : std_logic;
SIGNAL \data_out_1[0]~reg0_q\ : std_logic;
SIGNAL \data_in[1]~input_o\ : std_logic;
SIGNAL \r1[1]~feeder_combout\ : std_logic;
SIGNAL \r3[1]~feeder_combout\ : std_logic;
SIGNAL \r2[1]~feeder_combout\ : std_logic;
SIGNAL \Mux18~0_combout\ : std_logic;
SIGNAL \Mux18~1_combout\ : std_logic;
SIGNAL \data_out_1[1]~reg0_q\ : std_logic;
SIGNAL \data_in[2]~input_o\ : std_logic;
SIGNAL \Mux17~0_combout\ : std_logic;
SIGNAL \Mux17~1_combout\ : std_logic;
SIGNAL \data_out_1[2]~reg0_q\ : std_logic;
SIGNAL \sel_out_1[0]~input_o\ : std_logic;
SIGNAL \data_in[3]~input_o\ : std_logic;
SIGNAL \r3[3]~feeder_combout\ : std_logic;
SIGNAL \r2[3]~feeder_combout\ : std_logic;
SIGNAL \Mux16~0_combout\ : std_logic;
SIGNAL \Mux16~1_combout\ : std_logic;
SIGNAL \data_out_1[3]~reg0_q\ : std_logic;
SIGNAL \sel_out_0[0]~input_o\ : std_logic;
SIGNAL \Mux23~0_combout\ : std_logic;
SIGNAL \Mux23~1_combout\ : std_logic;
SIGNAL \data_out_0[0]~reg0_q\ : std_logic;
SIGNAL \Mux22~0_combout\ : std_logic;
SIGNAL \Mux22~1_combout\ : std_logic;
SIGNAL \data_out_0[1]~reg0_q\ : std_logic;
SIGNAL \r3[2]~feeder_combout\ : std_logic;
SIGNAL \Mux21~0_combout\ : std_logic;
SIGNAL \Mux21~1_combout\ : std_logic;
SIGNAL \data_out_0[2]~reg0_q\ : std_logic;
SIGNAL \Mux20~0_combout\ : std_logic;
SIGNAL \Mux20~1_combout\ : std_logic;
SIGNAL \data_out_0[3]~reg0_q\ : std_logic;
SIGNAL r3 : std_logic_vector(3 DOWNTO 0);
SIGNAL r2 : std_logic_vector(3 DOWNTO 0);
SIGNAL r1 : std_logic_vector(3 DOWNTO 0);
SIGNAL r0 : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_data_in <= data_in;
data_out_1 <= ww_data_out_1;
data_out_0 <= ww_data_out_0;
ww_sel_in <= sel_in;
ww_sel_out_1 <= sel_out_1;
ww_sel_out_0 <= sel_out_0;
ww_rw_reg <= rw_reg;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: FF_X6_Y9_N5
\r1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r1[3]~feeder_combout\,
	ena => \Mux11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r1(3));

-- Location: IOIBUF_X5_Y0_N1
\sel_out_0[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel_out_0(1),
	o => \sel_out_0[1]~input_o\);

-- Location: LCCOMB_X6_Y9_N4
\r1[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r1[3]~feeder_combout\ = \data_in[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[3]~input_o\,
	combout => \r1[3]~feeder_combout\);

-- Location: IOOBUF_X0_Y21_N23
\data_out_1[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out_1[0]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out_1[0]~output_o\);

-- Location: IOOBUF_X14_Y0_N23
\data_out_1[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out_1[1]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out_1[1]~output_o\);

-- Location: IOOBUF_X0_Y21_N2
\data_out_1[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out_1[2]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out_1[2]~output_o\);

-- Location: IOOBUF_X1_Y29_N2
\data_out_1[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out_1[3]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out_1[3]~output_o\);

-- Location: IOOBUF_X0_Y26_N16
\data_out_0[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out_0[0]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out_0[0]~output_o\);

-- Location: IOOBUF_X3_Y0_N9
\data_out_0[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out_0[1]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out_0[1]~output_o\);

-- Location: IOOBUF_X3_Y29_N16
\data_out_0[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out_0[2]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out_0[2]~output_o\);

-- Location: IOOBUF_X0_Y25_N16
\data_out_0[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_out_0[3]~reg0_q\,
	devoe => ww_devoe,
	o => \data_out_0[3]~output_o\);

-- Location: IOIBUF_X0_Y14_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y10_N22
\data_in[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(0),
	o => \data_in[0]~input_o\);

-- Location: LCCOMB_X4_Y9_N28
\r3[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r3[0]~feeder_combout\ = \data_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[0]~input_o\,
	combout => \r3[0]~feeder_combout\);

-- Location: IOIBUF_X5_Y0_N8
\sel_in[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel_in(1),
	o => \sel_in[1]~input_o\);

-- Location: IOIBUF_X19_Y0_N29
\sel_in[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel_in(0),
	o => \sel_in[0]~input_o\);

-- Location: LCCOMB_X6_Y9_N22
\Mux11~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux11~2_combout\ = (!\rw_reg~input_o\ & (\sel_in[1]~input_o\ & \sel_in[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rw_reg~input_o\,
	datab => \sel_in[1]~input_o\,
	datad => \sel_in[0]~input_o\,
	combout => \Mux11~2_combout\);

-- Location: FF_X4_Y9_N29
\r3[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r3[0]~feeder_combout\,
	ena => \Mux11~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r3(0));

-- Location: LCCOMB_X6_Y9_N2
\Mux11~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (!\rw_reg~input_o\ & (\sel_in[1]~input_o\ & !\sel_in[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rw_reg~input_o\,
	datac => \sel_in[1]~input_o\,
	datad => \sel_in[0]~input_o\,
	combout => \Mux11~0_combout\);

-- Location: FF_X6_Y9_N9
\r2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \Mux11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r2(0));

-- Location: IOIBUF_X21_Y0_N8
\sel_out_1[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel_out_1(1),
	o => \sel_out_1[1]~input_o\);

-- Location: LCCOMB_X5_Y9_N4
\r0[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r0[0]~feeder_combout\ = \data_in[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[0]~input_o\,
	combout => \r0[0]~feeder_combout\);

-- Location: LCCOMB_X6_Y9_N10
\r0[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r0[0]~0_combout\ = (!\rw_reg~input_o\ & (!\sel_in[1]~input_o\ & !\sel_in[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rw_reg~input_o\,
	datac => \sel_in[1]~input_o\,
	datad => \sel_in[0]~input_o\,
	combout => \r0[0]~0_combout\);

-- Location: FF_X5_Y9_N5
\r0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r0[0]~feeder_combout\,
	ena => \r0[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r0(0));

-- Location: LCCOMB_X6_Y9_N20
\Mux11~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux11~1_combout\ = (!\rw_reg~input_o\ & (!\sel_in[1]~input_o\ & \sel_in[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rw_reg~input_o\,
	datac => \sel_in[1]~input_o\,
	datad => \sel_in[0]~input_o\,
	combout => \Mux11~1_combout\);

-- Location: FF_X6_Y9_N7
\r1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[0]~input_o\,
	sload => VCC,
	ena => \Mux11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r1(0));

-- Location: LCCOMB_X5_Y9_N18
\Mux19~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux19~0_combout\ = (\sel_out_1[0]~input_o\ & ((\sel_out_1[1]~input_o\) # ((r1(0))))) # (!\sel_out_1[0]~input_o\ & (!\sel_out_1[1]~input_o\ & (r0(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sel_out_1[0]~input_o\,
	datab => \sel_out_1[1]~input_o\,
	datac => r0(0),
	datad => r1(0),
	combout => \Mux19~0_combout\);

-- Location: LCCOMB_X5_Y9_N8
\Mux19~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux19~1_combout\ = (\sel_out_1[1]~input_o\ & ((\Mux19~0_combout\ & (r3(0))) # (!\Mux19~0_combout\ & ((r2(0)))))) # (!\sel_out_1[1]~input_o\ & (((\Mux19~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sel_out_1[1]~input_o\,
	datab => r3(0),
	datac => r2(0),
	datad => \Mux19~0_combout\,
	combout => \Mux19~1_combout\);

-- Location: IOIBUF_X7_Y0_N29
\rw_reg~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rw_reg,
	o => \rw_reg~input_o\);

-- Location: FF_X5_Y9_N9
\data_out_1[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux19~1_combout\,
	ena => \rw_reg~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out_1[0]~reg0_q\);

-- Location: IOIBUF_X0_Y5_N22
\data_in[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(1),
	o => \data_in[1]~input_o\);

-- Location: LCCOMB_X6_Y9_N16
\r1[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r1[1]~feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \r1[1]~feeder_combout\);

-- Location: FF_X6_Y9_N17
\r1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r1[1]~feeder_combout\,
	ena => \Mux11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r1(1));

-- Location: LCCOMB_X4_Y9_N26
\r3[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r3[1]~feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \r3[1]~feeder_combout\);

-- Location: FF_X4_Y9_N27
\r3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r3[1]~feeder_combout\,
	ena => \Mux11~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r3(1));

-- Location: FF_X5_Y9_N21
\r0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[1]~input_o\,
	sload => VCC,
	ena => \r0[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r0(1));

-- Location: LCCOMB_X6_Y9_N26
\r2[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r2[1]~feeder_combout\ = \data_in[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[1]~input_o\,
	combout => \r2[1]~feeder_combout\);

-- Location: FF_X6_Y9_N27
\r2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r2[1]~feeder_combout\,
	ena => \Mux11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r2(1));

-- Location: LCCOMB_X5_Y9_N20
\Mux18~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux18~0_combout\ = (\sel_out_1[0]~input_o\ & (\sel_out_1[1]~input_o\)) # (!\sel_out_1[0]~input_o\ & ((\sel_out_1[1]~input_o\ & ((r2(1)))) # (!\sel_out_1[1]~input_o\ & (r0(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sel_out_1[0]~input_o\,
	datab => \sel_out_1[1]~input_o\,
	datac => r0(1),
	datad => r2(1),
	combout => \Mux18~0_combout\);

-- Location: LCCOMB_X5_Y9_N30
\Mux18~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux18~1_combout\ = (\sel_out_1[0]~input_o\ & ((\Mux18~0_combout\ & ((r3(1)))) # (!\Mux18~0_combout\ & (r1(1))))) # (!\sel_out_1[0]~input_o\ & (((\Mux18~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sel_out_1[0]~input_o\,
	datab => r1(1),
	datac => r3(1),
	datad => \Mux18~0_combout\,
	combout => \Mux18~1_combout\);

-- Location: FF_X5_Y9_N31
\data_out_1[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux18~1_combout\,
	ena => \rw_reg~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out_1[1]~reg0_q\);

-- Location: IOIBUF_X0_Y4_N1
\data_in[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(2),
	o => \data_in[2]~input_o\);

-- Location: FF_X6_Y9_N1
\r2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \Mux11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r2(2));

-- Location: FF_X5_Y9_N15
\r0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \r0[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r0(2));

-- Location: FF_X6_Y9_N23
\r1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[2]~input_o\,
	sload => VCC,
	ena => \Mux11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r1(2));

-- Location: LCCOMB_X5_Y9_N14
\Mux17~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux17~0_combout\ = (\sel_out_1[0]~input_o\ & ((\sel_out_1[1]~input_o\) # ((r1(2))))) # (!\sel_out_1[0]~input_o\ & (!\sel_out_1[1]~input_o\ & (r0(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sel_out_1[0]~input_o\,
	datab => \sel_out_1[1]~input_o\,
	datac => r0(2),
	datad => r1(2),
	combout => \Mux17~0_combout\);

-- Location: LCCOMB_X5_Y9_N28
\Mux17~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux17~1_combout\ = (\Mux17~0_combout\ & ((r3(2)) # ((!\sel_out_1[1]~input_o\)))) # (!\Mux17~0_combout\ & (((r2(2) & \sel_out_1[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => r3(2),
	datab => r2(2),
	datac => \Mux17~0_combout\,
	datad => \sel_out_1[1]~input_o\,
	combout => \Mux17~1_combout\);

-- Location: FF_X5_Y9_N29
\data_out_1[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux17~1_combout\,
	ena => \rw_reg~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out_1[2]~reg0_q\);

-- Location: IOIBUF_X21_Y0_N1
\sel_out_1[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel_out_1(0),
	o => \sel_out_1[0]~input_o\);

-- Location: IOIBUF_X0_Y6_N15
\data_in[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in(3),
	o => \data_in[3]~input_o\);

-- Location: LCCOMB_X4_Y9_N6
\r3[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r3[3]~feeder_combout\ = \data_in[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[3]~input_o\,
	combout => \r3[3]~feeder_combout\);

-- Location: FF_X4_Y9_N7
\r3[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r3[3]~feeder_combout\,
	ena => \Mux11~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r3(3));

-- Location: FF_X5_Y9_N17
\r0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data_in[3]~input_o\,
	sload => VCC,
	ena => \r0[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r0(3));

-- Location: LCCOMB_X6_Y9_N18
\r2[3]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r2[3]~feeder_combout\ = \data_in[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[3]~input_o\,
	combout => \r2[3]~feeder_combout\);

-- Location: FF_X6_Y9_N19
\r2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r2[3]~feeder_combout\,
	ena => \Mux11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r2(3));

-- Location: LCCOMB_X5_Y9_N16
\Mux16~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux16~0_combout\ = (\sel_out_1[0]~input_o\ & (\sel_out_1[1]~input_o\)) # (!\sel_out_1[0]~input_o\ & ((\sel_out_1[1]~input_o\ & ((r2(3)))) # (!\sel_out_1[1]~input_o\ & (r0(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sel_out_1[0]~input_o\,
	datab => \sel_out_1[1]~input_o\,
	datac => r0(3),
	datad => r2(3),
	combout => \Mux16~0_combout\);

-- Location: LCCOMB_X5_Y9_N26
\Mux16~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux16~1_combout\ = (\sel_out_1[0]~input_o\ & ((\Mux16~0_combout\ & ((r3(3)))) # (!\Mux16~0_combout\ & (r1(3))))) # (!\sel_out_1[0]~input_o\ & (((\Mux16~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => r1(3),
	datab => \sel_out_1[0]~input_o\,
	datac => r3(3),
	datad => \Mux16~0_combout\,
	combout => \Mux16~1_combout\);

-- Location: FF_X5_Y9_N27
\data_out_1[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux16~1_combout\,
	ena => \rw_reg~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out_1[3]~reg0_q\);

-- Location: IOIBUF_X0_Y11_N8
\sel_out_0[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel_out_0(0),
	o => \sel_out_0[0]~input_o\);

-- Location: LCCOMB_X5_Y9_N10
\Mux23~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux23~0_combout\ = (\sel_out_0[1]~input_o\ & (\sel_out_0[0]~input_o\)) # (!\sel_out_0[1]~input_o\ & ((\sel_out_0[0]~input_o\ & ((r1(0)))) # (!\sel_out_0[0]~input_o\ & (r0(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sel_out_0[1]~input_o\,
	datab => \sel_out_0[0]~input_o\,
	datac => r0(0),
	datad => r1(0),
	combout => \Mux23~0_combout\);

-- Location: LCCOMB_X5_Y9_N24
\Mux23~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux23~1_combout\ = (\sel_out_0[1]~input_o\ & ((\Mux23~0_combout\ & (r3(0))) # (!\Mux23~0_combout\ & ((r2(0)))))) # (!\sel_out_0[1]~input_o\ & (((\Mux23~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sel_out_0[1]~input_o\,
	datab => r3(0),
	datac => r2(0),
	datad => \Mux23~0_combout\,
	combout => \Mux23~1_combout\);

-- Location: FF_X5_Y9_N25
\data_out_0[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux23~1_combout\,
	ena => \rw_reg~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out_0[0]~reg0_q\);

-- Location: LCCOMB_X5_Y9_N12
\Mux22~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux22~0_combout\ = (\sel_out_0[1]~input_o\ & ((\sel_out_0[0]~input_o\) # ((r2(1))))) # (!\sel_out_0[1]~input_o\ & (!\sel_out_0[0]~input_o\ & (r0(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sel_out_0[1]~input_o\,
	datab => \sel_out_0[0]~input_o\,
	datac => r0(1),
	datad => r2(1),
	combout => \Mux22~0_combout\);

-- Location: LCCOMB_X5_Y9_N22
\Mux22~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux22~1_combout\ = (\sel_out_0[0]~input_o\ & ((\Mux22~0_combout\ & (r3(1))) # (!\Mux22~0_combout\ & ((r1(1)))))) # (!\sel_out_0[0]~input_o\ & (((\Mux22~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => r3(1),
	datab => r1(1),
	datac => \sel_out_0[0]~input_o\,
	datad => \Mux22~0_combout\,
	combout => \Mux22~1_combout\);

-- Location: FF_X5_Y9_N23
\data_out_0[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux22~1_combout\,
	ena => \rw_reg~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out_0[1]~reg0_q\);

-- Location: LCCOMB_X4_Y9_N24
\r3[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \r3[2]~feeder_combout\ = \data_in[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_in[2]~input_o\,
	combout => \r3[2]~feeder_combout\);

-- Location: FF_X4_Y9_N25
\r3[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \r3[2]~feeder_combout\,
	ena => \Mux11~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => r3(2));

-- Location: LCCOMB_X6_Y9_N28
\Mux21~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux21~0_combout\ = (\sel_out_0[1]~input_o\ & (\sel_out_0[0]~input_o\)) # (!\sel_out_0[1]~input_o\ & ((\sel_out_0[0]~input_o\ & (r1(2))) # (!\sel_out_0[0]~input_o\ & ((r0(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sel_out_0[1]~input_o\,
	datab => \sel_out_0[0]~input_o\,
	datac => r1(2),
	datad => r0(2),
	combout => \Mux21~0_combout\);

-- Location: LCCOMB_X5_Y9_N0
\Mux21~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux21~1_combout\ = (\sel_out_0[1]~input_o\ & ((\Mux21~0_combout\ & (r3(2))) # (!\Mux21~0_combout\ & ((r2(2)))))) # (!\sel_out_0[1]~input_o\ & (((\Mux21~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sel_out_0[1]~input_o\,
	datab => r3(2),
	datac => r2(2),
	datad => \Mux21~0_combout\,
	combout => \Mux21~1_combout\);

-- Location: FF_X5_Y9_N1
\data_out_0[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux21~1_combout\,
	ena => \rw_reg~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out_0[2]~reg0_q\);

-- Location: LCCOMB_X5_Y9_N2
\Mux20~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux20~0_combout\ = (\sel_out_0[1]~input_o\ & ((\sel_out_0[0]~input_o\) # ((r2(3))))) # (!\sel_out_0[1]~input_o\ & (!\sel_out_0[0]~input_o\ & (r0(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sel_out_0[1]~input_o\,
	datab => \sel_out_0[0]~input_o\,
	datac => r0(3),
	datad => r2(3),
	combout => \Mux20~0_combout\);

-- Location: LCCOMB_X5_Y9_N6
\Mux20~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux20~1_combout\ = (\sel_out_0[0]~input_o\ & ((\Mux20~0_combout\ & ((r3(3)))) # (!\Mux20~0_combout\ & (r1(3))))) # (!\sel_out_0[0]~input_o\ & (((\Mux20~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => r1(3),
	datab => \sel_out_0[0]~input_o\,
	datac => r3(3),
	datad => \Mux20~0_combout\,
	combout => \Mux20~1_combout\);

-- Location: FF_X5_Y9_N7
\data_out_0[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux20~1_combout\,
	ena => \rw_reg~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_out_0[3]~reg0_q\);

ww_data_out_1(0) <= \data_out_1[0]~output_o\;

ww_data_out_1(1) <= \data_out_1[1]~output_o\;

ww_data_out_1(2) <= \data_out_1[2]~output_o\;

ww_data_out_1(3) <= \data_out_1[3]~output_o\;

ww_data_out_0(0) <= \data_out_0[0]~output_o\;

ww_data_out_0(1) <= \data_out_0[1]~output_o\;

ww_data_out_0(2) <= \data_out_0[2]~output_o\;

ww_data_out_0(3) <= \data_out_0[3]~output_o\;
END structure;


