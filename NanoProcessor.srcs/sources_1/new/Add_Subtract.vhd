----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 10:39:01 PM
-- Design Name: 
-- Module Name: Add_Subtract - Behavioral
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

entity Add_Subtract is
    Port ( A_in : in STD_LOGIC_VECTOR (3 downto 0);
           B_in : in STD_LOGIC_VECTOR (3 downto 0);
           S_out : out STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC; -- operation code
           Zeroes : out STD_LOGIC; -- zero flag
           Ovf : out STD_LOGIC); -- overflow flag
end Add_Subtract;

architecture Behavioral of Add_Subtract is
Component FA
    PORT(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        C_in : in STD_LOGIC;
        S : out STD_LOGIC;
        C_out : out STD_LOGIC);
End Component;

    SIGNAL FA_C_out, B_in_temp : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL S : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    B_in_temp(0) <= B_in(0) XOR M;
    B_in_temp(1) <= B_in(1) XOR M;
    B_in_temp(2) <= B_in(2) XOR M;
    B_in_temp(3) <= B_in(3) XOR M;
    
    FA_0: FA
        PORT MAP(
            A => A_in(0),
            B => B_in_temp(0),
            C_in => M,
            S => S(0),
            C_out => FA_C_out(0));
            
    FA_1: FA
        PORT MAP(
            A => A_in(1),
            B => B_in_temp(1),
            C_in => FA_C_out(0),
            S => S(1),
            C_out => FA_C_out(1));
                    
    FA_2: FA
        PORT MAP(
            A => A_in(2),
            B => B_in_temp(2),
            C_in => FA_C_out(1),
            S => S(2),
            C_out => FA_C_out(2));
            
    FA_3: FA
        PORT MAP(
            A => A_in(3),
            B => B_in_temp(3),
            C_in => FA_C_out(2),
            S => S(3),
            C_out => FA_C_out(3));
        
    S_out <= S;
    
    Zeroes <= NOT(S(0)) AND NOT(S(1)) AND NOT(S(2)) AND NOT(S(3));
    Ovf <= FA_C_out(3) XOR FA_C_out(2);
    
    
end Behavioral;
