----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 12:31:56 PM
-- Design Name: 
-- Module Name: Multiplicator - Behavioral
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

entity Multiplicator is
    Port ( A_in : in STD_LOGIC_VECTOR (3 downto 0);
           B_in : in STD_LOGIC_VECTOR (3 downto 0);
           S_out : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplicator;

architecture Behavioral of Multiplicator is
    Component Adder_4Bit
        PORT (A_in : in STD_LOGIC_VECTOR (3 downto 0);
              B_in : in STD_LOGIC;
              Q : in STD_LOGIC_VECTOR (3 downto 0);
              S_out : out STD_LOGIC_VECTOR (3 downto 0); -- including MSB and three bits from rights
              LSB : out STD_LOGIC);
    End Component;

SIGNAL A_tmp, S_tmp1, S_tmp2 : STD_LOGIC_VECTOR(3 downto 0);

begin

    S_out(0) <= B_in(0) AND A_in(0);
    
    A_tmp(0) <= B_in(0) AND A_in(1);
    A_tmp(1) <= B_in(0) AND A_in(2);
    A_tmp(2) <= B_in(0) AND A_in(3);
    A_tmp(3) <= '0';

    Adder_0 : Adder_4Bit
        PORT MAP(
            A_in => A_tmp,
            B_in => B_in(1),
            Q => A_in,
            S_out => S_tmp1,
            LSB => S_out(1));
    
    Adder_1 : Adder_4Bit
        PORT MAP(
            A_in => S_tmp1,
            B_in => B_in(2),
            Q => A_in,
            S_out => S_tmp2,
            LSB => S_out(2));
    
    Adder_2 : Adder_4Bit
        PORT MAP(
            A_in => S_tmp2,
            B_in => B_in(3),
            Q => A_in,
            LSB => S_out(3));
    
end Behavioral;