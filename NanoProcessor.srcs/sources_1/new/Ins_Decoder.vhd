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
    Port ( ins_bus : in STD_LOGIC_VECTOR (11 downto 0);
           reg_enb : out STD_LOGIC_VECTOR (2 downto 0);
           load_sel : out STD_LOGIC;
           im_val : out STD_LOGIC_VECTOR(3 downto 0);
           reg_sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           reg_sel_2 : out STD_LOGIC_VECTOR (2 downto 0);
           add_sub_sel : out STD_LOGIC;
           jmp_check : in STD_LOGIC);
end Ins_Decoder;

architecture Behavioral of Ins_Decoder is

begin


end Behavioral;
