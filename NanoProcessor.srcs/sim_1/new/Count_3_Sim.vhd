----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2023 10:55:12 AM
-- Design Name: 
-- Module Name: Count_3_Sim - Behavioral
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

entity Count_3_Sim is
--  Port ( );
end Count_3_Sim;

architecture Behavioral of Count_3_Sim is
Component Count_3
    PORT(
        Clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        Add_in : in STD_LOGIC_VECTOR (2 downto 0);
        Add_out : out STD_LOGIC_VECTOR (2 downto 0));
End Component;

    SIGNAL Add_in, Add_out : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL rst, Clk : STD_LOGIC := '0';

begin
    UUT : Count_3 PORT MAP(
        Add_in => Add_in,
        rst => rst,
        Clk => Clk,
        Add_out => Add_out);
        
    -- generating clock pulse is separate process
    clock_process: process
        begin
            Clk <= '0';
            WAIT FOR 5 ns;
            Clk <= '1';
            WAIT FOR 5 ns;
        end process;
            
    counter_process: process
        begin
            -- rst = 0 means output will  be same as input otherwise output will be 000
            rst <= '0';
            Add_in <= "000";
            wait for 10ns;
            
            Add_in <= "001";
            wait for 10ns;
            
            Add_in <= "010";
            wait for 10ns;
            
            Add_in <= "011";
            wait for 10ns;
            
            Add_in <= "100";
            wait for 10ns;
            
            Add_in <= "101";
            wait for 10ns;
            
            Add_in <= "110";
            wait for 10ns;
            
            Add_in <= "111";
            wait for 10ns;
            
            rst <= '1';
            wait for 10ns;
            rst <= '0';
            Add_in <= "000";
            wait for 10ns;
            
            Add_in <= "001";
            wait for 10ns;
            
            Add_in <= "110";
            wait for 10ns;
            
            wait; -- wait forever
            
        end process;
end Behavioral;
