----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 10:50:49 PM
-- Design Name: 
-- Module Name: Add_Subtract_Sim - Behavioral
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

entity Add_Subtract_Sim is
--  Port ( );
end Add_Subtract_Sim;

architecture Behavioral of Add_Subtract_Sim is
Component Add_Subtract
    PORT(
        A_in : in STD_LOGIC_VECTOR (7 downto 0);
        B_in : in STD_LOGIC_VECTOR (7 downto 0);
        S_out : out STD_LOGIC_VECTOR (7 downto 0);
        M : in STD_LOGIC;
        Ovf : out STD_LOGIC;
        Zeroes : out STD_LOGIC
    );
End Component;

    SIGNAL A_in, B_in, S_out: STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL M, Ovf, Zeroes: STD_LOGIC;

begin

    UUT : Add_Subtract
        PORT MAP(
            A_in => A_in,
            B_in => B_in,
            M => M,
            S_out => S_out,
            Ovf => Ovf,
            Zeroes => Zeroes
        );

    process
    begin
        M <= '0';
    
        A_in <= "00000000";
        B_in <= "00000000";
        wait for 10ns;
        
        A_in <= "00000001";
        B_in <= "00000001";
        wait for 10ns;
        
        A_in <= "00000010";
        B_in <= "00000010";
        wait for 10ns;    
        
        A_in <= "00000100";
        B_in <= "00000100";
        wait for 10ns;    
        
        A_in <= "00000100";
        B_in <= "00000100";
        wait for 10ns;    
        
        A_in <= "00000110";
        B_in <= "00001100";
        wait for 10ns;    
        
        A_in <= "00000111";
        B_in <= "10000000";
        wait for 10ns;
    
    
    end process;
end Behavioral;
