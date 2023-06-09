----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/30/2023 12:42:34 AM
-- Design Name: Processor Core
-- Module Name: Processor - Behavioral
-- Project Name: NanoProcessor
-- Target Devices: Basys3
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processor is
    Port ( Rst : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Ovf : out STD_LOGIC;
           Zeroes : out STD_LOGIC;
           Sign : out STD_LOGIC;
           Parity : out STD_LOGIC;
           R7_out : out STD_LOGIC_VECTOR (7 downto 0);
           Anode : out STD_LOGIC_VECTOR(3 downto 0);
           Seg_data : out STD_LOGIC_VECTOR(6 downto 0));
end Processor;

architecture Behavioral of Processor is
    Component Slow_Clk
        PORT(
            Clk_in : in STD_LOGIC;
            Clk_out : out STD_LOGIC);
        End Component;

    Component ROM_8
        PORT (
            address : in STD_LOGIC_VECTOR (2 downto 0);
            ins : out STD_LOGIC_VECTOR (17 downto 0)
        );
    End Component;
    
    Component Ins_Decoder
        PORT ( ins_bus : in STD_LOGIC_VECTOR (17 downto 0);
               jmp_check : in STD_LOGIC_VECTOR(7 downto 0);
               reg_enb : out STD_LOGIC_VECTOR (2 downto 0);
               load_sel : out STD_LOGIC;
               im_val : out STD_LOGIC_VECTOR(7 downto 0);
               reg_sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
               reg_sel_2 : out STD_LOGIC_VECTOR (2 downto 0);
               mode_code : out STD_LOGIC_VECTOR(1 downto 0);
               oper_code : out STD_LOGIC_VECTOR(1 downto 0);
               jmp : out STD_LOGIC;
               jmp_addr : out STD_LOGIC_VECTOR(2 downto 0)
        );
    End Component;
    
    Component Count_3
        PORT (
            Clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            Add_in : in STD_LOGIC_VECTOR (2 downto 0);
            Add_out : out STD_LOGIC_VECTOR (2 downto 0)
        );
    End Component;
    
    Component Adder_3
        PORT (
            A_in : in STD_LOGIC_VECTOR (2 downto 0);
            S_out : out STD_LOGIC_VECTOR (2 downto 0)
        ); 
    End Component;
    
    Component Reg_Bank_8
        PORT (
            I : in STD_LOGIC_VECTOR (7 downto 0);
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;
            Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
            R0 : out STD_LOGIC_VECTOR (7 downto 0);
            R1 : out STD_LOGIC_VECTOR (7 downto 0);
            R2 : out STD_LOGIC_VECTOR (7 downto 0);
            R3 : out STD_LOGIC_VECTOR (7 downto 0);
            R4 : out STD_LOGIC_VECTOR (7 downto 0);
            R5 : out STD_LOGIC_VECTOR (7 downto 0);
            R6 : out STD_LOGIC_VECTOR (7 downto 0);
            R7 : out STD_LOGIC_VECTOR (7 downto 0)
        );
    End Component;
    
    Component Mux_8_way_8
        PORT (
            Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
            A0, A1, A2, A3, A4, A5, A6, A7 : in STD_LOGIC_VECTOR(7 downto 0);
            Y : out STD_LOGIC_VECTOR (7 downto 0)
        );
    End Component;
    
    Component Mux_2_way_3
        PORT (
            I : in STD_LOGIC;
            A0, A1 : STD_LOGIC_VECTOR(2 downto 0);
            Y : out STD_LOGIC_VECTOR (2 downto 0)
        );
    End Component;
    
    Component Mux_2_way_8
        PORT (
            I : in STD_LOGIC;
            A0, A1 : in STD_LOGIC_VECTOR (7 downto 0);
            Y : out STD_LOGIC_VECTOR (7 downto 0)
        );
    End Component;
    
    Component ALU
        PORT ( A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
               Mode : in STD_LOGIC_VECTOR (1 downto 0);
               Oper : in STD_LOGIC_VECTOR (1 downto 0);
               S : out STD_LOGIC_VECTOR (7 downto 0);
               Comp_out : out STD_LOGIC;
               Ovf : out STD_LOGIC;
               Zeroes : out STD_LOGIC;
               Sign : out STD_LOGIC;
               Parity : out STD_LOGIC
        );
    End Component;
    
    Component LUT_7_Display
        Port ( 
                address : in STD_LOGIC_VECTOR (3 downto 0);
                data : out STD_LOGIC_VECTOR (6 downto 0)
            );
    End Component;
    
    -- slow down clock
    SIGNAL s_clk : STD_LOGIC;
    
    -- ALU signals
    SIGNAL alu_out : STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL mux_1, mux_2 : STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL comp_out : STD_LOGIC;
    
    -- Register outputs signals
    SIGNAL R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR(7 downto 0);
    
    -- all the instruction decoder intermediate signals
    SIGNAL jmp_flag, load_sel, addr_sel_in : STD_LOGIC;
    SIGNAL mode, oper : STD_LOGIC_VECTOR(1 downto 0);
    SIGNAL jmp_addr, reg_enb, reg_sel_1, reg_sel_2 : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL im_val, jmp_check : STD_LOGIC_VECTOR(7 downto 0);
    
    
    -- all other the intermediate signals 
    SIGNAL ins : STD_LOGIC_VECTOR(17 downto 0);
    SIGNAL rom_addr, counter_in, adder_3_out : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL reg_bus : STD_LOGIC_VECTOR(7 downto 0);
    
