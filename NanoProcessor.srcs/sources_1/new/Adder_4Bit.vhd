----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 12:31:06 PM
-- Design Name: 
-- Module Name: Adder_4Bit - Behavioral
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

entity Adder_4Bit is
    Port ( A_in : in STD_LOGIC_VECTOR (3 downto 0);
           B_in : in STD_LOGIC;
           Q : in STD_LOGIC_VECTOR (3 downto 0);
           S_out : out STD_LOGIC_VECTOR (3 downto 0);
           LSB : out STD_LOGIC);
end Adder_4Bit;

architecture Behavioral of Adder_4Bit is
Component FA
    PORT ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
End Component;

    SIGNAL A_tmp: STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL C : STD_LOGIC_VECTOR(2 downto 0);

begin

    A_tmp(0) <=  B_in AND Q(0);
    A_tmp(1) <=  B_in AND Q(1);
    A_tmp(2) <=  B_in AND Q(2);
    A_tmp(3) <=  B_in AND Q(3);
    
    FA_0 : FA
        PORT MAP(
            A => A_in(0),
            B => A_tmp(0),
            C_in => '0',
            S => LSB,
            C_out => C(0)); 
     
    FA_1 : FA
        PORT MAP(
            A => A_in(1),
            B => A_tmp(1),
            C_in => C(0),
            S => S_out(0),
            C_out => C(1));  

    FA_2 : FA
        PORT MAP(
            A => A_in(2),
            B =>A_tmp(2),
            C_in => C(1),
            S => S_out(1),
            C_out => C(2));  
        
    FA_3 : FA
        PORT MAP(
            A => A_in(3),
            B => A_tmp(3),
            C_in => C(2),
            S => S_out(2),
            C_out => S_out(3));
       
end Behavioral;