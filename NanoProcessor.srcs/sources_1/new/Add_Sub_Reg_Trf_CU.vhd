----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 06/04/2023 12:49:43 AM
-- Design Name: Adder Subtractor and Regsiter Transfer Control Unit
-- Module Name: Add_Sub_Reg_Trf_CU - Behavioral
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

entity Add_Sub_Reg_Trf_CU is
    Port ( Mode : in STD_LOGIC_VECTOR (1 downto 0);
           Oper : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (1 downto 0));
end Add_Sub_Reg_Trf_CU;

architecture Behavioral of Add_Sub_Reg_Trf_CU is

begin

    S(0) <= (NOT(Mode(0)) AND NOT(Mode(1)) AND NOT(Oper(1)) AND Oper(0)) 
            OR (Mode(1) AND NOT(Mode(0)) AND Oper(1) AND Oper(0));
            
    S(1) <= Mode(1) OR (Mode(0) AND NOT(Oper(1))) OR Oper(1);

end Behavioral;