begin
    Slow_Clk_0 : Slow_Clk
        PORT MAP(
            Clk_in => Clk,
            Clk_out => s_clk
        );
    -- create the 12-bitx8 ROM
    ROM_0_8 : ROM_8
        PORT MAP(
            address => rom_addr,
            ins => ins
        );
        
    -- create program counter
    Program_Counter : Count_3 
        PORT MAP(
            Clk => s_clk, -- s_clk
            rst => Rst,
            Add_in => counter_in,
            Add_out => rom_addr
        );
    
    -- create a 3-bit adder to increase the program counter value     
    Adder_3_0 : Adder_3 
        PORT MAP(
            A_in => rom_addr,
            S_out => adder_3_out
        );
       
   addr_sel_in <= jmp_flag OR comp_out; 
   -- create a 2-way 3-bit mux for select on of the incoming address
    Addr_Sel : Mux_2_way_3
       PORT MAP(
        I => addr_sel_in,
        A0 => adder_3_out,
        A1 => jmp_addr,
        Y => counter_in
    );
    
    -- create the Instruction Decoder
    Ins_Decoder_0 : Ins_Decoder
        PORT MAP(
          ins_bus => ins,
          jmp_check => jmp_check,
          reg_enb => reg_enb,
          load_sel => load_sel,
          im_val => im_val,
          reg_sel_1 => reg_sel_1,
          reg_sel_2 => reg_sel_2,
          mode_code => mode,
          oper_code => oper,
          jmp => jmp_flag,
          jmp_addr => jmp_addr  
        );
        
    -- create the 2-way 4-bit mux for select the value from either ALU or immediate value
    Val_Sel : Mux_2_way_8
        PORT MAP(
            I => load_sel,
            A0 => alu_out,
            A1 => im_val,
            Y => reg_bus
        );
        
    -- create register bank for the processor
    Reg_Bank_0 : Reg_Bank_8 
        PORT MAP(
            I => reg_bus,
            Clk => s_clk, -- s_clk
            Rst => Rst,
            Reg_En => reg_enb,
            R0 => R0,
            R1 => R1,
            R2 => R2,
            R3 => R3,
            R4 => R4,
            R5 => R5,
            R6 => R6,
            R7 => R7
        );
        
    R7_out <= R7;
    
    LUT_7_Display_0 : LUT_7_Display
        PORT MAP(
            address => R7(3 downto 0),
            data => Seg_data
        );
    Anode <= "1110";
    
    -- create ALU part of the processor
    ALU_0 : ALU
        PORT MAP(
            A => mux_2,
            B => mux_1,
            Mode => mode,
            Oper => oper,
            S => alu_out,
            Ovf => Ovf,
            Zeroes => Zeroes,
            Comp_out => comp_out,
            Sign => Sign,
            Parity => Parity
        );
        
    jmp_check <= mux_1;
    
    -- create ALU values selecter multiplexers
    ALU_Mux_1 : Mux_8_way_8 
        PORT MAP(
            Reg_Sel => reg_sel_1,
            A0 => R0,
            A1 => R1,
            A2 => R2,
            A3 => R3, 
            A4 => R4,
            A5 => R5,
            A6 => R6,
            A7 => R7,
            Y => mux_1
        );
    
    ALU_Mux_2 : Mux_8_way_8
        PORT MAP(
            Reg_Sel => reg_sel_2,
            A0 => R0,
            A1 => R1,
            A2 => R2,
            A3 => R3, 
            A4 => R4,
            A5 => R5,
            A6 => R6,
            A7 => R7,
            Y => mux_2
        );

end Behavioral;
