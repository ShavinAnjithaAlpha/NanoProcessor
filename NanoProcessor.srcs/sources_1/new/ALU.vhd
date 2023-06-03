----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 06/04/2023 01:07:52 AM
-- Design Name: Arithmetic And Logic Unit
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Mode : in STD_LOGIC_VECTOR (1 downto 0);
           Oper : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           comp_out : out STD_LOGIC;
           Ovf : out STD_LOGIC;
           Zeroes : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

    Component Add_Sub_Reg_Trf
        PORT (
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            Op : in STD_LOGIC_VECTOR(1 downto 0);
            S : out STD_LOGIC_VECTOR(3 downto 0);
            Ovf : out STD_LOGIC;
            Zeroes : out STD_LOGIC
        );
    End Component;
    
    Component Add_Sub_Reg_Trf_CU
        PORT (
            Mode : in STD_LOGIC_VECTOR(1 downto 0);
            Oper : in STD_LOGIC_VECTOR(1 downto 0);
            S : out STD_LOGIC_VECTOR(1 downto 0)
        );
    End Component;
    
    
    Component Logical_Unit
        PORT (
            A_in : in STD_LOGIC_VECTOR(3 downto 0);
            B_in : in STD_LOGIC_VECTOR(3 downto 0);
            S_out : out STD_LOGIC_VECTOR(3 downto 0);
            M : in STD_LOGIC_VECTOR(1 downto 0)
        );
    End Component;
    
    Component Comparator
        PORT (
            A_in : in STD_LOGIC_VECTOR(3 downto 0);
            B_in : in STD_LOGIC_VECTOR(3 downto 0);
            M : in STD_LOGIC_VECTOR(1 downto 0);
            S_out : out STD_LOGIC
        );
    End Component;
    
    Component ALU_Mux
        PORT ( Add_Sub_Bus : in STD_LOGIC_VECTOR (3 downto 0);
               Logic_Bus : in STD_LOGIC_VECTOR (3 downto 0);
               Mul_Bus : in STD_LOGIC_VECTOR (3 downto 0);
               Mode : in STD_LOGIC_VECTOR (1 downto 0);
               Op : in STD_LOGIC_VECTOR (1 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    End Component;
    
    SIGNAL add_sub_op : STD_LOGIC_VECTOR(1 downto 0);
    SIGNAL add_sub_out, logic_out, mul_out : STD_LOGIC_VECTOR( 3 downto 0);
    
begin

    -- create the add-subtracter-register-transfer Cintrol Unit
    Add_Sub_Reg_Trf_CU_0 : Add_Sub_Reg_Trf_CU 
        PORT MAP(
            Mode => Mode,
            Oper => Oper,
            S => add_sub_op
        );
    
    Add_Sub_Reg_Trf_0 : Add_Sub_Reg_Trf
        PORT MAP(
            A => A,
            B => B,
            Op => add_sub_op,
            S => add_sub_out,
            Ovf => Ovf,
            Zeroes => Zeroes
        );
        
    Comparator_0 : Comparator
        PORT MAP(
            A_in => A,
            B_in => B,
            M => Oper,
            S_out => comp_out
        );
        
    Logic_Unit_0 : Logical_Unit
        PORT MAP(
            A_in => A,
            B_in => B,
            M => Oper,
            S_out => logic_out
        );
        
   mul_out <= "1111";
   
   ALU_Mux_0 : ALU_Mux
    PORT MAP(
        Add_Sub_Bus => add_sub_out,
        Logic_Bus => logic_out,
        Mul_Bus => mul_out,
        Mode => Mode,
        Op => Oper,
        Y => S
    );

end Behavioral;
