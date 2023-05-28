----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/29/2023 12:55:07 AM
-- Design Name: Instruction Decoder Simulation
-- Module Name: Ins_Decoder_Sim - Behavioral
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

entity Ins_Decoder_Sim is
--  Port ( );
end Ins_Decoder_Sim;

architecture Behavioral of Ins_Decoder_Sim is
    
    Component Ins_Decoder
        PORT (
             ins_bus : in STD_LOGIC_VECTOR (11 downto 0);
             jmp_check : in STD_LOGIC_VECTOR(3 downto 0);
             reg_enb : out STD_LOGIC_VECTOR (2 downto 0);
             load_sel : out STD_LOGIC;
             im_val : out STD_LOGIC_VECTOR(3 downto 0);
             reg_sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
             reg_sel_2 : out STD_LOGIC_VECTOR (2 downto 0);
             add_sub_sel : out STD_LOGIC;
             jmp : out STD_LOGIC;
             jmp_addr : out STD_LOGIC_VECTOR(2 downto 0)
        );
    End Component;
    
    SIGNAL ins_bus : STD_LOGIC_VECTOR(11 downto 0);
    SIGNAL jmp_check, im_val : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL reg_enb, reg_sel_1, reg_sel_2, jmp_addr : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL load_sel, add_sub_sel, jmp : STD_LOGIC;
    
begin

    UUT : Ins_Decoder PORT MAP (
        ins_bus => ins_bus,
        jmp_check => jmp_check,
        reg_enb => reg_enb,
        load_sel => load_sel,
        im_val => im_val,
        reg_sel_1 => reg_sel_1,
        reg_sel_2 => reg_sel_2,
        add_sub_sel => add_sub_sel,
        jmp => jmp,
        jmp_addr => jmp_addr
    );
    
    process 
    begin
    
        -- test couple of 12 bit instructions on the instruction decoder
        -- MOVI R1, 10
        ins_bus <= "100010001010";
        wait for 10ns;
        
        -- MOVI R2, 1
        ins_bus <= "100100000001";
        wait for 10ns;
        
        -- NEG R2
        ins_bus <= "010100000000";
        wait for 10ns;
        
        wait; --wait forever
    
    end process;


end Behavioral;
