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
    Port ( A_in : in STD_LOGIC_VECTOR (7 downto 0);
           B_in : in STD_LOGIC;
           Q : in STD_LOGIC_VECTOR (7 downto 0);
           S_out : out STD_LOGIC_VECTOR (7 downto 0);
           LSB : out STD_LOGIC);
end Adder_8Bit;

architecture Behavioral of Adder_8Bit is
    Component FA
        PORT ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               C_in : in STD_LOGIC;
               S : out STD_LOGIC;
               C_out : out STD_LOGIC);
    End Component;

    SIGNAL A_tmp: STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL C : STD_LOGIC_VECTOR(6 downto 0);

begin

    A_tmp(0) <=  B_in AND Q(0);
    A_tmp(1) <=  B_in AND Q(1);
    A_tmp(2) <=  B_in AND Q(2);
    A_tmp(3) <=  B_in AND Q(3);
    A_tmp(4) <=  B_in AND Q(4);
    A_tmp(5) <=  B_in AND Q(5);
    A_tmp(6) <=  B_in AND Q(6);
    A_tmp(7) <=  B_in AND Q(7);
    
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
            B =>A_tmp(3),
            C_in => C(2),
            S => S_out(2),
            C_out => C(3));  
    
    FA_4 : FA
        PORT MAP(
            A => A_in(4),
            B =>A_tmp(4),
            C_in => C(3),
            S => S_out(3),
            C_out => C(4));  
    
    FA_5 : FA
        PORT MAP(
            A => A_in(5),
            B =>A_tmp(5),
            C_in => C(4),
            S => S_out(4),
            C_out => C(5));  
    
    FA_6 : FA
        PORT MAP(
            A => A_in(6),
            B =>A_tmp(6),
            C_in => C(5),
            S => S_out(5),
            C_out => C(6));  
        
    FA_7 : FA
        PORT MAP(
            A => A_in(7),
            B => A_tmp(7),
            C_in => C(6),
            S => S_out(6),
            C_out => S_out(7));
       
end Behavioral;
