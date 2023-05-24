----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/24/2023 09:07:59 AM
-- Design Name: D Flip Flop Simulation
-- Module Name: D_FF_Sim - Behavioral
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

entity D_FF_Sim is
--  Port ( );
end D_FF_Sim;

architecture Behavioral of D_FF_Sim is

    Component D_FF 
        PORT (
            Clk : in STD_LOGIC;
            En : in STD_LOGIC;
            D : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    End Component;
    
    SIGNAL Clk, En, D : STD_LOGIC;
    SIGNAL Q : STD_LOGIC;
begin

    UUT : D_FF PORT MAP (
        Clk => Clk,
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
    
    D_FF_process : process -- flip flop process
    begin
        
        En <= '0';
        D <= '0';
        wait for 10ns;
        
        D <= '1';
        wait for 10ns;
        
        En <= '1';
        wait for 10ns;
        
        D <= '0';
        wait for 10ns;
        
        wait; -- wait forever
    
    end process;
    
end Behavioral;
