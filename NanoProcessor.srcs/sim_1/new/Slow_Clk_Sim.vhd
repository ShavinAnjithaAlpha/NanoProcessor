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
component Slow_Clk is 
    port (
        Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC);
end component;

signal Clk_in :  std_logic := '0';
signal Clk_out :  std_logic;

begin
UUT : Slow_Clk port map(
    Clk_in => Clk_in,
    Clk_out => Clk_out);

clock_process: process
begin
    Clk_in <= '0';
    WAIT FOR 5 ns;
    Clk_in <= '1';
    WAIT FOR 5 ns;
end process;
      
end Behavioral;