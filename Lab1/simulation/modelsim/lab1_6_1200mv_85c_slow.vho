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

-- DATE "09/06/2018 10:18:04"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	carry_lookahead_adder IS
    PORT (
	i_num1 : IN std_logic_vector(3 DOWNTO 0);
	i_num2 : IN std_logic_vector(3 DOWNTO 0);
	i_cin : IN std_logic;
	o_cout : OUT std_logic;
	o_result : OUT std_logic_vector(3 DOWNTO 0)
	);
END carry_lookahead_adder;

-- Design Ports Information
-- o_cout	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_result[0]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_result[1]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_result[2]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_result[3]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_num1[2]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_num2[2]	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_num1[0]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_num2[0]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_cin	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_num1[1]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_num2[1]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_num1[3]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_num2[3]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF carry_lookahead_adder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_num1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_i_num2 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_i_cin : std_logic;
SIGNAL ww_o_cout : std_logic;
SIGNAL ww_o_result : std_logic_vector(3 DOWNTO 0);
SIGNAL \o_cout~output_o\ : std_logic;
SIGNAL \o_result[0]~output_o\ : std_logic;
SIGNAL \o_result[1]~output_o\ : std_logic;
SIGNAL \o_result[2]~output_o\ : std_logic;
SIGNAL \o_result[3]~output_o\ : std_logic;
SIGNAL \i_num2[3]~input_o\ : std_logic;
SIGNAL \i_num1[2]~input_o\ : std_logic;
SIGNAL \w_c[3]~0_combout\ : std_logic;
SIGNAL \i_num1[3]~input_o\ : std_logic;
SIGNAL \i_num2[1]~input_o\ : std_logic;
SIGNAL \i_num1[0]~input_o\ : std_logic;
SIGNAL \i_num2[0]~input_o\ : std_logic;
SIGNAL \w_c[1]~1_combout\ : std_logic;
SIGNAL \i_cin~input_o\ : std_logic;
SIGNAL \w_c[1]~2_combout\ : std_logic;
SIGNAL \w_c[2]~3_combout\ : std_logic;
SIGNAL \w_c[3]~4_combout\ : std_logic;
SIGNAL \w_c~5_combout\ : std_logic;
SIGNAL \generate_full_adders:0:FAx|o_sum~0_combout\ : std_logic;
SIGNAL \i_num1[1]~input_o\ : std_logic;
SIGNAL \generate_full_adders:1:FAx|o_sum~combout\ : std_logic;
SIGNAL \i_num2[2]~input_o\ : std_logic;
SIGNAL \generate_full_adders:2:FAx|o_sum~0_combout\ : std_logic;
SIGNAL \generate_full_adders:3:FAx|o_sum~combout\ : std_logic;

BEGIN

ww_i_num1 <= i_num1;
ww_i_num2 <= i_num2;
ww_i_cin <= i_cin;
o_cout <= ww_o_cout;
o_result <= ww_o_result;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X0_Y24_N23
\o_cout~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \w_c~5_combout\,
	devoe => ww_devoe,
	o => \o_cout~output_o\);

-- Location: IOOBUF_X0_Y20_N9
\o_result[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \generate_full_adders:0:FAx|o_sum~0_combout\,
	devoe => ww_devoe,
	o => \o_result[0]~output_o\);

-- Location: IOOBUF_X0_Y20_N2
\o_result[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \generate_full_adders:1:FAx|o_sum~combout\,
	devoe => ww_devoe,
	o => \o_result[1]~output_o\);

-- Location: IOOBUF_X0_Y21_N23
\o_result[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \generate_full_adders:2:FAx|o_sum~0_combout\,
	devoe => ww_devoe,
	o => \o_result[2]~output_o\);

-- Location: IOOBUF_X0_Y21_N16
\o_result[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \generate_full_adders:3:FAx|o_sum~combout\,
	devoe => ww_devoe,
	o => \o_result[3]~output_o\);

-- Location: IOIBUF_X0_Y26_N8
\i_num2[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_num2(3),
	o => \i_num2[3]~input_o\);

-- Location: IOIBUF_X0_Y25_N22
\i_num1[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_num1(2),
	o => \i_num1[2]~input_o\);

