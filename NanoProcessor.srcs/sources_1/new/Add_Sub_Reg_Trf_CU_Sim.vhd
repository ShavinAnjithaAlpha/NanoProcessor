----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 12:54:22 AM
-- Design Name: 
-- Module Name: Add_Sub_Reg_Trf_CU_Sim - Behavioral
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

entity Add_Sub_Reg_Trf_CU_Sim is
--  Port ( );
end Add_Sub_Reg_Trf_CU_Sim;

architecture Behavioral of Add_Sub_Reg_Trf_CU_Sim is

    Component Add_Sub_Reg_Trf_CU
        PORT (
            Mode : in STD_LOGIC_VECTOR(1 downto 0);
            Oper : in STD_LOGIC_VECTOR(1 downto 0);
            S : out STD_LOGIC_VECTOR(1 downto 0)
        );
    End Component;
    
    SIGNAL Mode, Oper, S : STD_LOGIC_VECTOR(1 downto 0);
    
begin
    
    UUT : Add_Sub_Reg_Trf_CU
        PORT MAP(
            Mode => Mode,
            Oper => Oper,
            S => S
        );
        
    
    process
    begin
        
        Mode <= "11";
        Oper <= "00";
        wait for 5ns;
        
        Oper <= "01";
        wait for 5ns;
        
        Oper <= "11";
        wait for 5ns;
        
        Oper <= "10";
        wait for 5ns;
        
        -------------------
        Mode <= "00";
        Oper <= "00";
        wait for 5ns;
        
        Oper <= "01";
        wait for 5ns;
        
        Oper <= "10";
        wait for 5ns;
        
        Oper <= "11";
        wait for 5ns;
        
        -------------------
        Mode <= "10";
        Oper <= "11";
        wait for 5ns;
        
        Oper <= "00";
        wait for 5ns;
        
        Oper <= "01";
        wait for 5ns;
        
        Oper <= "10";
        wait for 5ns;
        
        -------------------
        Mode <= "01";
        Oper <= "00";
        wait for 5ns;
        
        Oper <= "01";
        wait for 5ns;
        
        Oper <= "11";
        wait for 5ns;
        
        Oper <= "10";
        wait for 5ns;
        
        wait; -- wait forever
    
    end process;

end Behavioral;
