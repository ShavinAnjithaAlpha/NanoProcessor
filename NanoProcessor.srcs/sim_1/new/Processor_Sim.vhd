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
        Ovf : out STD_LOGIC;
        Sign : out STD_LOGIC;
        Parity : out STD_LOGIC;
        Zeroes : out STD_LOGIC;
        R7_out : out STD_LOGIC_VECTOR (3 downto 0);
        Anode : out STD_LOGIC_VECTOR(3 downto 0);
        Seg_data : out STD_LOGIC_VECTOR(6 downto 0));
End Component;

    SIGNAL Rst, Clk, Ovf, Zeroes, Sign, Parity : STD_LOGIC;
    SIGNAL R7_out, Anode : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL Seg_data : STD_LOGIC_VECTOR(6 downto 0);

begin
    UUT : Processor
        PORT MAP(
            Rst => Rst,
            Clk => Clk,
            Ovf => Ovf,
            Zeroes => Zeroes,
            Sign => Sign,
            Parity => Parity,
            R7_out => R7_out,
            Seg_data => Seg_data,
            Anode => Anode);

    clk_process : process -- clock processor
        begin
            Clk <= '0';
            wait for 1ns;
            
            Clk <= '1';
            wait for 1ns;
    end process;
    
    processor_process : process -- main processor task
    begin
        
        Rst <= '1';
        wait for 10ns;
        Rst <= '0';
        wait; --wait forever
    
    end process;
end Behavioral;
