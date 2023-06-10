----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 04:08:17 PM
-- Design Name: 
-- Module Name: Adder_8Bit - Behavioral
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

entity Adder_8Bit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR(7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Carry : out STD_LOGIC);
end Adder_8Bit;

architecture Behavioral of Adder_8Bit is
    Component FA
        PORT ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               C_in : in STD_LOGIC;
               S : out STD_LOGIC;
               C_out : out STD_LOGIC);
    End Component;
    
    SIGNAL C : STD_LOGIC_VECTOR(7 downto 0);
    
begin
    
    FA_0 : FA
        PORT MAP(
            A => A(0),
            B => B(0),
            C_in => '0',
            S => S(0),
            C_out => C(0)); 
     
    FA_1 : FA
        PORT MAP(
            A => A(1),
            B => B(1),
            C_in => C(0),
            S => S(1),
            C_out => C(1));  

    FA_2 : FA
        PORT MAP(
            A => A(2),
            B => B(2),
            C_in => C(1),
            S => S(2),
            C_out => C(2));  
    
    FA_3 : FA
        PORT MAP(
            A => A(3),
            B => B(3),
            C_in => C(2),
            S => S(3),
            C_out => C(3));  
    
    FA_4 : FA
        PORT MAP(
            A => A(4),
            B => B(4),
            C_in => C(3),
            S => S(4),
            C_out => C(4));  
    
    FA_5 : FA
        PORT MAP(
            A => A(5),
            B => B(5),
            C_in => C(4),
            S => S(5),
            C_out => C(5));  
    
    FA_6 : FA
        PORT MAP(
            A => A(6),
            B => B(6),
            C_in => C(5),
            S => S(6),
            C_out => C(6));  
        
    FA_7 : FA
        PORT MAP(
            A => A(7),
            B => B(7),
            C_in => C(6),
            S => S(7),
            C_out => Carry);
       
end Behavioral;
