----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 06/09/2023 05:53:04 PM
-- Design Name: 8-bit 8-regsiter bank
-- Module Name: Reg_Bank_8 - Behavioral
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

entity Reg_Bank_8 is
    Port ( I : in STD_LOGIC_VECTOR (7 downto 0);
           Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           R0 : out STD_LOGIC_VECTOR (7 downto 0);
           R1 : out STD_LOGIC_VECTOR (7 downto 0);
           R2 : out STD_LOGIC_VECTOR (7 downto 0);
           R3 : out STD_LOGIC_VECTOR (7 downto 0);
           R4 : out STD_LOGIC_VECTOR (7 downto 0);
           R5 : out STD_LOGIC_VECTOR (7 downto 0);
           R6 : out STD_LOGIC_VECTOR (7 downto 0);
           R7 : out STD_LOGIC_VECTOR (7 downto 0));
end Reg_Bank_8;

architecture Behavioral of Reg_Bank_8 is
    Component Reg_8
        PORT (
            D : in STD_LOGIC_VECTOR(7 downto 0);
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;
            En : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR(7 downto 0)
        );
    End Component;
    
    Component Decoder_3_to_8
        PORT (
            I : in STD_LOGIC_VECTOR (2 downto 0);
            En : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0)
        );
    End Component;
    
    SIGNAL Decoder_Y : STD_LOGIC_VECTOR(7 downto 0);
    
begin
    Decoder_3_to_8_0 : Decoder_3_to_8 
        PORT MAP(
            I => Reg_En,
            En => '1',
            Y => Decoder_Y
        );
        
        
    R0 <= "00000000"; -- register 1 value is always 0000 and its read only regsiter
    
        
    Reg_1 : Reg_8
        PORT MAP(
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(1),
            Q => R1
        );
        
    Reg_2 : Reg_8 
        PORT MAP(
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(2),
            Q => R2
        );
    
    Reg_3 : Reg_8 
        PORT MAP(
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(3),
            Q => R3
        );
        
    Reg_4 : Reg_8
        PORT MAP (
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(4),
            Q => R4
        );
        
    Reg_5 : Reg_8
        PORT MAP(
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(5),
            Q => R5
        );
        
    Reg_6 : Reg_8
        PORT MAP(
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(6),
            Q => R6
        );
        
    Reg_7 : Reg_8
        PORT MAP(
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(7),
            Q => R7
        );

end Behavioral;
