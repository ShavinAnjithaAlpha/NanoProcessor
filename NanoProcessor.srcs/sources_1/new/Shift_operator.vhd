----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 06:53:04 PM
-- Design Name: 
-- Module Name: Shift_operator - Behavioral
-- Project Name: 
-- Target Devices: 
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

entity Shift_operator is
    Port ( A_in : in STD_LOGIC_VECTOR (3 downto 0);
           B_in : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC_VECTOR (1 downto 0);
           S_out : out STD_LOGIC_VECTOR (3 downto 0));
end Shift_operator;

architecture Behavioral of Shift_operator is
Component Left_shift
    PORT(
        A_in : in STD_LOGIC_VECTOR (3 downto 0);
        S_out : out STD_LOGIC_VECTOR (3 downto 0));
End Component;

Component Right_shift
    PORT(
        A_in : in STD_LOGIC_VECTOR (3 downto 0);
        S_out : out STD_LOGIC_VECTOR (3 downto 0));
End Component;

SIGNAL tmp1, tmp2 : STD_LOGIC_VECTOR(3 downto 0);

begin
left_shift_0 : Left_shift
    PORT MAP(
        A_in => A_in,
        S_out => tmp1);
        
right_shift_0 : Right_shift
    PORT MAP(
        A_in => A_in,
        S_out => tmp2);
    
    S_out(0) <= ( M(0) AND tmp1(0) ) OR ( M(1) AND tmp2(0) ); 
    S_out(1) <= ( M(0) AND tmp1(1) ) OR ( M(1) AND tmp2(1) ); 
    S_out(2) <= ( M(0) AND tmp1(2) ) OR ( M(1) AND tmp2(2) ); 
    S_out(3) <= ( M(0) AND tmp1(3) ) OR ( M(1) AND tmp2(3) ); 
    
end Behavioral;
