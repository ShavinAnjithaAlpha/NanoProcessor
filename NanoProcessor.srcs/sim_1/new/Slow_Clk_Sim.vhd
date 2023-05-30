----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2023 03:39:22 PM
-- Design Name: 
-- Module Name: Slow_Clk_Sim - Behavioral
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

entity Slow_Clk_Sim is
--  Port ( );
end Slow_Clk_Sim;

architecture Behavioral of Slow_Clk_Sim is
Component Slow_Clk is 
    PORT (
        Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC);
End Component;

    SIGNAL Clk_in :  STD_LOGIC := '0';
    SIGNAL Clk_out :  STD_LOGIC;

begin
    UUT : Slow_Clk 
        PORT MAP(
        Clk_in => Clk_in,
        Clk_out => Clk_out);

    clock_process: process
    begin
    
        Clk_in <= '0';
        wait for 5 ns;
        Clk_in <= '1';
        wait for 5 ns;
        
    end process;
      
end Behavioral;