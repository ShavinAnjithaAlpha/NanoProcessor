----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 05:53:28 PM
-- Design Name: 
-- Module Name: Add_Sub_Reg_Trf_Sim - Behavioral
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

entity Add_Sub_Reg_Trf_Sim is
--  Port ( );
end Add_Sub_Reg_Trf_Sim;

architecture Behavioral of Add_Sub_Reg_Trf_Sim is

    Component Add_Sub_Reg_Trf
        PORT ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Op : in STD_LOGIC_VECTOR (1 downto 0);
               S : out STD_LOGIC_VECTOR (3 downto 0);
               Ovf : out STD_LOGIC;
               Zeroes : out STD_LOGIC); 
    End Component;
    
    SIGNAL A, B, S : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL Op : STD_LOGIC_VECTOR(1 downto 0);
    SIGNAL Ovf, Zeroes : STD_LOGIC;
    
begin
    
    UUT : Add_Sub_Reg_Trf
        PORT MAP(
            A => A,
            B => B,
            S => S,
            Op => Op,
            Ovf => Ovf,
            Zeroes => Zeroes
        );
        
    process 
    begin
        
        A <= "1010";
        B <= "0101";
        Op <= "00";
        wait for 10ns;
        
        Op <= "01";
        wait for 10ns;
        
        Op <= "10";
        wait for 10ns;
        
        Op <= "11";
        wait for 10ns;
        
        wait; -- wait forever
    
    end process;

end Behavioral;
