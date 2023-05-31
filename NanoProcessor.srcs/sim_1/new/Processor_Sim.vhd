----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/30/2023 02:52:06 PM
-- Design Name: Processor Simulation
-- Module Name: Processor_Sim - Behavioral
-- Project Name: Nano-Processor
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

entity Processor_Sim is
--  Port ( );
end Processor_Sim;

architecture Behavioral of Processor_Sim is
Component Processor 
    PORT(
        Rst : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Carry : out STD_LOGIC;
        Zeroes : out STD_LOGIC;
        R7_out : out STD_LOGIC_VECTOR (3 downto 0));
End Component;

    SIGNAL Rst, Clk, Carry, Zeroes : STD_LOGIC;
    SIGNAL R7_out : STD_LOGIC_VECTOR(3 downto 0);

begin
    UUT : Processor
        PORT MAP(
            Rst => Rst,
            Clk => Clk,
            Carry => Carry,
            Zeroes => Zeroes,
            R7_out => R7_out);

    clk_process : process -- clock processor
        begin
            Clk <= '0';
            wait for 10ns;
            
            Clk <= '1';
            wait for 10ns;
    end process;
    
    processor_process : process -- main processor task
    begin
        
        Rst <= '1';
        wait; --wait forever
    
    end process;
end Behavioral;
