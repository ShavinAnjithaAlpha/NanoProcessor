----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name : Shavin Anjitha
-- Create Date: 05/18/2023 11:22:33 PM
-- Design Name: Instruction Deocder
-- Module Name: Ins_Decoder - Behavioral
-- Project Name: Nano Processor
-- Target Devices: Basys3 board
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

entity Ins_Decoder is
    Port ( ins_bus : in STD_LOGIC_VECTOR (17 downto 0);
           jmp_check : in STD_LOGIC_VECTOR(7 downto 0);
           reg_enb : out STD_LOGIC_VECTOR (2 downto 0);
           load_sel : out STD_LOGIC;
           im_val : out STD_LOGIC_VECTOR(7 downto 0);
           reg_sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           reg_sel_2 : out STD_LOGIC_VECTOR (2 downto 0);
           mode_code : out STD_LOGIC_VECTOR(1 downto 0);
           oper_code : out STD_LOGIC_VECTOR(1 downto 0);
           jmp : out STD_LOGIC;
           jmp_addr : out STD_LOGIC_VECTOR(2 downto 0));
end Ins_Decoder;

architecture Behavioral of Ins_Decoder is

    SIGNAL all_zeroes : STD_LOGIC;

begin
    
    all_zeroes <= NOT(jmp_check(0)) AND NOT(jmp_check(1)) AND NOT(jmp_check(2)) AND NOT(jmp_check(3)) AND NOT(jmp_check(4)) 
                    AND NOT(jmp_check(5)) AND NOT(jmp_check(6)) AND NOT(jmp_check(7));
    
    reg_enb <= ins_bus(13 downto 11);
    im_val <= ins_bus(7 downto 0);
    load_sel <= ins_bus(15) AND NOT(ins_bus(17)) AND NOT(ins_bus(16)) AND NOT(ins_bus(14));
    reg_sel_1 <= ins_bus(13 downto 11);
    reg_sel_2 <= ins_bus(10 downto 8);
    mode_code <= ins_bus(17 downto 16);
    oper_code <= ins_bus(15 downto 14);
    jmp <= NOT(ins_bus(17)) AND NOT(ins_bus(16)) AND ins_bus(15) AND ins_bus(14) AND all_zeroes;
    jmp_addr <= ins_bus(2 downto 0);
    
end Behavioral;
