----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 06/10/2023 07:12:37 PM
-- Design Name: 8-bit Comparator Simulaition
-- Module Name: Comparator_8_Sim - Behavioral
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

entity Comparator_8_Sim is
--  Port ( );
end Comparator_8_Sim;

architecture Behavioral of Comparator_8_Sim is
    
    Component Comparator_8
        PORT (
            A : in STD_LOGIC_VECTOR(7 downto 0);
            B : in STD_LOGIC_VECTOR(7 downto 0);
            Oper : in STD_LOGIC_VECTOR(1 downto 0);
            S : out STD_LOGIC
        );
    End Component;
    
    SIGNAL A, B : STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL Oper : STD_LOGIC_VECTOR(1 downto 0);
    SIGNAL S : STD_LOGIC;
    
begin

    UUT : Comparator_8
        PORT MAP(
            A => A,
            B => B,
            Oper => Oper,
            S => S
        );
    
    process
    begin
    
        Oper <= "00";
        A <= "01111111";
        B <= "00111111";
        wait for 5ns;
        
        A <= "11111111";
        B <= "10111111";
        wait for 5ns;
        
        A <= "11111111";
        B <= "11111111";
        wait for 5ns;
        ----------------------------------
        Oper <= "11";
        A <= "01111111";
        B <= "00111111";
        wait for 5ns;
                
        A <= "11111111";
        B <= "10111111";
        wait for 5ns;
        
        A <= "11111111";
        B <= "11111111";
        wait for 5ns;
        
        -----------------------------------
        Oper <= "01";
        A <= "01111111";
        B <= "00111111";
        wait for 5ns;
                
        A <= "11111111";
        B <= "10111111";
        wait for 5ns;
        
        A <= "11111111";
        B <= "11111111";
        wait for 5ns; 
        
        
        A <= "11111111";
        B <= "01111111";
        wait for 5ns; 
        ---------------------------------------       
        Oper <= "10";
        A <= "01111111";
        B <= "00111111";
        wait for 5ns;
                
        A <= "11111111";
        B <= "10111111";
        wait for 5ns;
        
        A <= "11111111";
        B <= "11111111";
        wait for 5ns;
        
        A <= "01111111";
        B <= "11111111";
        wait for 5ns;
        wait;
    
    end process;
    
end Behavioral;
