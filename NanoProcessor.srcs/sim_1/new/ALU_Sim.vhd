----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 06/04/2023 04:31:02 PM
-- Design Name: ALU Simulation
-- Module Name: ALU_Sim - Behavioral
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

entity ALU_Sim is
--  Port ( );
end ALU_Sim;

architecture Behavioral of ALU_Sim is
    
    Component ALU
        PORT (
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            Mode : in STD_LOGIC_VECTOR(1 downto 0);
            Oper : in STD_LOGIC_VECTOR(1 downto 0);
            Ovf : out STD_LOGIC;
            Zeroes :  out STD_LOGIC;
            Comp_out : out STD_LOGIC;
            S : out STD_LOGIC_VECTOR(3 downto 0)
        );
    End Component;
    
    SIGNAL A, B, S : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL Mode, Oper : STD_LOGIC_VECTOR(1 downto 0);
    SIGNAL Ovf, Zeroes, Comp_out : STD_LOGIC;
    
begin
    
    UUT : ALU
        PORT MAP(
            A => A,
            B => B,
            Mode => Mode,
            Oper => Oper,
            Ovf => Ovf,
            Zeroes => Zeroes,
            Comp_out => Comp_out,
            S => S
        );
        
    process
    begin
    
        A <= "1010";
        B <= "0101";
        Mode <= "00";
        Oper <= "00";
        wait for 5ns;
        
        Oper <= "01";
        wait for 5ns;
        
        Oper <= "10";
        wait for 5ns;
        
        Oper <= "11";
        wait for 5ns;
        
        ---------------------
        Mode <= "01";
        Oper <= "00";
        wait for 5ns;
        
        Oper <= "01";
        wait for 5ns;
        
        Oper <= "10";
        wait for 5ns;
        
        Oper <= "11";
        wait for 5ns;
        
        ---------------------
        Mode <= "11";
        Oper <= "00";
        wait for 5ns;
        
        Oper <= "01";
        wait for 5ns;
        
        Oper <= "10";
        wait for 5ns;
        
        Oper <= "11";
        wait for 5ns;
        
        --------------------
        Mode <= "10";
        Oper <= "11";
        wait for 5ns;
        
        Oper <= "00";
        wait for 5ns;
        
        wait; -- wait forever
    
    end process;

end Behavioral;
