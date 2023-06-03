----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 07:28:39 PM
-- Design Name: 
-- Module Name: Logical_Comparetor - Behavioral
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

entity Logical_Unit is
    Port ( A_in : in STD_LOGIC_VECTOR (3 downto 0);
           B_in : in STD_LOGIC_VECTOR (3 downto 0);
           S_out : out STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC_VECTOR (1 downto 0));
end Logical_Unit;

architecture Behavioral of Logical_Unit is

    Component Bit_Logic
        PORT(
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            S : out STD_LOGIC;
            M : in STD_LOGIC_VECTOR (1 downto 0));
    End Component;


begin
    BLC_0 : Bit_Logic
        PORT MAP(
            A => A_in(0),
            B => B_in(0),
            S => S_out(0),
            M => M);
            
    BLC_1 : Bit_Logic
        PORT MAP(
            A => A_in(1),
            B => B_in(1),
            S => S_out(1),
            M => M);
            
    BLC_2 : Bit_Logic
        PORT MAP(
            A => A_in(2),
            B => B_in(2),
            S => S_out(2),
            M => M);
            
    BLC_3 : Bit_Logic
        PORT MAP(
            A => A_in(3),
            B => B_in(3),
            S => S_out(3),
            M => M);

end Behavioral;
