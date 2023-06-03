----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 07:21:14 PM
-- Design Name: 
-- Module Name: Comparetor - Behavioral
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

entity Comparator is
    Port ( A_in : in STD_LOGIC_VECTOR (3 downto 0);
           B_in : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC_VECTOR (1 downto 0);
           S_out : out STD_LOGIC);
end Comparator;

architecture Behavioral of Comparator is
    Component Bit_comparator
        PORT(
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            M : in STD_LOGIC_VECTOR(1 downto 0);
            S : out STD_LOGIC;
            E : out STD_LOGIC);
    End Component;

SIGNAL S, E : STD_LOGIC_VECTOR(3 downto 0);

begin
    Bit_0 : Bit_comparator
        PORT MAP(
            A => A_in(0),
            B => B_in(0),
            M => M,
            S => S(0),
            E => E(0));
            
    Bit_1 : Bit_comparator
        PORT MAP(
            A => A_in(1),
            B => B_in(1),
            M => M,
            S => S(1),
            E => E(1));
            
    Bit_2 : Bit_comparator
        PORT MAP(
            A => A_in(2),
            B => B_in(2),
            M => M,
            S => S(2),
            E => E(2));
            
    Bit_3 : Bit_comparator
        PORT MAP(
            A => A_in(3),
            B => B_in(3),
            M => M,
            S => S(3),
            E => E(3));
        
    -- 00 A == B
    -- 01 A < B
    -- 10 B < A
    -- 11 A != B
    
    S_out <= (((NOT M(0)) AND (NOT M(1))) AND (S(0) AND S(1) AND S(2) AND S(3))) -- equality
            OR (( M(0) AND M(1) ) AND ((S(0) OR S(1) OR S(2) OR S(3)))) -- non equality
            OR ((M(0) XOR M(1) ) AND (S(3) OR (E(3) AND S(2)) OR (E(3) AND E(2) AND S(1)) OR (E(3) AND E(2) AND E(1) AND S(0)))); -- B > A or A > B
    
    
end Behavioral;
