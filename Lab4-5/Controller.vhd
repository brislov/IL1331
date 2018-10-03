library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.all;
use work.CPU_Package.all;


entity Controller is
	port( 
		adr      : out address_bus; -- unsigned
		data     : in program_word; -- unsigned
		rw_RWM   : out std_logic;   -- read on high
		RWM_en   : out std_logic;   -- active low
		ROM_en   : out std_logic;   -- active low
		clk      : in std_logic;	
		reset    : in std_logic;    -- active high
		rw_reg   : out std_logic;   -- write on low
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
end entity;


architecture RTL of Controller is

	component Nibble_Counter is
		port(
			clk      : in std_logic;
			load_en  : in std_logic; -- active on high
			load_val : in unsigned(operation_size-1 downto 0);
			step     : in std_logic;
			curr_val : out unsigned(operation_size-1 downto 0)
		);
	end component;
	
	-- state declaration
	type FSM_States is (RESET_CONTR, FETCH_INSTR, LOAD_INSTR, DECODE_INSTR, WRITE_RESULT, LOAD_DATA, STORE_DATA, LOAD_IMM, BRANCH, NOP);
	signal next_state : FSM_States;
	
	-- instruction signal which gets its value from data 
	signal instr : std_logic_vector(instruction_size-1 downto 0);
	
	-- partioning of instr signal 
	alias instr_alu : std_logic is instr(9); -- ALU enable when low
	alias instr_op  : std_logic_vector(2 downto 0) is instr(8 downto 6);
	alias instr_r1  : std_logic_vector(1 downto 0) is instr(5 downto 4);
	alias instr_r2  : std_logic_vector(1 downto 0) is instr(3 downto 2);
	alias instr_r3  : std_logic_vector(1 downto 0) is instr(1 downto 0);
	alias instr_mem : std_logic_vector(3 downto 0) is instr(3 downto 0);
	alias instr_d3d2d1d0 : std_logic_vector(3 downto 0) is instr(3 downto 0); 
	
	-- program counter
	signal PC_step     : std_logic := '0'; 
	signal PC_load_en  : std_logic;
	signal PC_load_val : unsigned(operation_size-1 downto 0);
	signal PC_curr_val : unsigned(operation_size-1 downto 0);
	
begin
	
	PC : Nibble_Counter port map(clk, PC_load_en, PC_load_val, PC_step, PC_curr_val);
	
	process(clk, reset, stop)
	variable curr_state : FSM_States;
	begin

		if reset = '1' then
			next_state  <= RESET_CONTR;
		end if;
	
		if rising_edge(clk) and stop /= '1' then
			curr_state := next_state;
			
			case curr_state is
			
				when RESET_CONTR =>
					
					-- reset PC to 0
					PC_load_en  <= '1';
					PC_load_val <= (others => '0');
					
					-- reset other values 
					rw_RWM   <= '0';
					RWM_en   <= '1'; -- disabled
					ROM_en   <= '1'; -- disabled   
					rw_reg   <= '0'; -- disabled 
					sel_op_1 <= (others => '0');
					sel_op_0 <= (others => '0');
					sel_in   <= (others => '0');
					sel_mux  <= (others => '0');
					alu_op   <= (others => '0');
					alu_en   <= '0'; -- disabled
					out_en   <= '0'; -- disabled   
					data_imm <= (others => '0');

					next_state  <= FETCH_INSTR;
				
				when FETCH_INSTR =>
			
					PC_load_en  <= '0'; -- let pc start counting again 
					
					adr      <= address_bus(PC_curr_val);
					RWM_en   <= '1'; -- disabled
					ROM_en   <= '0'; -- enabled   
					rw_reg   <= '1'; -- disabled 
					alu_en   <= '0'; -- disabled     
					out_en   <= '0'; -- disabled  
					
					next_state  <= LOAD_INSTR;
					
				when LOAD_INSTR  => 
				
					PC_step <= NOT PC_step; -- change! 
								
					instr <= data;
					next_state <= DECODE_INSTR;
					
				when DECODE_INSTR =>
					
					if (instr_alu = '0') then -- ALU operation 
				
						-- set signals 
						RWM_en   <= '1'; -- disabled
						ROM_en   <= '1'; -- disabled
						rw_reg   <= '1'; -- enabled
						sel_op_1 <= to_unsigned(to_integer(unsigned(instr_r1)), instr_r1'LENGTH);
						sel_op_0 <= to_unsigned(to_integer(unsigned(instr_r2)), instr_r2'LENGTH);
						sel_in   <= to_unsigned(to_integer(unsigned(instr_r3)), instr_r3'LENGTH);
						alu_op   <= to_unsigned(to_integer(unsigned(instr_op)), instr_op'LENGTH);
						alu_en   <= '1'; -- enabled    
						out_en   <= '0'; -- disabled
						
						next_state <= WRITE_RESULT;
						
					else 
					
						case instr_op is 
					
							-- Load register
							when ("000") => next_state <= LOAD_DATA;
							
							-- Store register
							when ("001") => next_state <= STORE_DATA;
						
							-- Load immediate
							when ("010") => next_state <= LOAD_IMM;
							
							-- Branch operation (BRZ)
							when ("100") =>
								if (z_flag = '1') then 
									PC_load_val <= to_unsigned(to_integer(unsigned(instr_mem)), instr_mem'LENGTH);
									PC_load_en  <= '1'; 
								end if;
								next_state  <= BRANCH;
							
							-- Branch operation (BRN)
							when ("101") =>
								if (n_flag = '1') then 
									PC_load_val <= to_unsigned(to_integer(unsigned(instr_mem)), instr_mem'LENGTH);
									PC_load_en  <= '1';
								end if;
								next_state <= BRANCH;
							
							-- Branch operation (BRO)
							when ("110") =>
								if (o_flag = '1') then 
									PC_load_val <= to_unsigned(to_integer(unsigned(instr_mem)), instr_mem'LENGTH);
									PC_load_en  <= '1';
								end if;
								next_state <= BRANCH;
							
							-- Branch operation (BRA)
							when ("111") =>
								PC_load_val <= to_unsigned(to_integer(unsigned(instr_mem)), instr_mem'LENGTH);
								PC_load_en  <= '1';
								next_state <= BRANCH;
							
							-- If NOP then waste one clk cycle in BRANCH before going back to FETCH_INSTR
							when others => next_state <= NOP; 
								
						end case; -- instr_op
					
					end if; -- ALU check
					
					when WRITE_RESULT =>
						
						-- set signals 
						rw_reg   <= '0'; -- write
						sel_op_1 <= to_unsigned(to_integer(unsigned(instr_r1)), instr_r1'LENGTH);
						sel_op_0 <= to_unsigned(to_integer(unsigned(instr_r2)), instr_r2'LENGTH);
						sel_in   <= to_unsigned(to_integer(unsigned(instr_r3)), instr_r3'LENGTH);
						sel_mux  <= "00";
				
						next_state <= FETCH_INSTR;
					
					when LOAD_DATA =>
						
						-- set signals 
						adr      <= instr_mem;
						rw_RWM   <= '1'; -- read    
						RWM_en   <= '0'; -- active
						ROM_en   <= '1'; -- disabled  
						rw_reg   <= '0'; -- write 
						sel_in   <= to_unsigned(to_integer(unsigned(instr_r1)), instr_r1'LENGTH);
						sel_mux  <= "01"; -- data in from RWM 
						alu_en   <= '0'; -- disable ALU    
						out_en   <= '0'; -- disable Buffer
			
						next_state  <= FETCH_INSTR;
					
					when STORE_DATA =>
						
						-- set signals 
						adr      <= instr_mem;
						rw_RWM   <= '0'; -- write 
						RWM_en   <= '0'; -- active
						ROM_en   <= '1'; -- disabled   
						rw_reg   <= '1'; -- write disabled
						sel_op_1 <= to_unsigned(to_integer(unsigned(instr_r1)), instr_r1'LENGTH);
						alu_en   <= '0'; -- disabled     
						out_en   <= '1'; -- Buffer active, data to RWM   
						
						next_state  <= FETCH_INSTR;
					
					when LOAD_IMM =>
						
						-- set signals  
						RWM_en   <= '1'; -- disabled
						ROM_en   <= '1'; -- disabled    
						rw_reg   <= '0'; -- write 
						sel_in   <= to_unsigned(to_integer(unsigned(instr_r1)), instr_r1'LENGTH); -- save to r1
						sel_mux  <= "10"; -- choose data_imm

						alu_en   <= '0'; -- disabled  
						out_en   <= '0'; -- disabled   
						data_imm <= instr_d3d2d1d0;
						
						next_state  <= FETCH_INSTR;
						
					when BRANCH => next_state <= FETCH_INSTR;
					
					when NOP => next_state <= FETCH_INSTR;
					
			end case; -- states 
			
		end if; -- rising_edge 
		
	end process;
	
end architecture;
