----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/23/2023 12:31:23 AM
-- Design Name: FA Sim
-- Module Name: FA_Sim - Behavioral
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

entity FA_Sim is
--  Port ( );
end FA_Sim;

architecture Behavioral of FA_Sim is

    Component FA 
        PORT (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            C_in : in STD_LOGIC;
            S : out STD_LOGIC;
            C_out : out STD_LOGIC
        );
    End Component;
    
    SIGNAL A, B, C_in : STD_LOGIC; -- input signals
    SIGNAL S, C_out : STD_LOGIC; -- output signals
    
begin

    UUT : FA PORT MAP (
        A => A,
        B => B,
        C_in => C_in,
        S => S,
        C_out => C_out
    );
    
    process
    begin
    
        -- set the A and B values
        A <= '0';
        B <= '0';
        C_in <= '0';
        wait for 10ns;
        
        A <= '1';
        wait for 10ns;
        
        B <= '1';
        wait for 10ns;
        
        A <= '0';
        WAIT FOR 10ns;
        
        C_in <= '1';
        wait for 10ns;
        
        B <= '0';
        wait for 10ns;
        
        A <= '1';
        wait for 10ns;
        
        B <= '1';
        wait for 10ns;
        
        wait; -- wait forever
        
     end process;

end Behavioral;
