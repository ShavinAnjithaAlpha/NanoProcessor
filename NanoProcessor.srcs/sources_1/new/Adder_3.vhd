----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2023 09:35:43 AM
-- Design Name: 
-- Module Name: Adder_3 - Behavioral
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

entity Adder_3 is
    Port ( A_in : in STD_LOGIC_VECTOR (2 downto 0);
           S_out : out STD_LOGIC_VECTOR (2 downto 0));
end Adder_3;

architecture Behavioral of Adder_3 is
Component FA
    PORT(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        C_in : in STD_LOGIC;
        S : out STD_LOGIC;
        C_out : out STD_LOGIC
    );
End Component;

    SIGNAL FA_C_out : STD_LOGIC_VECTOR(2 downto 0);

begin
        
    FA_0 : FA
        PORT MAP(
            A => A_in(0),
            B => '1',
            S =>  S_out(0),
            C_in => '0',
            C_out => FA_C_out(0));
    
    FA_1 : FA
        port map(
            A => A_in(1),
            B => '0',
            S =>  S_out(1),
            C_in => FA_C_out(0),
            C_out => FA_C_out(1));
        
    FA_2 : FA
        PORT MAP(
            A => A_in(2),
            B => '0',
            S =>  S_out(2),
            C_in => FA_C_out(1),
            C_out => FA_C_out(2));


end Behavioral;
