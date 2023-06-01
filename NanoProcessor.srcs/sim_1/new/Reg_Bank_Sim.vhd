----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/25/2023 11:01:55 AM
-- Design Name: Register Bank Simulation
-- Module Name: Reg_Bank_Sim - Behavioral
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

entity Reg_Bank_Sim is
--  Port ( );
end Reg_Bank_Sim;

architecture Behavioral of Reg_Bank_Sim is
    
    Component Reg_Bank
        PORT (
            I : in STD_LOGIC_VECTOR (3 downto 0);
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;
            Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
            R0 : out STD_LOGIC_VECTOR (3 downto 0);
            R1 : out STD_LOGIC_VECTOR (3 downto 0);
            R2 : out STD_LOGIC_VECTOR (3 downto 0);
            R3 : out STD_LOGIC_VECTOR (3 downto 0);
            R4 : out STD_LOGIC_VECTOR (3 downto 0);
            R5 : out STD_LOGIC_VECTOR (3 downto 0);
            R6 : out STD_LOGIC_VECTOR (3 downto 0);
            R7 : out STD_LOGIC_VECTOR (3 downto 0)
        ); 
    End Component;
    
    SIGNAL I : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL Clk, Rst : STD_LOGIC;
    SIGNAL Reg_En : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR(3 downto 0);
        
begin

    UUT : Reg_Bank
        PORT MAP(
            I => I,
            Clk => Clk,
            Rst => Rst,
            Reg_En => Reg_En,
            R0 => R0,
            R1 => R1,
            R2 => R2,
            R3 => R3,
            R4 => R4,
            R5 => R5,
            R6 => R6,
            R7 => R7
        );
        
    clock_process : process -- background clock process
    begin
     
        Clk <= '0';
        wait for 5ns;
        Clk <= '1';
        wait for 5ns;
        
    end process;
    
    reg_process : process -- register bank process
    begin
        
        -- Index 210077D = 0011 0011 0100 1001 1101
        -- Index 210134C = 0011 0011 0100 1101 0110
        
        I <= "1101";
        Reg_En <= "001";
        wait for 10ns;
        
        I <= "0110";
        Reg_En <= "010";
        wait for 10ns;
        
        -- reset the regsiter bank
        Rst <= '1';
        wait for 10ns;
        
        I <= "1001";
        Reg_En <= "011";
        wait for 10ns;
        
        I <= "1101";
        Reg_En <= "100";
        wait for 10ns;
        
        wait; -- wait forever
    
    end process;
end Behavioral;
