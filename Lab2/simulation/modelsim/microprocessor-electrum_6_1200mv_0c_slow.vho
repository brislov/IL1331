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

-- DATE "09/11/2018 10:53:05"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
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

ENTITY 	ALU IS
    PORT (
	op : IN std_logic_vector(2 DOWNTO 0);
	a : IN std_logic_vector(3 DOWNTO 0);
	b : IN std_logic_vector(3 DOWNTO 0);
	en : IN std_logic;
	clk : IN std_logic;
	y : OUT std_logic_vector(3 DOWNTO 0);
	n_flag : OUT std_logic;
	z_flag : OUT std_logic;
	o_flag : OUT std_logic
	);
END ALU;

-- Design Ports Information
-- y[0]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y[1]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y[2]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y[3]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- n_flag	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z_flag	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_flag	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op[0]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op[1]	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op[2]	=>  Location: PIN_G3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ALU IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_op : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_a : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_en : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_y : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_n_flag : std_logic;
SIGNAL ww_z_flag : std_logic;
SIGNAL ww_o_flag : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \Mux2~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Mux3~3_combout\ : std_logic;
SIGNAL \Mux2~3_combout\ : std_logic;
SIGNAL \Mux3~4_combout\ : std_logic;
SIGNAL \Mux2~4_combout\ : std_logic;
SIGNAL \y[0]~output_o\ : std_logic;
SIGNAL \y[1]~output_o\ : std_logic;
SIGNAL \y[2]~output_o\ : std_logic;
SIGNAL \y[3]~output_o\ : std_logic;
SIGNAL \n_flag~output_o\ : std_logic;
SIGNAL \z_flag~output_o\ : std_logic;
SIGNAL \o_flag~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \y~4_combout\ : std_logic;
SIGNAL \y~5_combout\ : std_logic;
SIGNAL \y[0]~0_combout\ : std_logic;
SIGNAL \op[2]~input_o\ : std_logic;
SIGNAL \op[1]~input_o\ : std_logic;
SIGNAL \y[0]~6_combout\ : std_logic;
SIGNAL \y[0]~7_combout\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \op[0]~input_o\ : std_logic;
SIGNAL \Mux8~1_combout\ : std_logic;
SIGNAL \Mux8~2_combout\ : std_logic;
SIGNAL \y[0]~8_combout\ : std_logic;
SIGNAL \en~input_o\ : std_logic;
SIGNAL \y[0]~9_combout\ : std_logic;
SIGNAL \y[0]~reg0_q\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \y~10_combout\ : std_logic;
SIGNAL \y~11_combout\ : std_logic;
SIGNAL \y[1]~1_combout\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Mux7~3_combout\ : std_logic;
SIGNAL \y[1]~reg0_q\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \y~13_combout\ : std_logic;
SIGNAL \y~12_combout\ : std_logic;
SIGNAL \y[2]~2_combout\ : std_logic;
SIGNAL \Mux6~1_combout\ : std_logic;
SIGNAL \Mux6~2_combout\ : std_logic;
SIGNAL \y[2]~reg0_q\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \y~14_combout\ : std_logic;
SIGNAL \y~15_combout\ : std_logic;
SIGNAL \y[3]~3_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \Mux5~2_combout\ : std_logic;
SIGNAL \y[3]~reg0_q\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \n_flag~reg0_q\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Mux4~1_combout\ : std_logic;
SIGNAL \Mux4~2_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \z_flag~reg0_q\ : std_logic;
SIGNAL \o_flag~0_combout\ : std_logic;
SIGNAL \o_flag~reg0_q\ : std_logic;
SIGNAL temp : std_logic_vector(4 DOWNTO 0);

BEGIN

