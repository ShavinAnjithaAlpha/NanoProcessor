----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 07:16:18 PM
-- Design Name: 
-- Module Name: Bit_Comparator_Sim - Behavioral
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

entity Bit_Comparator_Sim is
--  Port ( );
end Bit_Comparator_Sim;

architecture Behavioral of Bit_Comparator_Sim is
Component Bit_Comparetor
    PORT(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        M : in STD_LOGIC_VECTOR(1 downto 0);
        S : out STD_LOGIC
    );
End Component;

SIGNAL A, B, S : STD_LOGIC;
SIGNAL M : STD_LOGIC_VECTOR(1 downto 0);

begin

UUT : Bit_Comparetor
    PORT MAP(
        A => A,
        B => B,
        M => M,
        S => S);
        
    process
        begin
            -- checking equality
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
            
            -- checking if A > B
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
            
            -- checking if B > A
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
            
            -- checking non equality equality
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
