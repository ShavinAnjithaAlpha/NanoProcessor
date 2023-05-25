----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 05/24/2023 05:45:25 PM
-- Design Name: Register Bank
-- Module Name: Reg_Bank - Behavioral
-- Project Name: NanoProcessor 
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

entity Reg_Bank is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end Reg_Bank;

architecture Behavioral of Reg_Bank is

    Component Reg
        PORT (
            D : in STD_LOGIC_VECTOR(3 downto 0);
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;
            En : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR(3 downto 0)
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
        
        
    Reg_0 : Reg 
        PORT MAP(
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(0),
            Q => R0
        );
        
    Reg_1 : Reg 
        PORT MAP(
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(1),
            Q => R1
        );
        
    Reg_2 : Reg 
        PORT MAP(
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(2),
            Q => R2
        );
    
    Reg_3 : Reg 
        PORT MAP(
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(3),
            Q => R3
        );
        
    Reg_4 : Reg
        PORT MAP (
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(4),
            Q => R4
        );
        
    Reg_5 : Reg
        PORT MAP(
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(5),
            Q => R5
        );
        
    Reg_6 : Reg
        PORT MAP(
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(6),
            Q => R6
        );
        
    Reg_7 : Reg 
        PORT MAP(
            D => I,
            Clk => Clk,
            Rst => Rst,
            En => Decoder_Y(7),
            Q => R7
        );
        
end Behavioral;
