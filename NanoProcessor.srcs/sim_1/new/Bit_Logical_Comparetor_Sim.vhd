----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 07:26:47 PM
-- Design Name: 
-- Module Name: Bit_Logical_Comparetor_Sim - Behavioral
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

entity Bit_Logical_Sim is
--  Port ( );
end Bit_Logical_Sim;

architecture Behavioral of Bit_Logical_Sim is
    
    Component Bit_Logic
        PORT(
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            S : out STD_LOGIC;
            M : in STD_LOGIC_VECTOR (1 downto 0));
    End Component;

SIGNAL M : STD_LOGIC_VECTOR(1 downto 0);
SIGNAL A,B,S : STD_LOGIC;

begin
    UUT : Bit_Logic
        PORT MAP(
            A => A,
            B => B,
            S => S,
            M => M);
        
    process
        begin 
        -- checking for AND gate
        M <= "00";
        A <= '0';
        B <= '0';
        wait for 10ns;
        
        A <= '0';
        B <= '1';
        wait for 10ns;
        
        A <= '1';
        B <= '0';
        wait for 10ns;
        
        A <= '1';
        B <= '1';
        wait for 10ns; 
        
        -- checking for OR gate
        M <= "01";
        A <= '0';
        B <= '0';
        wait for 10ns;
        
        A <= '0';
        B <= '1';
        wait for 10ns;
        
        A <= '1';
        B <= '0';
        wait for 10ns;
        
        A <= '1';
        B <= '1';
        wait for 10ns; 
        
        -- checking for NOT gate
        M <= "10";
        A <= '0';
        B <= '0';
        wait for 10ns;
        
        A <= '0';
        B <= '1';
        wait for 10ns;
        
        A <= '1';
        B <= '0';
        wait for 10ns;
        
        A <= '1';
        B <= '1';
        wait for 10ns; 
        
        -- checking for XOR gate
        M <= "11";
        A <= '0';
        B <= '0';
        wait for 10ns;
        
        A <= '0';
        B <= '1';
        wait for 10ns;
        
        A <= '1';
        B <= '0';
        wait for 10ns;
        
        A <= '1';
        B <= '1';
        wait;
        
        
    end process;
end Behavioral;