-- Location: LCCOMB_X1_Y25_N24
\w_c[3]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \w_c[3]~0_combout\ = (\i_num2[2]~input_o\ & \i_num1[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_num2[2]~input_o\,
	datac => \i_num1[2]~input_o\,
	combout => \w_c[3]~0_combout\);

-- Location: IOIBUF_X0_Y23_N8
\i_num1[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_num1(3),
	o => \i_num1[3]~input_o\);

-- Location: IOIBUF_X0_Y22_N15
\i_num2[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_num2(1),
	o => \i_num2[1]~input_o\);

-- Location: IOIBUF_X0_Y24_N1
\i_num1[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_num1(0),
	o => \i_num1[0]~input_o\);

-- Location: IOIBUF_X0_Y27_N22
\i_num2[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_num2(0),
	o => \i_num2[0]~input_o\);

-- Location: LCCOMB_X1_Y25_N26
\w_c[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \w_c[1]~1_combout\ = (\i_num1[0]~input_o\ & \i_num2[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_num1[0]~input_o\,
	datac => \i_num2[0]~input_o\,
	combout => \w_c[1]~1_combout\);

-- Location: IOIBUF_X0_Y26_N1
\i_cin~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_cin,
	o => \i_cin~input_o\);

-- Location: LCCOMB_X1_Y25_N12
\w_c[1]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \w_c[1]~2_combout\ = (\i_cin~input_o\ & ((\i_num2[0]~input_o\) # (\i_num1[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_num2[0]~input_o\,
	datab => \i_num1[0]~input_o\,
	datac => \i_cin~input_o\,
	combout => \w_c[1]~2_combout\);

-- Location: LCCOMB_X1_Y25_N6
\w_c[2]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \w_c[2]~3_combout\ = (\i_num1[1]~input_o\ & ((\i_num2[1]~input_o\) # ((\w_c[1]~1_combout\) # (\w_c[1]~2_combout\)))) # (!\i_num1[1]~input_o\ & (\i_num2[1]~input_o\ & ((\w_c[1]~1_combout\) # (\w_c[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_num1[1]~input_o\,
	datab => \i_num2[1]~input_o\,
	datac => \w_c[1]~1_combout\,
	datad => \w_c[1]~2_combout\,
	combout => \w_c[2]~3_combout\);

-- Location: LCCOMB_X1_Y25_N0
\w_c[3]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \w_c[3]~4_combout\ = (\w_c[2]~3_combout\ & ((\i_num2[2]~input_o\) # (\i_num1[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_num2[2]~input_o\,
	datac => \i_num1[2]~input_o\,
	datad => \w_c[2]~3_combout\,
	combout => \w_c[3]~4_combout\);

-- Location: LCCOMB_X1_Y25_N18
\w_c~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \w_c~5_combout\ = (\i_num2[3]~input_o\ & ((\w_c[3]~0_combout\) # ((\i_num1[3]~input_o\) # (\w_c[3]~4_combout\)))) # (!\i_num2[3]~input_o\ & (\i_num1[3]~input_o\ & ((\w_c[3]~0_combout\) # (\w_c[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_num2[3]~input_o\,
	datab => \w_c[3]~0_combout\,
	datac => \i_num1[3]~input_o\,
	datad => \w_c[3]~4_combout\,
	combout => \w_c~5_combout\);

-- Location: LCCOMB_X1_Y25_N20
\generate_full_adders:0:FAx|o_sum~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generate_full_adders:0:FAx|o_sum~0_combout\ = \i_num2[0]~input_o\ $ (\i_num1[0]~input_o\ $ (\i_cin~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_num2[0]~input_o\,
	datab => \i_num1[0]~input_o\,
	datac => \i_cin~input_o\,
	combout => \generate_full_adders:0:FAx|o_sum~0_combout\);

-- Location: IOIBUF_X0_Y27_N1
\i_num1[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_num1(1),
	o => \i_num1[1]~input_o\);

-- Location: LCCOMB_X1_Y25_N30
\generate_full_adders:1:FAx|o_sum\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generate_full_adders:1:FAx|o_sum~combout\ = \i_num1[1]~input_o\ $ (\i_num2[1]~input_o\ $ (((\w_c[1]~1_combout\) # (\w_c[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_num1[1]~input_o\,
	datab => \i_num2[1]~input_o\,
	datac => \w_c[1]~1_combout\,
	datad => \w_c[1]~2_combout\,
	combout => \generate_full_adders:1:FAx|o_sum~combout\);

-- Location: IOIBUF_X0_Y25_N15
\i_num2[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_num2(2),
	o => \i_num2[2]~input_o\);

-- Location: LCCOMB_X1_Y25_N8
\generate_full_adders:2:FAx|o_sum~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generate_full_adders:2:FAx|o_sum~0_combout\ = \i_num2[2]~input_o\ $ (\i_num1[2]~input_o\ $ (\w_c[2]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_num2[2]~input_o\,
	datac => \i_num1[2]~input_o\,
	datad => \w_c[2]~3_combout\,
	combout => \generate_full_adders:2:FAx|o_sum~0_combout\);

-- Location: LCCOMB_X1_Y25_N2
\generate_full_adders:3:FAx|o_sum\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generate_full_adders:3:FAx|o_sum~combout\ = \i_num2[3]~input_o\ $ (\i_num1[3]~input_o\ $ (((\w_c[3]~0_combout\) # (\w_c[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_num2[3]~input_o\,
	datab => \w_c[3]~0_combout\,
	datac => \i_num1[3]~input_o\,
	datad => \w_c[3]~4_combout\,
	combout => \generate_full_adders:3:FAx|o_sum~combout\);

ww_o_cout <= \o_cout~output_o\;

ww_o_result(0) <= \o_result[0]~output_o\;

ww_o_result(1) <= \o_result[1]~output_o\;

ww_o_result(2) <= \o_result[2]~output_o\;

ww_o_result(3) <= \o_result[3]~output_o\;
END structure;


