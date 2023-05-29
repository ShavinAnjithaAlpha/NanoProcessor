----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2023 10:12:20 AM
-- Design Name: 
-- Module Name: Adder_3_Sim - Behavioral
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

entity Adder_3_Sim is
--  Port ( );
end Adder_3_Sim;

architecture Behavioral of Adder_3_Sim is

component Adder_3
    port(
        A_in : in STD_LOGIC_VECTOR (2 downto 0);
        S_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal A_in, S_out : std_logic_vector(2 downto 0);

begin

UUT : Adder_3
    port map(
        A_in => A_in,
        S_out => S_out);

process
begin
    
    A_in <= "000";
    wait for 10ns;
    
    A_in <= "001";
    wait for 10ns;
        
    A_in <= "010";
    wait for 10ns;
    
    A_in <= "011";
    wait for 10ns;
        
    A_in <= "100";
    wait for 10ns;
    
    A_in <= "101";
    wait for 10ns; 
           
    A_in <= "110";
    wait for 10ns;
    
    A_in <= "111";
    wait;
    
end process;
end Behavioral;
