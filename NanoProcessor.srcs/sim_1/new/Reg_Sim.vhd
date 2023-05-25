----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjith
-- Create Date: 05/24/2023 09:25:22 AM
-- Design Name: 4-bit Register Simulation
-- Module Name: Reg_Sim - Behavioral
-- Project Name: Nano Processor
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

entity Reg_Sim is
--  Port ( );
end Reg_Sim;

architecture Behavioral of Reg_Sim is
    
    Component Reg
        PORT (
            Clk : in STD_LOGIC;
            En : in STD_LOGIC;
            Rst : in STD_LOGIC;
            D : in STD_LOGIC_VECTOR(3 downto 0);
            Q : out STD_LOGIC_VECTOR(3 downto 0)
        );
    End Component;
    
    SIGNAL Clk, En, Rst : STD_LOGIC;
    SIGNAL D : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL Q : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    
    UUT : Reg PORT MAP (
        Clk => Clk,
        Rst => Rst,
        En => En,
        D => D,
        Q => Q
    ); 
    
    
    clock_process : process -- background clock process
    begin
    
        Clk <= '0';
        wait for 5ns;
        Clk <= '1';
        wait for 5ns;
    
    end process;
    
    reg_process : process
    begin
    
        En <= '0';
        D <= "0110";
        wait for 10ns;
        
        D <= "1010";
        wait for 10ns;
        
        En <= '1';
        wait for 10ns;
        
        D <= "0110";
        wait for 10ns;
        
        -- reset the register
        Rst <= '1';
        wait for 10ns;
        
        D <= "1110";
        wait for 10ns;
        
        wait; -- wait forever
    
    end process;

end Behavioral;
