----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 10:50:49 PM
-- Design Name: 
-- Module Name: Add_Subtract_Sim - Behavioral
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

entity Add_Subtract_Sim is
--  Port ( );
end Add_Subtract_Sim;

architecture Behavioral of Add_Subtract_Sim is
component Add_Subtract
    port(
        A_in : in STD_LOGIC_VECTOR (3 downto 0);
        B_in : in STD_LOGIC_VECTOR (3 downto 0);
        S_out : out STD_LOGIC_VECTOR (3 downto 0);
        M : in STD_LOGIC;
        C_out : out STD_LOGIC;
        V : out STD_LOGIC
    );
end component;

    signal A_in, B_in, S_out: std_logic_vector(3 downto 0);
    signal M, v, C_out: std_logic;

begin

    UUT : Add_Subtract
        port map(
            A_in => A_in,
            B_in => B_in,
            M => M,
            S_out => S_out,
            V => V,
            C_out => C_out
        );

    process
    begin
        M <= '0';
    
        A_in <= "0000";
        B_in <= "0000";
        wait for 10ns;
        
        A_in <= "0001";
        B_in <= "0001";
        wait for 10ns;
        
        A_in <= "0010";
        B_in <= "0010";
        wait for 10ns;    
        
        A_in <= "0100";
        B_in <= "0100";
        wait for 10ns;    
        
        A_in <= "0100";
        B_in <= "0100";
        wait for 10ns;    
        
        A_in <= "0110";
        B_in <= "1100";
        wait for 10ns;    
        
        A_in <= "0111";
        B_in <= "1000";
        wait for 10ns;
    
    
    end process;
end Behavioral;