ww_op <= op;
ww_a <= a;
ww_b <= b;
ww_en <= en;
ww_clk <= clk;
y <= ww_y;
n_flag <= ww_n_flag;
z_flag <= ww_z_flag;
o_flag <= ww_o_flag;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: LCCOMB_X2_Y25_N2
\Add1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\a[1]~input_o\ & ((\b[1]~input_o\ & (!\Add1~1\)) # (!\b[1]~input_o\ & (\Add1~1\ & VCC)))) # (!\a[1]~input_o\ & ((\b[1]~input_o\ & ((\Add1~1\) # (GND))) # (!\b[1]~input_o\ & (!\Add1~1\))))
-- \Add1~3\ = CARRY((\a[1]~input_o\ & (\b[1]~input_o\ & !\Add1~1\)) # (!\a[1]~input_o\ & ((\b[1]~input_o\) # (!\Add1~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \b[1]~input_o\,
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X2_Y25_N20
\Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\a[1]~input_o\ & ((\b[1]~input_o\ & (\Add0~1\ & VCC)) # (!\b[1]~input_o\ & (!\Add0~1\)))) # (!\a[1]~input_o\ & ((\b[1]~input_o\ & (!\Add0~1\)) # (!\b[1]~input_o\ & ((\Add0~1\) # (GND)))))
-- \Add0~3\ = CARRY((\a[1]~input_o\ & (!\b[1]~input_o\ & !\Add0~1\)) # (!\a[1]~input_o\ & ((!\Add0~1\) # (!\b[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \b[1]~input_o\,
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X2_Y25_N4
\Add1~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = ((\b[2]~input_o\ $ (\a[2]~input_o\ $ (\Add1~3\)))) # (GND)
-- \Add1~5\ = CARRY((\b[2]~input_o\ & (\a[2]~input_o\ & !\Add1~3\)) # (!\b[2]~input_o\ & ((\a[2]~input_o\) # (!\Add1~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \b[2]~input_o\,
	datab => \a[2]~input_o\,
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X2_Y25_N22
\Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = ((\b[2]~input_o\ $ (\a[2]~input_o\ $ (!\Add0~3\)))) # (GND)
-- \Add0~5\ = CARRY((\b[2]~input_o\ & ((\a[2]~input_o\) # (!\Add0~3\))) # (!\b[2]~input_o\ & (\a[2]~input_o\ & !\Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \b[2]~input_o\,
	datab => \a[2]~input_o\,
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X2_Y25_N6
\Add1~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (\b[3]~input_o\ & ((\a[3]~input_o\ & (!\Add1~5\)) # (!\a[3]~input_o\ & ((\Add1~5\) # (GND))))) # (!\b[3]~input_o\ & ((\a[3]~input_o\ & (\Add1~5\ & VCC)) # (!\a[3]~input_o\ & (!\Add1~5\))))
-- \Add1~7\ = CARRY((\b[3]~input_o\ & ((!\Add1~5\) # (!\a[3]~input_o\))) # (!\b[3]~input_o\ & (!\a[3]~input_o\ & !\Add1~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datab => \a[3]~input_o\,
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X2_Y25_N8
\Add1~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = !\Add1~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add1~7\,
	combout => \Add1~8_combout\);

-- Location: LCCOMB_X3_Y25_N14
\Mux7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (!\op[2]~input_o\ & ((\op[0]~input_o\ & (\Add1~2_combout\)) # (!\op[0]~input_o\ & ((\Add0~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \op[0]~input_o\,
	datac => \op[2]~input_o\,
	datad => \Add0~2_combout\,
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X2_Y25_N12
\Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (!\op[2]~input_o\ & ((\op[0]~input_o\ & (\Add1~4_combout\)) # (!\op[0]~input_o\ & ((\Add0~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \op[2]~input_o\,
	datac => \Add1~4_combout\,
	datad => \Add0~4_combout\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X2_Y25_N14
\Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (!\op[2]~input_o\ & ((\op[0]~input_o\ & ((\Add1~6_combout\))) # (!\op[0]~input_o\ & (\Add0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \Add0~6_combout\,
	datac => \op[2]~input_o\,
	datad => \Add1~6_combout\,
	combout => \Mux5~0_combout\);

-- Location: FF_X3_Y25_N3
\temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux3~3_combout\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(1));

-- Location: LCCOMB_X3_Y25_N4
\Mux3~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = (\Mux4~0_combout\ & (((temp(1))))) # (!\Mux4~0_combout\ & (\Add0~2_combout\ & (!\op[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4~0_combout\,
	datab => \Add0~2_combout\,
	datac => \op[0]~input_o\,
	datad => temp(1),
	combout => \Mux3~2_combout\);

-- Location: FF_X3_Y25_N11
\temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux2~3_combout\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(2));

-- Location: LCCOMB_X3_Y25_N12
\Mux2~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux2~2_combout\ = (\Mux4~0_combout\ & (((temp(2))))) # (!\Mux4~0_combout\ & (!\op[0]~input_o\ & (\Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \Mux4~0_combout\,
	datac => \Add0~4_combout\,
	datad => temp(2),
	combout => \Mux2~2_combout\);

-- Location: LCCOMB_X3_Y25_N30
\Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\Mux2~4_combout\ & (!\Mux3~4_combout\ & (!\Mux3~2_combout\ & !\Mux2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~4_combout\,
	datab => \Mux3~4_combout\,
	datac => \Mux3~2_combout\,
	datad => \Mux2~2_combout\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X3_Y25_N2
\Mux3~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux3~3_combout\ = (\Mux3~2_combout\) # (\Mux3~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux3~2_combout\,
	datad => \Mux3~4_combout\,
	combout => \Mux3~3_combout\);

-- Location: LCCOMB_X3_Y25_N10
\Mux2~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux2~3_combout\ = (\Mux2~4_combout\) # (\Mux2~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux2~4_combout\,
	datad => \Mux2~2_combout\,
	combout => \Mux2~3_combout\);

-- Location: LCCOMB_X3_Y25_N16
\Mux3~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux3~4_combout\ = (\Add1~2_combout\ & (!\op[2]~input_o\ & (!\op[1]~input_o\ & \op[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \op[2]~input_o\,
	datac => \op[1]~input_o\,
	datad => \op[0]~input_o\,
	combout => \Mux3~4_combout\);

-- Location: LCCOMB_X3_Y25_N22
\Mux2~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux2~4_combout\ = (!\op[1]~input_o\ & (!\op[2]~input_o\ & (\Add1~4_combout\ & \op[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[1]~input_o\,
	datab => \op[2]~input_o\,
	datac => \Add1~4_combout\,
	datad => \op[0]~input_o\,
	combout => \Mux2~4_combout\);

-- Location: IOOBUF_X0_Y20_N9
\y[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y[0]~reg0_q\,
	devoe => ww_devoe,
	o => \y[0]~output_o\);

-- Location: IOOBUF_X0_Y20_N2
\y[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y[1]~reg0_q\,
	devoe => ww_devoe,
	o => \y[1]~output_o\);

-- Location: IOOBUF_X0_Y21_N23
\y[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y[2]~reg0_q\,
	devoe => ww_devoe,
	o => \y[2]~output_o\);

-- Location: IOOBUF_X0_Y21_N16
\y[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y[3]~reg0_q\,
	devoe => ww_devoe,
	o => \y[3]~output_o\);

-- Location: IOOBUF_X0_Y27_N16
\n_flag~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \n_flag~reg0_q\,
	devoe => ww_devoe,
	o => \n_flag~output_o\);

-- Location: IOOBUF_X0_Y27_N9
\z_flag~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \z_flag~reg0_q\,
	devoe => ww_devoe,
	o => \z_flag~output_o\);

-- Location: IOOBUF_X0_Y26_N16
\o_flag~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_flag~reg0_q\,
	devoe => ww_devoe,
	o => \o_flag~output_o\);

-- Location: IOIBUF_X41_Y15_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G9
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

-- Location: IOIBUF_X0_Y27_N22
\b[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: LCCOMB_X2_Y25_N30
\y~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y~4_combout\ = (\a[0]~input_o\ & \b[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[0]~input_o\,
	datac => \b[0]~input_o\,
	combout => \y~4_combout\);

-- Location: LCCOMB_X2_Y25_N16
\y~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y~5_combout\ = (\a[0]~input_o\) # (\b[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[0]~input_o\,
	datac => \b[0]~input_o\,
	combout => \y~5_combout\);

-- Location: LCCOMB_X1_Y25_N20
\y[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y[0]~0_combout\ = (\op[0]~input_o\ & ((\y~5_combout\))) # (!\op[0]~input_o\ & (\y~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \y~4_combout\,
	datad => \y~5_combout\,
	combout => \y[0]~0_combout\);

-- Location: IOIBUF_X0_Y23_N15
\op[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op(2),
	o => \op[2]~input_o\);

-- Location: IOIBUF_X0_Y21_N8
\op[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op(1),
	o => \op[1]~input_o\);

-- Location: LCCOMB_X1_Y25_N24
\y[0]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y[0]~6_combout\ = (\op[2]~input_o\ & ((\op[0]~input_o\) # (\op[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \op[2]~input_o\,
	datac => \op[1]~input_o\,
	combout => \y[0]~6_combout\);

-- Location: LCCOMB_X1_Y24_N0
\y[0]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y[0]~7_combout\ = (\op[1]~input_o\) # (!\op[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[1]~input_o\,
	datac => \op[2]~input_o\,
	combout => \y[0]~7_combout\);

-- Location: IOIBUF_X0_Y24_N1
\a[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: LCCOMB_X2_Y25_N18
\Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (\b[0]~input_o\ & (\a[0]~input_o\ $ (VCC))) # (!\b[0]~input_o\ & (\a[0]~input_o\ & VCC))
-- \Add0~1\ = CARRY((\b[0]~input_o\ & \a[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[0]~input_o\,
	datab => \a[0]~input_o\,
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X3_Y24_N4
\Mux8~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (!\op[0]~input_o\ & (\Add0~0_combout\ & ((!\op[1]~input_o\) # (!\op[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \op[2]~input_o\,
	datac => \op[1]~input_o\,
	datad => \Add0~0_combout\,
	combout => \Mux8~0_combout\);

-- Location: IOIBUF_X0_Y26_N1
\op[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op(0),
	o => \op[0]~input_o\);

-- Location: LCCOMB_X3_Y24_N6
\Mux8~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux8~1_combout\ = (\Mux8~0_combout\) # ((\Add1~0_combout\ & (!\op[2]~input_o\ & \op[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \op[2]~input_o\,
	datac => \Mux8~0_combout\,
	datad => \op[0]~input_o\,
	combout => \Mux8~1_combout\);

-- Location: LCCOMB_X2_Y25_N10
\Mux8~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux8~2_combout\ = (\Mux8~1_combout\) # ((\y[0]~6_combout\ & (\a[0]~input_o\ $ (!\y[0]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[0]~input_o\,
	datab => \y[0]~6_combout\,
	datac => \y[0]~7_combout\,
	datad => \Mux8~1_combout\,
	combout => \Mux8~2_combout\);

-- Location: LCCOMB_X1_Y25_N2
\y[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y[0]~8_combout\ = (\op[2]~input_o\) # (!\op[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \op[2]~input_o\,
	datac => \op[1]~input_o\,
	combout => \y[0]~8_combout\);

-- Location: IOIBUF_X0_Y25_N1
\en~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_en,
	o => \en~input_o\);

-- Location: LCCOMB_X1_Y25_N0
\y[0]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y[0]~9_combout\ = (\en~input_o\ & (((!\op[1]~input_o\) # (!\op[2]~input_o\)) # (!\op[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \op[2]~input_o\,
	datac => \op[1]~input_o\,
	datad => \en~input_o\,
	combout => \y[0]~9_combout\);

-- Location: FF_X1_Y25_N21
\y[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \y[0]~0_combout\,
	asdata => \Mux8~2_combout\,
	sload => \y[0]~8_combout\,
	ena => \y[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y[0]~reg0_q\);

-- Location: IOIBUF_X0_Y27_N1
\a[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: LCCOMB_X1_Y25_N14
\y~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y~10_combout\ = (\b[1]~input_o\ & \a[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datac => \a[1]~input_o\,
	combout => \y~10_combout\);

-- Location: LCCOMB_X1_Y25_N12
\y~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y~11_combout\ = (\b[1]~input_o\) # (\a[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datac => \a[1]~input_o\,
	combout => \y~11_combout\);

-- Location: LCCOMB_X1_Y25_N30
\y[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y[1]~1_combout\ = (\op[0]~input_o\ & ((\y~11_combout\))) # (!\op[0]~input_o\ & (\y~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \y~10_combout\,
	datad => \y~11_combout\,
	combout => \y[1]~1_combout\);

-- Location: LCCOMB_X1_Y25_N16
\Mux7~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = (!\op[0]~input_o\ & (\op[2]~input_o\ & !\op[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \op[2]~input_o\,
	datac => \op[1]~input_o\,
	combout => \Mux7~2_combout\);

-- Location: LCCOMB_X1_Y25_N10
\Mux7~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (\Mux7~0_combout\) # ((\y[0]~6_combout\ & (\y[0]~7_combout\ $ (!\a[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~0_combout\,
	datab => \y[0]~7_combout\,
	datac => \a[1]~input_o\,
	datad => \y[0]~6_combout\,
	combout => \Mux7~1_combout\);

-- Location: LCCOMB_X1_Y25_N22
\Mux7~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux7~3_combout\ = (\Mux7~1_combout\) # ((\Mux7~2_combout\ & (\b[1]~input_o\ $ (\a[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \Mux7~2_combout\,
	datac => \a[1]~input_o\,
	datad => \Mux7~1_combout\,
	combout => \Mux7~3_combout\);

-- Location: FF_X1_Y25_N31
\y[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \y[1]~1_combout\,
	asdata => \Mux7~3_combout\,
	sload => \y[0]~8_combout\,
	ena => \y[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y[1]~reg0_q\);

-- Location: IOIBUF_X0_Y25_N15
\b[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: IOIBUF_X0_Y25_N22
\a[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: LCCOMB_X1_Y24_N22
\y~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y~13_combout\ = (\b[2]~input_o\) # (\a[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b[2]~input_o\,
	datac => \a[2]~input_o\,
	combout => \y~13_combout\);

-- Location: LCCOMB_X2_Y24_N0
\y~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y~12_combout\ = (\b[2]~input_o\ & \a[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \b[2]~input_o\,
	datad => \a[2]~input_o\,
	combout => \y~12_combout\);

-- Location: LCCOMB_X1_Y25_N8
\y[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y[2]~2_combout\ = (\op[0]~input_o\ & (\y~13_combout\)) # (!\op[0]~input_o\ & ((\y~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \y~13_combout\,
	datad => \y~12_combout\,
	combout => \y[2]~2_combout\);

-- Location: LCCOMB_X2_Y25_N28
\Mux6~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux6~1_combout\ = (\Mux6~0_combout\) # ((\y[0]~6_combout\ & (\a[2]~input_o\ $ (!\y[0]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~0_combout\,
	datab => \a[2]~input_o\,
	datac => \y[0]~7_combout\,
	datad => \y[0]~6_combout\,
	combout => \Mux6~1_combout\);

-- Location: LCCOMB_X1_Y25_N4
\Mux6~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux6~2_combout\ = (\Mux6~1_combout\) # ((\Mux7~2_combout\ & (\a[2]~input_o\ $ (\b[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[2]~input_o\,
	datab => \Mux7~2_combout\,
	datac => \b[2]~input_o\,
	datad => \Mux6~1_combout\,
	combout => \Mux6~2_combout\);

-- Location: FF_X1_Y25_N9
\y[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \y[2]~2_combout\,
	asdata => \Mux6~2_combout\,
	sload => \y[0]~8_combout\,
	ena => \y[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y[2]~reg0_q\);

-- Location: IOIBUF_X0_Y23_N8
\a[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: IOIBUF_X0_Y26_N8
\b[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: LCCOMB_X1_Y26_N8
\y~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y~14_combout\ = (\a[3]~input_o\ & \b[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \a[3]~input_o\,
	datad => \b[3]~input_o\,
	combout => \y~14_combout\);

-- Location: LCCOMB_X1_Y25_N6
\y~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y~15_combout\ = (\b[3]~input_o\) # (\a[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datac => \a[3]~input_o\,
	combout => \y~15_combout\);

-- Location: LCCOMB_X1_Y25_N18
\y[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \y[3]~3_combout\ = (\op[0]~input_o\ & ((\y~15_combout\))) # (!\op[0]~input_o\ & (\y~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \y~14_combout\,
	datad => \y~15_combout\,
	combout => \y[3]~3_combout\);

-- Location: LCCOMB_X1_Y25_N28
\Mux5~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = (\Mux5~0_combout\) # ((\y[0]~6_combout\ & (\y[0]~7_combout\ $ (!\a[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux5~0_combout\,
	datab => \y[0]~7_combout\,
	datac => \a[3]~input_o\,
	datad => \y[0]~6_combout\,
	combout => \Mux5~1_combout\);

-- Location: LCCOMB_X1_Y25_N26
\Mux5~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux5~2_combout\ = (\Mux5~1_combout\) # ((\Mux7~2_combout\ & (\b[3]~input_o\ $ (\a[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datab => \Mux7~2_combout\,
	datac => \a[3]~input_o\,
	datad => \Mux5~1_combout\,
	combout => \Mux5~2_combout\);

-- Location: FF_X1_Y25_N19
\y[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \y[3]~3_combout\,
	asdata => \Mux5~2_combout\,
	sload => \y[0]~8_combout\,
	ena => \y[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y[3]~reg0_q\);

-- Location: LCCOMB_X3_Y24_N0
\Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\op[2]~input_o\) # (\op[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \op[2]~input_o\,
	datac => \op[1]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: IOIBUF_X0_Y22_N15
\b[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: LCCOMB_X2_Y25_N0
\Add1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = (\b[0]~input_o\ & (\a[0]~input_o\ $ (VCC))) # (!\b[0]~input_o\ & ((\a[0]~input_o\) # (GND)))
-- \Add1~1\ = CARRY((\a[0]~input_o\) # (!\b[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[0]~input_o\,
	datab => \a[0]~input_o\,
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X2_Y25_N24
\Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\b[3]~input_o\ & ((\a[3]~input_o\ & (\Add0~5\ & VCC)) # (!\a[3]~input_o\ & (!\Add0~5\)))) # (!\b[3]~input_o\ & ((\a[3]~input_o\ & (!\Add0~5\)) # (!\a[3]~input_o\ & ((\Add0~5\) # (GND)))))
-- \Add0~7\ = CARRY((\b[3]~input_o\ & (!\a[3]~input_o\ & !\Add0~5\)) # (!\b[3]~input_o\ & ((!\Add0~5\) # (!\a[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datab => \a[3]~input_o\,
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: FF_X3_Y25_N29
\temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mux1~1_combout\,
	sload => VCC,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(3));

-- Location: LCCOMB_X3_Y25_N28
\Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\Mux4~0_combout\ & (((temp(3))))) # (!\Mux4~0_combout\ & (!\op[0]~input_o\ & (\Add0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \Add0~6_combout\,
	datac => temp(3),
	datad => \Mux4~0_combout\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X3_Y25_N8
\Mux1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = (\Mux1~0_combout\) # ((\op[0]~input_o\ & (!\Mux4~0_combout\ & \Add1~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \Mux4~0_combout\,
	datac => \Add1~6_combout\,
	datad => \Mux1~0_combout\,
	combout => \Mux1~1_combout\);

-- Location: FF_X3_Y25_N9
\n_flag~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux1~1_combout\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \n_flag~reg0_q\);

-- Location: FF_X3_Y25_N21
\temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux0~1_combout\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(4));

-- Location: LCCOMB_X2_Y25_N26
\Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = !\Add0~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add0~7\,
	combout => \Add0~8_combout\);

-- Location: LCCOMB_X3_Y25_N6
\Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\Mux4~0_combout\ & (((temp(4))))) # (!\Mux4~0_combout\ & (!\op[0]~input_o\ & ((\Add0~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \Mux4~0_combout\,
	datac => temp(4),
	datad => \Add0~8_combout\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X3_Y25_N20
\Mux0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Mux0~0_combout\) # ((!\Add1~8_combout\ & (!\Mux4~0_combout\ & \op[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~8_combout\,
	datab => \Mux4~0_combout\,
	datac => \op[0]~input_o\,
	datad => \Mux0~0_combout\,
	combout => \Mux0~1_combout\);

-- Location: FF_X3_Y25_N25
\temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux4~2_combout\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(0));

-- Location: LCCOMB_X3_Y25_N18
\Mux4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux4~1_combout\ = (\Mux4~0_combout\ & (((temp(0))))) # (!\Mux4~0_combout\ & (!\op[0]~input_o\ & ((\Add0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \Mux4~0_combout\,
	datac => temp(0),
	datad => \Add0~0_combout\,
	combout => \Mux4~1_combout\);

-- Location: LCCOMB_X3_Y25_N24
\Mux4~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux4~2_combout\ = (\Mux4~1_combout\) # ((\op[0]~input_o\ & (!\Mux4~0_combout\ & \Add1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op[0]~input_o\,
	datab => \Mux4~0_combout\,
	datac => \Add1~0_combout\,
	datad => \Mux4~1_combout\,
	combout => \Mux4~2_combout\);

-- Location: LCCOMB_X3_Y25_N26
\Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (\Equal0~0_combout\ & (!\Mux0~1_combout\ & (!\Mux1~1_combout\ & !\Mux4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Mux0~1_combout\,
	datac => \Mux1~1_combout\,
	datad => \Mux4~2_combout\,
	combout => \Equal0~1_combout\);

-- Location: FF_X3_Y25_N27
\z_flag~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Equal0~1_combout\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \z_flag~reg0_q\);

-- Location: LCCOMB_X3_Y25_N0
\o_flag~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \o_flag~0_combout\ = \a[3]~input_o\ $ (\b[3]~input_o\ $ (\Mux1~1_combout\ $ (\Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[3]~input_o\,
	datab => \b[3]~input_o\,
	datac => \Mux1~1_combout\,
	datad => \Mux0~1_combout\,
	combout => \o_flag~0_combout\);

-- Location: FF_X3_Y25_N1
\o_flag~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \o_flag~0_combout\,
	ena => \en~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_flag~reg0_q\);

ww_y(0) <= \y[0]~output_o\;

ww_y(1) <= \y[1]~output_o\;

ww_y(2) <= \y[2]~output_o\;

ww_y(3) <= \y[3]~output_o\;

ww_n_flag <= \n_flag~output_o\;

ww_z_flag <= \z_flag~output_o\;

ww_o_flag <= \o_flag~output_o\;
END structure;


